unit uBatidaPonto;

interface

uses
  uRotinas_Nitgen,
  Windows,
  Messages,
  SysUtils,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  ExtCtrls,
  StdCtrls,
  Focus,
  Menus,
  ComCtrls,
  Grids,
  DBGrids,
  DB,
  ADODB;

type
  Tfm_Batida_Ponto = class(TForm)
    pn_Principal: TPanel;
    cpg_GroupInferior: TCategoryPanelGroup;
    cp_Hora: TCategoryPanel;
    cpg_GroupMeio: TCategoryPanelGroup;
    cp_grid_Horario_Dia: TCategoryPanel;
    dbg_Batida: TDBGrid;
    Panel1: TPanel;
    ed_Hora: TLabel;
    ed_Minuto: TLabel;  ed_dois_pontos: TLabel;
    Panel2: TPanel;
    ed_Data: TLabel;
    pm_Comando: TPopupMenu;
    mi_Encerrar: TMenuItem;
    ed_segundo: TLabel;
    sp_consistir_batida_ponto: TADOStoredProc;
    ds_Batida_Dia_Func: TDataSource;
    qy_Batida_Dia_Func: TADOQuery;
    mm_historico_oper: TMemo;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure tr_RelogioTimer(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure dbg_BatidaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure mi_EncerrarClick(Sender: TObject);
  private
    procedure AtualizarHorario;
    procedure ExecutaSQLCons(pNr_Seq_Funcionario:integer);
    procedure InserirBatida;
    procedure AddOperacao(pTexto:string);
    { Private declarations }
  public
    vNitgen:TNitgen;
    { Public declarations }
  end;

var
  fm_Batida_Ponto: Tfm_Batida_Ponto;

implementation

uses
  uUtils,
  uMensagem,
  Variants,
  uDataModule,
  uManipulacaoDados,
  uUtilsDatabase,
  uVarGlobal;

{$R *.dfm}

procedure Tfm_Batida_Ponto.dbg_BatidaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (ssCtrl in Shift) and (Key = VK_DELETE) then
    Key := 0;
  if (ssAlt in Shift) and (Key = VK_F4) then
    Key := 0;
  if (ssCtrl in Shift) and (ssAlt in Shift) and (Key = VK_DELETE) then
    Key := 0;
  if (ssCtrl in Shift) and (ssShift in Shift) and (Key = VK_ESCAPE) then
    Key := 0;
end;

procedure Tfm_Batida_Ponto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  vNitgen.Free;
  Action := caFree;
end;

procedure Tfm_Batida_Ponto.FormCreate(Sender: TObject);
var
  r:TRect;
begin
  try
    InstalarFonte;
    qy_Batida_Dia_Func.Connection := Banco_dm.Conexao_banco_aco;
    dbg_Batida.Columns[1].Width := Screen.Width - 35 - (dbg_Batida.Columns[0].Width + dbg_Batida.Columns[2].Width + dbg_Batida.Columns[3].Width);

    Borderstyle       := bsNone;
    SystemParametersInfo(SPI_GETWORKAREA, 0, @r,0) ;
    SetBounds(r.Left, r.Top, r.Right-r.Left, r.Bottom-r.Top) ;

    vNitgen := TNitgen.Create;
    vNitgen.Comparar;

    ExecutaSQLCons(0);

    if not vNitgen.InicializarLeitor(False) then
    begin
      //vNitgen.Free;
      AddOperacao('Leitor biométrico não encontrado.')
    end
    else
    begin
      CarregarDigitaisLeitor(vNitgen,0,true); {0 = Todos}
    end;

  except
    on E:Exception do
      Erro(Self.ClassName,'FormCreate',E.Message,false,True,E);
  end;
end;

procedure Tfm_Batida_Ponto.FormResize(Sender: TObject);
begin
  try
    cp_grid_Horario_Dia.Height := cpg_GroupMeio.Height;
  except
    on E:Exception do
      Erro(Self.ClassName,'FormResize',E.Message,False,True,E);
  end;
end;

procedure Tfm_Batida_Ponto.tr_RelogioTimer(Sender: TObject);
var
  vCod_Erro:integer;
  vMSG_Erro:string;
begin
  try
    AtualizarHorario;
    if (vNitgen.DedoDetectado) then
    begin
      vMSG_Erro := '';
      vCod_Erro := 0;

      vNitgen.Timer.Enabled := false;
      vNitgen.DedoDetectado := false;  {Ja leu..}

      Application.CreateForm(Tfm_Mensagem,fm_Mensagem);

      if (vNitgen.GetUltFuncIdenticado > 0) then
      begin
        sp_consistir_batida_ponto.Prepared := true;
        sp_consistir_batida_ponto.Parameters.ParamByName('p_nr_seq_funcionario').Value := vNitgen.GetUltFuncIdenticado;
        sp_consistir_batida_ponto.ExecProc;
        vMSG_Erro := VarToStrDef(sp_consistir_batida_ponto.Parameters.ParamByName('p_erro').Value,'');
        vCod_Erro := StrToInt(VarToStrDef(sp_consistir_batida_ponto.Parameters.ParamByName('p_cod_erro').Value,'0'));
        sp_consistir_batida_ponto.Prepared := false;
      end;

      if ((vNitgen.GetUltFuncIdenticado > 0) and (vMSG_Erro = '') and (vCod_Erro = 0)) then
      begin
        InserirBatida;
        ExecutaSQLCons(vNitgen.UltFuncIdenticado);
      end;

      fm_Mensagem.Show;
      fm_Mensagem.AddMsg(vMSG_Erro,vNitgen.GetUltFuncIdenticado,vCod_Erro);
      cp_grid_Horario_Dia.Caption := 'Registros do dia do funcionário '+AnsiUpperCase(VarToStrDef(Busca_Valor('funcionario','nm_funcionario','nr_sequencia',IntToStr(vNitgen.GetUltFuncIdenticado)),''));

      if (vMSG_Erro = '') then
      begin
        Sleep(3000);
      end
      else
      begin
        Sleep(7000);
      end;

      Application.ProcessMessages;
      fm_Mensagem.Close;
      vNitgen.UltFuncIdenticado  := 0; {Ja identificou..}
      vNitgen.Timer.Enabled := true;
    end;
  except
    on E:Exception do
    begin
      Erro(Self.ClassName,'tr_RelogioTimer',E.Message,false,true,E);
      vNitgen.Timer.Enabled := true;
      vNitgen.UltFuncIdenticado  := 0; {Ja identificou..}
      fm_Mensagem.Close;
    end;
  end;
end;

procedure Tfm_Batida_Ponto.AddOperacao(pTexto: string);
begin
  mm_historico_oper.Lines.Add('['+DateTimeToStr(now)+'] '+ pTexto);
end;

procedure Tfm_Batida_Ponto.AtualizarHorario;
begin
  try
    ed_data.Caption    := vNitgen.GetDate;
    ed_hora.Caption    := vNitgen.GetHora;
    ed_minuto.Caption  := vNitgen.GetMinuto;
    ed_segundo.Caption := vNitgen.GetSegundo;
    ed_dois_pontos.Visible := ed_segundo.Caption <> '00';
    if not ed_dois_pontos.Visible then
      ed_minuto.font.Style := [fsBold]
    else
      ed_minuto.font.Style := [];

    if (ed_minuto.Caption = '59') then
      ed_hora.font.Style := [fsBold]
    else
      ed_hora.font.Style := [];
  except
    on E:Exception do
      Erro(Self.ClassName,'AtualizarHorario',E.Message,false,true,E)
  end;
end;

procedure Tfm_Batida_Ponto.ExecutaSQLCons(pNr_Seq_Funcionario:integer);
begin
  try
    qy_Batida_Dia_Func.Close;
    qy_Batida_Dia_Func.SQL.Clear;

    dbg_Batida.Columns[3].Visible := pNr_Seq_Funcionario > 0;

    qy_Batida_Dia_Func.SQL.Add('select ');
    if (pNr_Seq_Funcionario > 0) then
    begin
      qy_Batida_Dia_Func.SQL.Add('      case mod(rank()over(order by b.dt_batida),2)');
      qy_Batida_Dia_Func.SQL.Add('        when 0 then ''Saída'' else ''Entrada'' end Ent_Sai,');
    end;
    qy_Batida_Dia_Func.SQL.Add('        a.nm_funcionario,');
    qy_Batida_Dia_Func.SQL.Add('        b.nr_seq_funcionario, ');
		qy_Batida_Dia_Func.SQL.Add('        to_char(b.dt_batida,''HH24:MI:SS'')::varchar(255) hr_batida');
    qy_Batida_Dia_Func.SQL.Add('from 	  funcionario a,');
    qy_Batida_Dia_Func.SQL.Add('		    funcionario_ponto b');
    qy_Batida_Dia_Func.SQL.Add('where 	a.nr_sequencia 		  = b.nr_seq_funcionario');
    qy_Batida_Dia_Func.SQL.Add('and		  date(b.dt_batida)   = current_date');
    if (pNr_Seq_Funcionario > 0) then
      qy_Batida_Dia_Func.SQL.Add('and		  a.nr_sequencia   = '+IntToStr(pNr_Seq_Funcionario));
    qy_Batida_Dia_Func.SQL.Add('order by b.dt_batida');
    qy_Batida_Dia_Func.Open;
    qy_Batida_Dia_Func.Last;
  except
    on E:Exception do
      Erro(Self.ClassName,'ExecutaSQLCons',E.Message,false,true,E)
  end;
end;

procedure Tfm_Batida_Ponto.InserirBatida;
var
  vFuncionario:TFuncionario_Ponto;
begin
  try
    vFuncionario := TFuncionario_Ponto.Create;
    try
      with vFuncionario do
      begin
        nr_seq_funcionario := vNitgen.GetUltFuncIdenticado;
        dt_batida          := now;
        Nm_Usuario_Criacao := Banco_dm.BancoAttributes.User_Admin;
        Dt_Criacao         := now;
        ie_desconsiderar_forcar_entrada_turno := false;
        Gravar;
      end;
    finally
      vFuncionario.Free;
    end;
  except
    on E:Exception do
      Erro(Self.ClassName,'InserirBatida',#13+'Registro NÃO foi salvo!'+#13+E.Message,true,true,E)
  end;
end;

procedure Tfm_Batida_Ponto.mi_EncerrarClick(Sender: TObject);
begin
  Close;
end;

end.
