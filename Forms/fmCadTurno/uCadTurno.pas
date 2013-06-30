unit uCadTurno;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Variants,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  uPadrao,
  ExtCtrls,
  ComCtrls,
  uDataModule,
  DB,
  ADODB,
  Grids,
  DBGrids,
  StdCtrls,
  Focus,
  CheckLst,
  Mask,
  uManipulacaoDados,
  Menus;

type
  Tfm_Cad_Turno = class(Tfm_Padrao)
    pc_Principal: TPageControl;
    ts_Consulta: TTabSheet;
    ts_Cadastro: TTabSheet;
    gb_Codigo_Sequencial: TGroupBox;
    Label11: TLabel;
    ed_nr_sequencia: TFocusButtonedEdit;
    pm_Turno: TPopupMenu;
    mi_Consultar: TMenuItem;
    pc_Dados: TPageControl;
    ts_Parâmetros_Turno: TTabSheet;
    ts_Restricoes: TTabSheet;
    gb_Dados: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label3: TLabel;
    ed_ds_turno: TFocusButtonedEdit;
    ed_hr_Final: TFocusEdit;
    ed_Qt_tempo_desconto_dia: TFocusEdit;
    ed_Qt_tempo_desconto_intervalo: TFocusEdit;
    ed_hr_Inicial: TFocusEdit;
    GroupBox1: TGroupBox;
    Label7: TLabel;
    ed_Hr_Inicial_Impedimento: TFocusEdit;
    Label8: TLabel;
    ed_Hr_Final_Impedimento: TFocusEdit;
    Panel3: TPanel;
    bt_Consultar: TButton;
    Panel1: TPanel;
    bt_Primeiro: TButton;
    bt_Anterior: TButton;
    bt_Proximo: TButton;
    bt_Ultimo: TButton;
    bt_Novo: TButton;
    bt_Salvar: TButton;
    bt_Cancelar: TButton;
    bt_Excluir: TButton;
    clb_Vigencia: TFocusCheckListBox;
    Label5: TLabel;
    Panel2: TPanel;
    bt_Novo_Restricao: TButton;
    bt_Salvar_Restricao: TButton;
    bt_Excluir_Restricao: TButton;
    ed_ds_motivo: TFocusEdit;
    Label9: TLabel;
    GroupBox2: TGroupBox;
    dbg_Impedimento: TDBGrid;
    GroupBox3: TGroupBox;
    dbg_Turno: TDBGrid;
    qy_Lista_Turno: TADOQuery;
    qy_Impedimento: TADOQuery;
    ds_Lista_Turno: TDataSource;
    ds_Impedimento: TDataSource;

    procedure bt_ConsultarClick(Sender: TObject);
    procedure bt_CancelarClick(Sender: TObject);
    procedure bt_ProximoClick(Sender: TObject);
    procedure bt_AnteriorClick(Sender: TObject);
    procedure bt_UltimoClick(Sender: TObject);
    procedure bt_PrimeiroClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bt_SalvarClick(Sender: TObject);
    procedure bt_NovoClick(Sender: TObject);
    procedure pm_TurnoPopup(Sender: TObject);
    procedure bt_ExcluirClick(Sender: TObject);
    procedure ed_nr_sequenciaChange(Sender: TObject);
    procedure mi_ConsultarClick(Sender: TObject);
    procedure dbg_TurnoDblClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure bt_Novo_RestricaoClick(Sender: TObject);
    procedure bt_Salvar_RestricaoClick(Sender: TObject);
    procedure bt_Excluir_RestricaoClick(Sender: TObject);
  private
    procedure ExecutarConsulta(pOrderBy:string);
    procedure Carregar(pNr_Sequencia:integer);
    procedure Salvar(pNr_Sequencia:integer);
    procedure AtualizaConsultaRestricao;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fm_Cad_Turno: Tfm_Cad_Turno;

implementation

uses
  uUtils,
  Generics.Collections,
  uUtilsDatabase;

{$R *.dfm}

procedure Tfm_Cad_Turno.AtualizaConsultaRestricao;
begin
  if vTurno.Nr_Sequencia > 0 then
  begin
    qy_Impedimento.Close;
    qy_Impedimento.Parameters.ParamByName('nr_seq_turno').Value := vTurno.Nr_Sequencia;
    qy_Impedimento.Open;
  end
  else
    qy_Impedimento.Close;
end;

