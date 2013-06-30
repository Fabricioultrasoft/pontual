unit uGeradorEntradaLote;

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
  StdCtrls,
  ExtCtrls,
  Focus,
  ComCtrls,
  Mask,
  DB,
  ADODB,
  Buttons;

type
  Tfm_Gerador_Entrada_Lote = class(Tfm_Padrao)
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    dt_Inicial: TDateTimePicker;
    dt_final: TDateTimePicker;
    ed_hora: TFocusEdit;
    ed_nr_seq_funcionario: TFocusButtonedEdit;
    bt_Gerar: TButton;
    sp_gerar_horario_lote: TADOStoredProc;
    procedure FormCreate(Sender: TObject);
    procedure bt_GerarClick(Sender: TObject);
    procedure ed_nr_seq_funcionarioLeftButtonClick(Sender: TObject);
    procedure ed_nr_seq_funcionarioRightButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fm_Gerador_Entrada_Lote: Tfm_Gerador_Entrada_Lote;

implementation

uses uDataModule,
    uUtils,
    DateUtils,
    uPesquisa_Padrao;

{$R *.dfm}

procedure Tfm_Gerador_Entrada_Lote.bt_GerarClick(Sender: TObject);
var
  vnr_seq_funcionario:string;
  vqt_reg_efet:string;
begin
  if Campo_Invalido(Self,0) then
    Exit;

  vnr_seq_funcionario := ed_nr_seq_funcionario.Text;

  if (ed_nr_seq_funcionario.Text = '') then
  begin
    if MessageBox('Você não informou um funcionário, isto quer dizer que serão gerados entradas no período '+
               'informado para TODOS os funcionários ativos. '+#13#13+'Têm certeza que deseja continuar ?',
               mConfirmation,bmYES_NO,db2) <> IDYES
    then
      Exit; {*Caso diferente de sim (confirmar), sai da procedure*}
  end;

  sp_gerar_horario_lote.Prepared := true;
  //sp_gerar_consulta_horario.Parameters.Refresh;
  sp_gerar_horario_lote.Parameters.ParamByName('p_dt_inicial').Value :=             DateToStr(dt_Inicial.Date);
  sp_gerar_horario_lote.Parameters.ParamByName('p_dt_final').Value :=               DateToStr(dt_Final.Date);
  sp_gerar_horario_lote.Parameters.ParamByName('p_hora').Value :=                   ed_hora.Text;
  sp_gerar_horario_lote.Parameters.ParamByName('p_nr_seq_funcionario').Value :=     vnr_seq_funcionario;
  sp_gerar_horario_lote.Parameters.ParamByName('p_nm_usuario').Value :=             Banco_dm.BancoAttributes.User_ID;
  sp_gerar_horario_lote.Parameters.ParamByName('p_rowsaffected').Value :=           '0';
  sp_gerar_horario_lote.ExecProc;
    //Application.ProcessMessages;
  vqt_reg_efet := VarToStrDef(sp_gerar_horario_lote.Parameters.ParamByName('p_rowsaffected').Value,'0');
  MessageBox(vqt_reg_efet+' Registros efetuados.'+#13+#13+'Concluído',mInformation,bmOK);
  sp_gerar_horario_lote.Prepared := false;

end;

procedure Tfm_Gerador_Entrada_Lote.ed_nr_seq_funcionarioLeftButtonClick(
  Sender: TObject);
begin
  try
    ed_nr_seq_funcionario.Text := fm_Pesquisa_Padrao.AbrirConsulta('funcionario',ed_nr_seq_funcionario.Text,ed_nr_seq_funcionario.Nome_Campo_Banco,True);
  except
    on E:Exception do
      Erro(Self.ClassName,'bt_Pesquisa_FuncionarioClick',E.Message,True,True,E);
  end;
end;

procedure Tfm_Gerador_Entrada_Lote.ed_nr_seq_funcionarioRightButtonClick(
  Sender: TObject);
begin
  inherited;
  ed_nr_seq_funcionario.Clear;
end;

procedure Tfm_Gerador_Entrada_Lote.FormCreate(Sender: TObject);
begin
  dt_Inicial.Date:= StrToDate('01/'+IntToStr(MonthOf(now))+'/'+IntToStr(YearOf(now)));
  dt_final.Date  := EncodeDate(YearOf(Now),MonthOf(Now), DaysInMonth(Now));
  sp_gerar_horario_lote.Connection  := Banco_dm.Conexao_banco_aco;
end;

end.