procedure Tfm_Cad_Turno.bt_AnteriorClick(Sender: TObject);
begin
  inherited;
  if ed_Nr_Sequencia.Text = '' then
    Carregar(vTurno.Primeiro)
  else
    Carregar(vTurno.Anterior(StrToIntDef(ed_Nr_Sequencia.Text,0)));
end;

procedure Tfm_Cad_Turno.bt_CancelarClick(Sender: TObject);
begin
  inherited;
  Carregar(StrToIntDef(ed_Nr_Sequencia.Text,0));
end;

procedure Tfm_Cad_Turno.bt_ConsultarClick(Sender: TObject);
begin
  inherited;
  ExecutarConsulta('');
  //AutoSizeDbGridCol(dbg_Turno);
end;

procedure Tfm_Cad_Turno.bt_ExcluirClick(Sender: TObject);
begin
  inherited;
  if MessageBox('Confirmar a exclusão do turno "'+ed_ds_turno.Text+'" ?',mConfirmation,bmYES_NO) =ID_YES then
    if vTurno.Deletar(StrToIntDef(ed_Nr_Sequencia.Text,0)) then
      LimparCampos(Self,0);
end;

procedure Tfm_Cad_Turno.bt_Excluir_RestricaoClick(Sender: TObject);
var
  qy_temp:TADOQuery;
begin
  try
    if MessageBox('Confirmar exclusão da restrição de '+qy_Impedimento.FieldByName('hr_inicial').AsString+
                  ' até '+qy_Impedimento.FieldByName('hr_final').AsString+' ?',mConfirmation,bmYES_NO) = IDYES
    then
    begin
      qy_temp := InstanciarQuery;
      if not (GridIsNull(dbg_Impedimento)) then
      begin
        qy_temp.SQL.Add('delete from turno_restricao where nr_sequencia = '+qy_Impedimento.FieldByName('nr_sequencia').AsString);
        qy_temp.ExecSQL;
      end;
      AtualizaConsultaRestricao;
      Salvar(vTurno.Nr_Sequencia);
    end;
  finally
    qy_temp.Free;
  end;
end;

procedure Tfm_Cad_Turno.bt_NovoClick(Sender: TObject);
begin
  try
    pc_Principal.ActivePage := ts_Cadastro;
    pc_Dados.ActivePage := ts_Parâmetros_Turno;
    SetPropertyAttributes(vListaCompObr,'obrigatorio',false);
    LimparCampos(Self,0);
    LimparCampos(Self,1);
    ed_ds_turno.SetFocus;
    bt_Salvar.Enabled := true;
    SetPropertyAttributes(vListaCompObr,'obrigatorio',true);
  except
    on E:Exception do
      Erro(Self.ClassName,'bt_NovoClick',E.Message,True,True,E);
  end;
end;

procedure Tfm_Cad_Turno.bt_Novo_RestricaoClick(Sender: TObject);
begin
  inherited;
  LimparCampos(Self,1);
  ed_Hr_Inicial_Impedimento.SetFocus;
end;

procedure Tfm_Cad_Turno.bt_PrimeiroClick(Sender: TObject);
begin
  inherited;
  Carregar(vTurno.Primeiro);
end;

procedure Tfm_Cad_Turno.bt_ProximoClick(Sender: TObject);
begin
  inherited;
  if ed_Nr_Sequencia.Text = '' then
    Carregar(vTurno.Ultimo)
  else
    Carregar(vTurno.Proximo(StrToIntDef(ed_Nr_Sequencia.Text,0)));
end;

procedure Tfm_Cad_Turno.bt_SalvarClick(Sender: TObject);
begin
  Salvar(vTurno.Nr_Sequencia);
end;

procedure Tfm_Cad_Turno.bt_Salvar_RestricaoClick(Sender: TObject);
var
  qy_temp:Tadoquery;
begin
  try
    try
      if Campo_Invalido(Self,1) then
        Exit;

//      if StrToTime(ed_Hr_Inicial_Impedimento.Text) >= StrToTime(ed_Hr_Final_Impedimento.Text) then
//      begin
//        Erro(Self.ClassName,'bt_Salvar_RestricaoClick','A hora inicial deve ser MENOR que a hora final para que haja um período válido',True,False,Nil);
//        Exit;
//      end;

      qy_temp := InstanciarQuery;
      qy_temp.SQL.Add('insert into turno_restricao (hr_inicial,hr_final,nm_usuario_criacao,dt_criacao,nr_seq_turno,ds_motivo');
      qy_temp.SQL.Add(') values (');
      qy_temp.SQL.Add(QuotedStr(ed_Hr_Inicial_Impedimento.Text)+','+
                      QuotedStr(ed_Hr_Final_Impedimento.Text)+','+
                      QuotedStr(Banco_dm.BancoAttributes.User_ID)+','+
                      QuotedStr(DateTimeToStr(now))+','+
                      IntToStr(vTurno.Nr_Sequencia)+','+
                      QuotedStr(ed_ds_motivo.Text)+')');
      qy_temp.ExecSQL;
      AtualizaConsultaRestricao;
      Salvar(vTurno.Nr_Sequencia);
    finally
      qy_temp.Free;
    end;
  except
    on E:Exception do
      Erro(Self.ClassName,'bt_Salvar_RestricaoClick',E.Message,True,True,E);
  end;
end;

procedure Tfm_Cad_Turno.bt_UltimoClick(Sender: TObject);
begin
  inherited;
  Carregar(vTurno.Ultimo);
end;

procedure Tfm_Cad_Turno.Carregar(pNr_Sequencia: integer);
var
  bAtivar:boolean;
begin
  try
    SetPropertyAttributes(vListaCompObr,'color',clWindow);
    vTurno.Select(pNr_Sequencia);
    bAtivar := vTurno.Nr_Sequencia > 0;

    if bAtivar then
      ed_Nr_Sequencia.Text         := IntToStr(vTurno.Nr_Sequencia);

    ed_ds_turno.Text               := vTurno.Ds_Turno;
    ed_Qt_tempo_desconto_dia.Text  := DateTimeToStrTime(vTurno.Qt_tempo_desconto_dia);
    ed_Qt_tempo_desconto_intervalo.Text := DateTimeToStrTime(vTurno.qt_tempo_desconto_intervalo);

    ed_hr_Inicial.Text             := DateTimeToStrTime(vTurno.Hr_Inicial);
    ed_hr_Final.Text               := DateTimeToStrTime(vTurno.Hr_Final);

    clb_Vigencia.Checked[0]        := vTurno.Ie_domingo;
    clb_Vigencia.Checked[1]        := vTurno.Ie_segunda_feira;
    clb_Vigencia.Checked[2]        := vTurno.Ie_terca_feira;
    clb_Vigencia.Checked[3]        := vTurno.Ie_quarta_feira;
    clb_Vigencia.Checked[4]        := vTurno.Ie_quinta_feira;
    clb_Vigencia.Checked[5]        := vTurno.Ie_sexta_feira;
    clb_Vigencia.Checked[6]        := vTurno.Ie_sabado;

    bt_Excluir.Enabled             := bAtivar;
    bt_Salvar.Enabled              := bAtivar;
    bt_Cancelar.Enabled            := bAtivar;

    AtualizaConsultaRestricao;

    bt_Excluir_Restricao.Enabled   := (bAtivar) and (not GridIsNull(dbg_Impedimento));
    bt_Novo_Restricao.Enabled      := bAtivar;
    bt_Salvar_Restricao.Enabled    := bAtivar;
  except
    on E:Exception do
      Erro(Self.ClassName,'Carregar',E.Message,True,True,E);
  end;
end;

procedure Tfm_Cad_Turno.dbg_TurnoDblClick(Sender: TObject);
begin
  inherited;
  if (not GridIsNull(dbg_Turno)) then
  begin
    Carregar(qy_Lista_Turno.FieldByName('NR_SEQUENCIA').AsInteger);
    pc_Principal.ActivePage := ts_Cadastro;
  end;
end;

procedure Tfm_Cad_Turno.ed_nr_sequenciaChange(Sender: TObject);
begin
  inherited;
  Carregar(StrToIntDef(ed_Nr_Sequencia.Text,0));
end;

procedure Tfm_Cad_Turno.ExecutarConsulta(pOrderBy: string);
begin
  qy_Lista_Turno.Close;
  qy_Lista_Turno.SQL.Clear;
  qy_Lista_Turno.SQL.Add('select 	a.nr_sequencia,');
  qy_Lista_Turno.SQL.Add('        a.ds_turno,');
  qy_Lista_Turno.SQL.Add('        a.qt_tempo_desconto_dia,');
  qy_Lista_Turno.SQL.Add('        a.qt_tempo_desconto_intervalo,');
  qy_Lista_Turno.SQL.Add('        cast(case when a.ie_segunda_feira then ''S'' else ''N'' end as varchar(1)) as ie_seg,');
  qy_Lista_Turno.SQL.Add('        cast(case when a.ie_terca_feira   then ''S'' else ''N'' end as varchar(1)) as ie_ter,');
  qy_Lista_Turno.SQL.Add('        cast(case when a.ie_quarta_feira  then ''S'' else ''N'' end as varchar(1)) as ie_qua,');
  qy_Lista_Turno.SQL.Add('        cast(case when a.ie_quinta_feira  then ''S'' else ''N'' end as varchar(1)) as ie_qui,');
  qy_Lista_Turno.SQL.Add('        cast(case when a.ie_sexta_feira   then ''S'' else ''N'' end as varchar(1)) as ie_sex,');
  qy_Lista_Turno.SQL.Add('        cast(case when a.ie_sabado        then ''S'' else ''N'' end as varchar(1)) as ie_sab,');
  qy_Lista_Turno.SQL.Add('        cast(case when a.ie_domingo       then ''S'' else ''N'' end as varchar(1)) as ie_dom ');
  qy_Lista_Turno.SQL.Add('from 	  turno a');

  if pOrderBy <> '' then
    qy_Lista_Turno.SQL.Add('order by '+pOrderBy)
  else
    qy_Lista_Turno.SQL.Add('order by ds_turno');

  qy_Lista_Turno.Open;
end;

procedure Tfm_Cad_Turno.FormCreate(Sender: TObject);
begin
  inherited;
  pc_Principal.ActivePage   := ts_Consulta;
  pc_Dados.ActivePage := ts_Parâmetros_Turno;
  qy_Lista_Turno.Connection := Banco_dm.Conexao_banco_aco;
  qy_Impedimento.Connection := Banco_dm.Conexao_banco_aco;
end;

procedure Tfm_Cad_Turno.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if pc_Principal.ActivePage = ts_Cadastro then
  begin
    if (ssCtrl in Shift) and (Key = 83) then
      bt_SalvarClick(Nil);
    if (ssCtrl in Shift) and (Key = 78) then
      bt_NovoClick(Nil);
  end;
end;

procedure Tfm_Cad_Turno.mi_ConsultarClick(Sender: TObject);
begin
  inherited;
  bt_Consultar.OnClick(Nil);
end;

procedure Tfm_Cad_Turno.pm_TurnoPopup(Sender: TObject);
begin
  inherited;
  mi_Consultar.Enabled := pc_Principal.ActivePage = ts_Consulta;
  mi_Consultar.Visible := mi_Consultar.Enabled;
end;

procedure Tfm_Cad_Turno.Salvar(pNr_Sequencia: integer);
var
  bUpdating:boolean;
begin
  try
    if Campo_Invalido(Self,0) then
      Exit;

    if StrToTime(ed_hr_Inicial.Text) >= StrToTime(ed_hr_Final.Text)  then
    begin
      MessageBox('O horário inicial deve ser menor para que haja período no turno',mExclamation,bmOK);
      Exit;
    end;

    bUpdating := pNr_Sequencia > 0;

    if bUpdating then
    begin
      vTurno.Nm_Usuario_Atualizacao := Banco_dm.BancoAttributes.User_ID;
      vTurno.Dt_Atualizacao         := now;
    end
    else
    begin
      vTurno.Nm_Usuario_Criacao     := Banco_dm.BancoAttributes.User_ID;
      vTurno.Dt_Criacao             := now;
    end;

    vTurno.Nr_Sequencia            := pNr_Sequencia;
    vTurno.Qt_tempo_desconto_dia   := ed_Qt_tempo_desconto_dia.Text;
    vTurno.qt_tempo_desconto_intervalo := ed_Qt_tempo_desconto_intervalo.Text;
    vTurno.Ds_Turno                := ed_ds_turno.Text;
    vTurno.Hr_Inicial              := ed_hr_Inicial.Text;
    vTurno.Hr_Final                := ed_hr_Final.Text;
    vTurno.Ie_domingo              := clb_Vigencia.Checked[0];
    vTurno.Ie_segunda_feira        := clb_Vigencia.Checked[1];
    vTurno.Ie_terca_feira          := clb_Vigencia.Checked[2];
    vTurno.Ie_quarta_feira         := clb_Vigencia.Checked[3];
    vTurno.Ie_quinta_feira         := clb_Vigencia.Checked[4];
    vTurno.Ie_sexta_feira          := clb_Vigencia.Checked[5];
    vTurno.Ie_sabado               := clb_Vigencia.Checked[6];


    if vTurno.Gravar then
    begin
      if bUpdating then
        Carregar(pNr_Sequencia)
      else
        Carregar(vTurno.Ultimo);
    end;
  except
    on E:Exception do
      Erro(Self.ClassName,'bt_SalvarClick',E.Message,True,True,E);
  end;
end;

end.

