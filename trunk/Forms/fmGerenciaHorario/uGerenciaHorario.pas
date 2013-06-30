unit uGerenciaHorario;

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
  Grids,
  DBGrids,
  StdCtrls,
  Mask,
  Focus,
  Buttons,
  ExtCtrls,
  ComCtrls,
  DB,
  ADODB,
  uPadrao,
  Menus,
  uManipulacaoDados,
  DateUtils,
  uRelHoraDetalhada,
  uRelHoraMes;

type
  Tfm_Gerencia_Horario = class(Tfm_Padrao)
    pm_Horario: TPopupMenu;
    mi_Consultar: TMenuItem;
    mi_Ocultar_Filtros: TMenuItem;
    pc_Principal: TPageControl;
    ts_Consulta: TTabSheet;
    gb_Grid: TGroupBox;
    ts_Cadastro: TTabSheet;
    gb_Manip_Client: TGroupBox;
    gb_dados_registro: TGroupBox;
    Label16: TLabel;
    Label17: TLabel;
    ed_nm_funcionario: TFocusEdit;
    ed_dt_batida: TFocusEdit;
    gb_Codigo_Sequencial: TGroupBox;
    Label7: TLabel;
    gb_Filtros: TGroupBox;
    gb_Filtro_Criacao: TGroupBox;
    Label11: TLabel;
    Label12: TLabel;
    Label10: TLabel;
    ed_hr_Criacao_ate: TFocusEdit;
    ed_dt_Criacao_ate: TDateTimePicker;
    ed_hr_Criacao_de: TFocusEdit;
    ed_dt_Criacao_de: TDateTimePicker;
    ed_nm_usuario_criacao_filtro: TFocusEdit;
    gb_Filtro_Modificacao: TGroupBox;
    Label14: TLabel;
    Label15: TLabel;
    Label13: TLabel;
    ed_dt_modificacao_de: TDateTimePicker;
    ed_dt_modificacao_ate: TDateTimePicker;
    ed_hr_Modificacao_de: TFocusEdit;
    ed_hr_Modificacao_ate: TFocusEdit;
    ed_nm_usuario_atualizacao_filtro: TFocusEdit;
    gb_Filtro_Funcionario: TGroupBox;
    Label8: TLabel;
    gb_Data_Batida: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    ed_dt_Batida_De: TDateTimePicker;
    ed_dt_Batida_Ate: TDateTimePicker;
    ed_Hr_Batida_De: TFocusEdit;
    ed_Hr_Batida_Ate: TFocusEdit;
    ts_Calculo_Hora: TTabSheet;
    pc_Calculo_Hora: TPageControl;
    gb_Parametros_Calculo: TGroupBox;
    GroupBox4: TGroupBox;
    Label19: TLabel;
    GroupBox5: TGroupBox;
    ed_nr_seq_funcionario: TFocusButtonedEdit;
    ed_Nr_Sequencia: TFocusButtonedEdit;
    ed_Cd_Func: TFocusButtonedEdit;
    ed_nr_seq_func_calc: TFocusButtonedEdit;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    dt_Inicial: TDateTimePicker;
    dt_Final: TDateTimePicker;
    Label3: TLabel;
    Label4: TLabel;
    rg_Modo_Calculo: TRadioGroup;
    gb_Turno_Restr: TGroupBox;
    cx_Calcular_Entrada_Turno: TCheckBox;
    cx_Descontar_Minuto_Turno: TCheckBox;
    GroupBox2: TGroupBox;
    cx_Exibir_Inativos: TCheckBox;
    cx_Calcular_Saida_Turno: TCheckBox;
    pc_Tipo_Consulta: TPageControl;
    ts_Consulta_Detalhe: TTabSheet;
    dbg_Consulta_hr_detalhado: TDBGrid;
    ts_Consulta_Mes: TTabSheet;
    gb_legenda: TGroupBox;
    Edit2: TEdit;
    Edit1: TEdit;
    lv_ordenacao_hr_detalhado: TListView;
    cx_desconsiderar_forcar_ent_turno: TCheckBox;
    dbg_Consulta_hr_mes: TDBGrid;
    lv_ordenacao_hr_mes: TListView;
    GroupBox1: TGroupBox;
    Edit4: TEdit;
    cx_avisar_func_sem_turno: TCheckBox;
    mi_Abrir: TMenuItem;
    mi_Cad_Funcionario: TMenuItem;
    mi_Gerador_Entrada: TMenuItem;
    bt_Consultar_Horas: TButton;
    bt_Visualizar: TButton;
    bt_Consultar: TButton;
    bt_Primeiro: TButton;
    bt_Anterior: TButton;
    bt_Proximo: TButton;
    bt_Ultimo: TButton;
    bt_Novo: TButton;
    bt_Salvar: TButton;
    bt_Cancelar: TButton;
    bt_Excluir: TButton;
    lv_ordenacao_setada: TListView;
    dbg_Consulta: TDBGrid;
    qy_Consulta_Horario_Mes: TADOQuery;
    qy_Consulta_Horario_Batida: TADOQuery;
    qy_Consulta: TADOQuery;
    ds_Consulta_Horario_Mes: TDataSource;
    ds_Consulta_Horario_Batida: TDataSource;
    ds_Consulta: TDataSource;
    sp_gerar_consulta_horario: TADOStoredProc;
    procedure ed_dt_Batida_DeClick(Sender: TObject);
    procedure ed_dt_Batida_AteClick(Sender: TObject);
    procedure bt_ConsultarClick(Sender: TObject);
    procedure mi_Ocultar_FiltrosClick(Sender: TObject);
    procedure mi_ConsultarClick(Sender: TObject);
    procedure pm_HorarioPopup(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bt_PrimeiroClick(Sender: TObject);
    procedure bt_UltimoClick(Sender: TObject);
    procedure bt_ProximoClick(Sender: TObject);
    procedure bt_AnteriorClick(Sender: TObject);
    procedure dbg_ConsultaDblClick(Sender: TObject);
    procedure bt_CancelarClick(Sender: TObject);
    procedure bt_SalvarClick(Sender: TObject);
    procedure bt_ExcluirClick(Sender: TObject);
    procedure bt_NovoClick(Sender: TObject);
    procedure ed_dt_modificacao_deClick(Sender: TObject);
    procedure ed_dt_modificacao_ateClick(Sender: TObject);
    procedure ed_dt_Criacao_deClick(Sender: TObject);
    procedure ed_dt_Criacao_ateClick(Sender: TObject);
    procedure bt_Consultar_HorasClick(Sender: TObject);
    procedure bt_VisualizarClick(Sender: TObject);
    procedure dbg_ConsultaTitleClick(Column: TColumn);
    procedure dbg_Consulta_hr_detalhadoTitleClick(Column: TColumn);
    procedure ed_nr_seq_funcionarioChange(Sender: TObject);
    procedure ed_nr_seq_funcionarioLeftButtonClick(Sender: TObject);
    procedure ed_Nr_SequenciaLeftButtonClick(Sender: TObject);
    procedure ed_Nr_SequenciaChange(Sender: TObject);
    procedure ed_nr_seq_func_calcLeftButtonClick(Sender: TObject);
    procedure ed_Cd_FuncLeftButtonClick(Sender: TObject);
    procedure cx_Calcular_Entrada_TurnoClick(Sender: TObject);
    procedure cx_Descontar_Minuto_TurnoClick(Sender: TObject);
    procedure rg_Modo_CalculoClick(Sender: TObject);
    procedure ed_nr_seq_func_calcChange(Sender: TObject);
    procedure dt_InicialChange(Sender: TObject);
    procedure dt_FinalChange(Sender: TObject);
    procedure cx_Exibir_InativosClick(Sender: TObject);
    procedure dbg_Consulta_hr_detalhadoDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure qy_Consulta_Horario_BatidaAfterScroll(DataSet: TDataSet);
    procedure dbg_Consulta_hr_detalhadoDblClick(Sender: TObject);
    procedure dbg_Consulta_hr_mesTitleClick(Column: TColumn);
    procedure dbg_Consulta_hr_mesDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure mi_Cad_FuncionarioClick(Sender: TObject);
    procedure mi_Gerador_EntradaClick(Sender: TObject);
  private
    procedure Carregar(pNr_Sequencia:integer);
    procedure ExecutarConsulta(pOrderBy:String);
    procedure Consulta_Horario_Batida(pOrderBy:string);
    procedure Consulta_Horario_Mes(pOrderBy:string);
    procedure ClickLvSetado(Sender:TOBject);
    procedure DblClickLvSetado(Sender:TObject);
    procedure Executa_gerar_consulta_horario;

    { Private declarations }
  public
    { Public declarations }
  end;

var
  fm_Gerencia_Horario: Tfm_Gerencia_Horario;

implementation

uses
  uUtils,
  uPesquisa_Padrao,
  uDataModule,
  Generics.Collections,
  uCadastro_Funcionario,
  uGeradorEntradaLote,
  uUtilsDatabase;

{$R *.dfm}

procedure Tfm_Gerencia_Horario.ed_dt_Batida_DeClick(Sender: TObject);
begin
  ed_Hr_Batida_De.Enabled := ed_dt_Batida_De.Checked;
end;

procedure Tfm_Gerencia_Horario.ed_dt_Criacao_ateClick(Sender: TObject);
begin
  inherited;
  ed_hr_Criacao_ate.Enabled := ed_dt_Criacao_ate.Checked;
end;

procedure Tfm_Gerencia_Horario.ed_dt_Criacao_deClick(Sender: TObject);
begin
  inherited;
  ed_hr_Criacao_de.Enabled := ed_dt_Criacao_de.Checked;
end;

procedure Tfm_Gerencia_Horario.ed_dt_modificacao_ateClick(Sender: TObject);
begin
  inherited;
  ed_hr_modificacao_ate.Enabled := ed_dt_modificacao_ate.Checked;
end;

procedure Tfm_Gerencia_Horario.ed_dt_modificacao_deClick(Sender: TObject);
begin
  ed_hr_modificacao_de.Enabled := ed_dt_modificacao_de.Checked;
end;

procedure Tfm_Gerencia_Horario.ed_Cd_FuncLeftButtonClick(Sender: TObject);
begin
  inherited;
  try
    ed_Cd_Func.Text := fm_Pesquisa_Padrao.AbrirConsulta('funcionario',ed_Cd_Func.Text,ed_Cd_Func.Nome_Campo_Banco);
  except
    on E:Exception do
      Erro(Self.ClassName,'bt_Pesquisa_FuncionarioClick',E.Message,True,True,E);
  end;
end;

procedure Tfm_Gerencia_Horario.ed_dt_Batida_AteClick(Sender: TObject);
begin
  ed_Hr_Batida_Ate.Enabled := ed_Dt_Batida_Ate.Checked;
end;

procedure Tfm_Gerencia_Horario.ed_Nr_SequenciaChange(Sender: TObject);
begin
  inherited;
  try
    Carregar(StrToIntDef(ed_Nr_Sequencia.Text,0));
  except
    on E:Exception do
      Erro(Self.ClassName,'ed_Nr_SequenciaChange',E.Message,True,True,E);
  end;
end;

procedure Tfm_Gerencia_Horario.ed_Nr_SequenciaLeftButtonClick(Sender: TObject);
begin
  inherited;
  try
    ed_Nr_Sequencia.Text := fm_Pesquisa_Padrao.AbrirConsulta('funcionario_ponto',ed_Nr_Sequencia.Text,ed_Nr_Sequencia.Nome_Campo_Banco);
  except
    on E:Exception do
      Erro(Self.ClassName,'ed_Nr_SequenciaLeftButtonClick',E.Message,True,True,E);
  end;
end;

procedure Tfm_Gerencia_Horario.ed_nr_seq_func_calcChange(Sender: TObject);
begin
  inherited;
  bt_Visualizar.Enabled := false;
end;

procedure Tfm_Gerencia_Horario.ed_nr_seq_func_calcLeftButtonClick(
  Sender: TObject);
begin
  inherited;
  try
    ed_Nr_Seq_Func_Calc.Text := fm_Pesquisa_Padrao.AbrirConsulta('funcionario',ed_Nr_Seq_Func_Calc.Text,ed_Nr_Seq_Func_Calc.Nome_Campo_Banco);
  except
    on E:Exception do
      Erro(Self.ClassName,'bt_Pesquisa_FuncionarioClick',E.Message,True,True,E);
  end;
end;

procedure Tfm_Gerencia_Horario.ExecutarConsulta(pOrderBy:String);
begin
  try
    qy_Consulta.Close;
    qy_Consulta.SQL.Clear;
    qy_Consulta.SQL.Add('select  a.*');
    qy_Consulta.SQL.Add('from    funcionario_ponto a');
    qy_Consulta.SQL.Add('where   1=1');

    if ed_Cd_Func.Text <> '' then
      qy_Consulta.SQL.Add('and a.nr_seq_funcionario = '+ed_Cd_Func.Text);

    if ed_dt_Batida_De.Checked then
      qy_Consulta.SQL.Add('and a.dt_batida      >= '+QuotedStr(DateToStr(ed_dt_Batida_De.Date)     +' '+ed_hr_Batida_De.Text+':00'));

    if ed_dt_Batida_Ate.Checked then
      qy_Consulta.SQL.Add('and a.dt_batida      <= '+QuotedStr(DateToStr(ed_dt_Batida_Ate.Date)     +' '+ed_hr_Batida_Ate.Text+':59'));

    if ed_dt_Criacao_de.Checked then
      qy_Consulta.SQL.Add('and a.dt_criacao     >= '+QuotedStr(DateToStr(ed_dt_Criacao_de.Date)     +' '+ed_hr_Criacao_de.Text+':00'));

    if ed_dt_Criacao_ate.Checked then
      qy_Consulta.SQL.Add('and a.dt_criacao     <= '+QuotedStr(DateToStr(ed_dt_Criacao_ate.Date)    +' '+ed_hr_Criacao_ate.Text+':59'));

    if ed_dt_modificacao_de.Checked then
      qy_Consulta.SQL.Add('and a.dt_atualizacao >= '+QuotedStr(DateToStr(ed_dt_modificacao_de.Date) +' '+ed_hr_Modificacao_de.Text+':00'));

    if ed_dt_modificacao_ate.Checked then
      qy_Consulta.SQL.Add('and a.dt_atualizacao <= '+QuotedStr(DateToStr(ed_dt_modificacao_ate.Date)+' '+ed_hr_modificacao_ate.Text+':59'));

    if ed_nm_usuario_criacao_filtro.Text <> '' then
      qy_Consulta.SQL.Add('and lower(a.nm_usuario_criacao) like '+Like(ed_nm_usuario_criacao_filtro.Text));

    if ed_nm_usuario_atualizacao_filtro.Text <> '' then
      qy_Consulta.SQL.Add('and lower(a.nm_usuario_atualizacao) like '+Like(ed_nm_usuario_atualizacao_filtro.Text));

    if pOrderBy <> '' then
      qy_Consulta.SQL.Add('order by '+pOrderBy);

    qy_Consulta.Open;

    gb_Grid.Caption := 'Tabela: funcionario_ponto '+'('+IntToStr(qy_Consulta.RecordCount)+') registros encontrados.';
  Except
    on E:Exception do
    begin
      Erro(Self.ClassName,'ExecutarConsulta',E.Message,true,True,E);
    end;
  end;
end;

procedure Tfm_Gerencia_Horario.Executa_gerar_consulta_horario;
var
  vErro:string;
begin
  sp_gerar_consulta_horario.Prepared := true;
  //sp_gerar_consulta_horario.Parameters.Refresh;

  sp_gerar_consulta_horario.Parameters.ParamByName('p_dt_inicial').Value             := DateToStr(dt_Inicial.Date);
  sp_gerar_consulta_horario.Parameters.ParamByName('p_dt_final').Value               := DateToStr(dt_Final.Date);
  sp_gerar_consulta_horario.Parameters.ParamByName('p_ie_somente_ativo').Value       := cx_Exibir_Inativos.Checked;
  sp_gerar_consulta_horario.Parameters.ParamByName('p_nr_seq_funcionario').Value     := IntToStr(StrToIntDef(ed_nr_seq_func_calc.Text,0));
  sp_gerar_consulta_horario.Parameters.ParamByName('p_forcar_entrada_turno').Value   := cx_Calcular_Entrada_Turno.Checked;
  sp_gerar_consulta_horario.Parameters.ParamByName('p_forcar_saida_turno').Value     := cx_Calcular_Saida_Turno.Checked;
  sp_gerar_consulta_horario.Parameters.ParamByName('p_modocalculo').Value            := IntToStr(rg_Modo_Calculo.ItemIndex);
  sp_gerar_consulta_horario.Parameters.ParamByName('p_nm_usuario').Value             := Banco_dm.BancoAttributes.User_ID;
  sp_gerar_consulta_horario.Parameters.ParamByName('p_descontar_minuto_turno').Value := cx_Descontar_Minuto_Turno.Checked;
  sp_gerar_consulta_horario.Parameters.ParamByName('p_erro').Value                   := 'null';
  sp_gerar_consulta_horario.Parameters.ParamByName('p_avisar_func_sem_turno').Value  := cx_avisar_func_sem_turno.Checked;

  sp_gerar_consulta_horario.ExecProc;
  //Application.ProcessMessages;
  vErro := VarToStrDef(sp_gerar_consulta_horario.Parameters.ParamByName('p_erro').Value,'');
  if vErro <> '' then
    MessageBox(vErro,mExclamation,bmOK);
  sp_gerar_consulta_horario.Prepared := false;  
end;

procedure Tfm_Gerencia_Horario.FormCreate(Sender: TObject);
var
  vDtInicial,
  vDtFinal:TDate;
begin
  inherited;
  qy_Consulta.Connection                := Banco_dm.Conexao_banco_aco;
  qy_Consulta_Horario_Batida.Connection := Banco_dm.Conexao_banco_aco;
  qy_Consulta_Horario_Mes.Connection    := Banco_dm.Conexao_banco_aco;
  sp_gerar_consulta_horario.Connection  := Banco_dm.Conexao_banco_aco;

  lv_ordenacao_setada.OnClick         := ClickLvSetado;
  lv_ordenacao_setada.OnDblClick      := DblClickLvSetado;
  lv_ordenacao_hr_detalhado.OnClick   := ClickLvSetado;
  lv_ordenacao_hr_detalhado.OnDblClick:= DblClickLvSetado;
  lv_ordenacao_hr_mes.OnClick         := ClickLvSetado;
  lv_ordenacao_hr_mes.OnDblClick      := DblClickLvSetado;

  vDtInicial := StrToDate('01/'+IntToStr(MonthOf(now))+'/'+IntToStr(YearOf(now)));
  vDtFinal   := EncodeDate(YearOf(Now),MonthOf(Now), DaysInMonth(Now));
  dt_Inicial.Date   := vDtInicial;
  dt_Final.DateTime := vDtFinal;
  ed_dt_Batida_De.Date := vDtInicial;
  ed_dt_Batida_Ate.Date := vDtFinal;

  ExecutarConsulta(GetCampoOrderBy(dbg_Consulta,lv_ordenacao_setada));

  pc_Principal.ActivePage := ts_Consulta;

  rg_Modo_Calculo.Items.Delete(2);
  rg_Modo_Calculo.Items.Delete(0);
end;

procedure Tfm_Gerencia_Horario.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure Tfm_Gerencia_Horario.mi_Cad_FuncionarioClick(Sender: TObject);
begin
  inherited;
  CriaForm(Tfm_Cadastro_Funcionario);
  if  (pc_Principal.ActivePage = ts_Calculo_Hora) and
      (pc_Tipo_Consulta.ActivePage = ts_Consulta_Detalhe)
  then
  begin
    if not qy_Consulta_Horario_Batida.IsEmpty then
      fm_Cadastro_Funcionario.Carregar(qy_Consulta_Horario_Batida.FieldByName('nr_seq_funcionario').AsInteger);
  end
  else
  if  (pc_Principal.ActivePage = ts_Calculo_Hora) and
      (pc_Tipo_Consulta.ActivePage = ts_Consulta_Mes)
  then
  begin
    if not qy_Consulta_Horario_Mes.IsEmpty then
      fm_Cadastro_Funcionario.Carregar(qy_Consulta_Horario_Mes.FieldByName('nr_seq_funcionario').AsInteger);
  end
  else
  if pc_Principal.ActivePage = ts_Consulta then
  begin
    if not qy_Consulta.IsEmpty then
      fm_Cadastro_Funcionario.Carregar(qy_Consulta.FieldByName('nr_seq_funcionario').AsInteger);
  end
  else
  if pc_Principal.ActivePage = ts_Cadastro then
  begin
    if vFuncionario_Ponto.nr_seq_funcionario <> 0 then
      fm_Cadastro_Funcionario.Carregar(vFuncionario_Ponto.nr_seq_funcionario);
  end

end;

procedure Tfm_Gerencia_Horario.mi_ConsultarClick(Sender: TObject);
begin
  if pc_Principal.ActivePage = ts_Consulta then
    bt_ConsultarClick(Nil)
  else
  if pc_Principal.ActivePage = ts_Calculo_Hora then
    bt_Consultar_Horas.OnClick(nil);
end;

procedure Tfm_Gerencia_Horario.mi_Gerador_EntradaClick(Sender: TObject);
begin
  inherited;
  fm_Gerador_Entrada_Lote := Tfm_Gerador_Entrada_Lote.Create(Application);
  //CriaForm(Tfm_Gerador_Entrada_Lote);
  fm_Gerador_Entrada_Lote.ShowModal;
end;

procedure Tfm_Gerencia_Horario.mi_Ocultar_FiltrosClick(Sender: TObject);
begin
  gb_Filtros.Visible := not gb_Filtros.Visible;
end;

procedure Tfm_Gerencia_Horario.pm_HorarioPopup(Sender: TObject);
begin
  try
    mi_Consultar.Enabled         := (pc_Principal.ActivePage = ts_Consulta) or ((pc_Principal.ActivePage = ts_Calculo_Hora) and (bt_Consultar_Horas.Enabled));
    mi_Consultar.Visible         := mi_Consultar.Enabled;

    mi_Ocultar_Filtros.Enabled   := pc_Principal.ActivePage = ts_Consulta;
    mi_Ocultar_Filtros.Visible   := mi_Ocultar_Filtros.Enabled;
  except
    on E:Exception do
      Erro(Self.ClassName,'pm_HorarioPopup',E.Message,True,True,E);
  end;
end;

procedure Tfm_Gerencia_Horario.rg_Modo_CalculoClick(Sender: TObject);
var
  bCond:boolean;
begin
  inherited;
  bt_Visualizar.Enabled := false;
  bCond := rg_Modo_Calculo.ItemIndex in [0,1];
  cx_Calcular_Entrada_Turno.Enabled := bCond;
  cx_Calcular_Saida_Turno.Enabled   := bCond;
  cx_Descontar_Minuto_Turno.Enabled := bCond;
end;

procedure Tfm_Gerencia_Horario.bt_Consultar_HorasClick(Sender: TObject);
begin
  inherited;
  try
    gb_Parametros_Calculo.Enabled := false;
    bt_Consultar_Horas.Enabled    := false;
    bt_Visualizar.Enabled         := false;
    Application.ProcessMessages;
    Executa_gerar_consulta_horario;
    Consulta_Horario_Batida(GetCampoOrderBy(dbg_Consulta_hr_detalhado,lv_ordenacao_hr_detalhado));
    Consulta_Horario_Mes(GetCampoOrderBy(dbg_Consulta_hr_mes,lv_ordenacao_hr_mes));
    bt_Consultar_Horas.Enabled  := true;
    bt_Visualizar.Enabled       := true;
    gb_Parametros_Calculo.Enabled := true;
  Except
    on E:Exception do
    begin
      bt_Consultar_Horas.Enabled := true;
      bt_Visualizar.Enabled := true;
      gb_Parametros_Calculo.Enabled := true;
      Erro(Self.ClassName,'bt_CalcularClick',E.Message,true,True,E);
    end;
  end;
end;

procedure Tfm_Gerencia_Horario.bt_AnteriorClick(Sender: TObject);
begin
  inherited;
  if ed_Nr_Sequencia.Text = '' then
    Carregar(vFuncionario_Ponto.Primeiro)
  else
    Carregar(vFuncionario_Ponto.Anterior(StrToIntDef(ed_Nr_Sequencia.Text,0)));
end;

procedure Tfm_Gerencia_Horario.bt_CancelarClick(Sender: TObject);
begin
  inherited;
  try
    Carregar(StrToIntDef(ed_Nr_Sequencia.Text,0));
  except
    on E:Exception do
      Erro(Self.ClassName,'bt_CancelarClick',E.Message,True,True,E);
  end;
end;

procedure Tfm_Gerencia_Horario.bt_ConsultarClick(Sender: TObject);
begin
  try
    bt_Consultar.Enabled := false;
    ExecutarConsulta(GetCampoOrderBy(dbg_Consulta,lv_ordenacao_setada));
    bt_Consultar.Enabled := true;
  except
    on E:Exception do
    begin
      bt_Consultar.Enabled := true;
      Erro(Self.ClassName,'bt_ConsultarClick',E.Message,True,True,E);
    end;
  end;
end;

procedure Tfm_Gerencia_Horario.bt_ExcluirClick(Sender: TObject);
begin
  inherited;
  try
    if MessageBox('Confirmar a exclusão do horário "'+QuotedStr(IntToStr(vFuncionario_Ponto.Nr_Sequencia)+
                  '"'+#13+' de "'+QuotedStr(ed_nm_funcionario.Text)+'" ?'),
                  mConfirmation,bmYES_NO) =ID_YES
    then
    begin
      if vFuncionario_Ponto.Deletar(StrToIntDef(ed_Nr_Sequencia.Text,0)) then
        LimparCampos(Self,0);
    end;
  except
    on E:Exception do
      Erro(Self.ClassName,'bt_ExcluirClick',E.Message,True,True,E);
  end;
end;

procedure Tfm_Gerencia_Horario.bt_NovoClick(Sender: TObject);
begin
  try
    SetPropertyAttributes(vListaCompObr,'obrigatorio',false);
    LimparCampos(Self,0);
    ed_nr_seq_funcionario.SetFocus;
    bt_Salvar.Enabled := true;
    ed_dt_batida.Text := DateTimeToStr(now);
    SetPropertyAttributes(vListaCompObr,'obrigatorio',true);
  except
    on E:Exception do
      Erro(Self.ClassName,'bt_NovoClick',E.Message,True,True,E);
  end;
end;

procedure Tfm_Gerencia_Horario.bt_PrimeiroClick(Sender: TObject);
begin
  inherited;
  Carregar(vFuncionario_Ponto.Primeiro);
end;

procedure Tfm_Gerencia_Horario.bt_ProximoClick(Sender: TObject);
begin
  inherited;
  if ed_Nr_Sequencia.Text = '' then
    Carregar(vFuncionario_Ponto.Ultimo)
  else
    Carregar(vFuncionario_Ponto.Proximo(StrToIntDef(ed_Nr_Sequencia.Text,0)));
end;

procedure Tfm_Gerencia_Horario.bt_SalvarClick(Sender: TObject);
var
  bUpdating:boolean;
begin
  try
    if Campo_Invalido(Self,0) then
      Exit;

    bUpdating := ed_Nr_Sequencia.Text <> '';

    if bUpdating then
    begin
      vFuncionario_Ponto.Nm_Usuario_Atualizacao := Banco_dm.BancoAttributes.User_ID;
      vFuncionario_Ponto.Dt_Atualizacao         := now;
    end
    else
    begin
      vFuncionario_Ponto.Nm_Usuario_Criacao     := Banco_dm.BancoAttributes.User_ID;
      vFuncionario_Ponto.Dt_Criacao             := now;
    end;

    vFuncionario_Ponto.Nr_Sequencia            := StrToIntDef(ed_Nr_Sequencia.Text,0);
    vFuncionario_Ponto.dt_batida               := StrToDateTime(ed_dt_batida.Text);
    vFuncionario_Ponto.nr_seq_funcionario      := StrToIntDef(ed_nr_seq_funcionario.Text,0);
    vFuncionario_Ponto.ie_desconsiderar_forcar_entrada_turno := cx_desconsiderar_forcar_ent_turno.Checked;

    if vFuncionario_Ponto.Gravar then
    begin
      if bUpdating then
        Carregar(StrToInt(ed_Nr_Sequencia.Text))
      else
        Carregar(vFuncionario_Ponto.Ultimo);
    end;
  except
    on E:Exception do
      Erro(Self.ClassName,'bt_SalvarClick',E.Message,True,True,E);
  end;
end;

procedure Tfm_Gerencia_Horario.bt_UltimoClick(Sender: TObject);
begin
  inherited;
  Carregar(vFuncionario_Ponto.Ultimo);
end;

procedure Tfm_Gerencia_Horario.bt_VisualizarClick(Sender: TObject);
begin
  inherited;
  try
    if ExisteImpressora then
    begin
      case pc_Tipo_Consulta.ActivePageIndex of
        0:
          begin
            try
              fm_Rel_Hora_Detalhada := Tfm_Rel_Hora_Detalhada.Create(Application);
              fm_Rel_Hora_Detalhada.Preview(dt_Inicial.Date,dt_Final.Date,rg_Modo_Calculo.ItemIndex);
              fm_Rel_Hora_Detalhada.Close;
            except
              on E:Exception do
              begin
                fm_Rel_Hora_Detalhada.Close;
                Erro(Self.ClassName,'bt_VisualizarClick',e.Message,true,True,E);
              end;
            end;
          end;
        1:
          begin
            try
              fm_Rel_Hora_Mes := Tfm_Rel_Hora_Mes.Create(Application);
              fm_Rel_Hora_Mes.Preview(dt_Inicial.Date,dt_Final.Date,rg_Modo_Calculo.ItemIndex);
              fm_Rel_Hora_Mes.Close;
            except
              on E:Exception do
              begin
                fm_Rel_Hora_Mes.Close;
                Erro(Self.ClassName,'bt_VisualizarClick',e.Message,true,True,E);
              end;
            end;
          end;
      end;
    end;
  except
    if fm_Rel_Hora_Mes <> Nil then
      fm_Rel_Hora_Mes.Close;
    if fm_Rel_Hora_Detalhada <> Nil then
      fm_Rel_Hora_Detalhada.Close;
  end;
end;

procedure Tfm_Gerencia_Horario.ed_nr_seq_funcionarioChange(Sender: TObject);
begin
  inherited;
  try
    ed_nm_funcionario.Text := VarToStrDef(Busca_Valor('funcionario','nm_funcionario','nr_sequencia',ed_nr_seq_funcionario.Text),'');
  except
    on E:Exception do
      Erro(Self.ClassName,'ed_nr_seq_funcionarioChange',E.Message,True,True,E);
  end;
end;

procedure Tfm_Gerencia_Horario.ed_nr_seq_funcionarioLeftButtonClick(
  Sender: TObject);
begin
  inherited;
  try
    ed_nr_seq_funcionario.Text := fm_Pesquisa_Padrao.AbrirConsulta('funcionario',ed_nr_seq_funcionario.Text,ed_nr_seq_funcionario.Nome_Campo_Banco);
  except
    on E:Exception do
      Erro(Self.ClassName,'ed_nr_seq_funcionarioLeftButtonClick',E.Message,True,True,E);
  end;
end;

procedure Tfm_Gerencia_Horario.Carregar(pNr_Sequencia:integer);
var
  bAtivar:boolean;
begin
  try
    SetPropertyAttributes(vListaCompObr,'color',clWindow);
    vFuncionario_Ponto.Select(pNr_Sequencia);
    bAtivar := vFuncionario_Ponto.nr_sequencia > 0;

    if bAtivar then
    begin
      ed_Nr_Sequencia.Text        := IntToStr(vFuncionario_Ponto.nr_sequencia);
    end;

    ed_nr_seq_funcionario.Text    := IntToVazio(vFuncionario_Ponto.nr_seq_funcionario);
    ed_dt_batida.Text             := DateTimeToStrNull(vFuncionario_Ponto.dt_batida);
    cx_desconsiderar_forcar_ent_turno.Checked := vFuncionario_Ponto.ie_desconsiderar_forcar_entrada_turno;

    bt_Excluir.Enabled              := bAtivar;
    bt_Salvar.Enabled               := bAtivar;
    bt_Cancelar.Enabled             := bAtivar;
  except
    on E:Exception do
      Erro(Self.ClassName,'Carregar',E.Message,True,True,E);
  end;
end;

procedure Tfm_Gerencia_Horario.ClickLvSetado(Sender: TOBject);
begin
  OnClickLvSetado(Sender);
end;

procedure Tfm_Gerencia_Horario.dbg_ConsultaDblClick(Sender: TObject);
begin
  inherited;
  try
  if not qy_Consulta.IsEmpty then
    begin
      Carregar(qy_Consulta.FieldByName('NR_SEQUENCIA').AsInteger);
      pc_Principal.ActivePage := ts_Cadastro;
    end;
  except
    on E:Exception do
      Erro(Self.ClassName,'dbg_ConsultaDblClick',E.Message,True,True,E);
  end;
end;

procedure Tfm_Gerencia_Horario.dbg_ConsultaTitleClick(Column: TColumn);
begin
  inherited;
  OnGridTitleClick(Column,lv_ordenacao_setada);
end;

procedure Tfm_Gerencia_Horario.dbg_Consulta_hr_detalhadoDblClick(
  Sender: TObject);
var
  vseq:integer;
begin
  try
    if not qy_Consulta_Horario_Batida.IsEmpty then
      begin
        vseq := StrToInt(VarToStrDef(Busca_Valor('funcionario_ponto','nr_sequencia','dt_batida;nr_seq_funcionario',
                    QuotedStr(qy_Consulta_Horario_Batida.FieldByName('dt_batida_original').AsString)+';'+
                    qy_Consulta_Horario_Batida.FieldByName('nr_seq_funcionario').AsString),'0'));

        if vseq > 0 then
        begin
          Carregar(vseq);
          pc_Principal.ActivePage := ts_Cadastro;
        end;
      end;
  except
    on E:Exception do
      Erro(Self.ClassName,'dbg_ConsultaDblClick',E.Message,True,True,E);
  end;
end;

procedure Tfm_Gerencia_Horario.dbg_Consulta_hr_detalhadoDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  Grid:TDBGrid;
begin
  Grid := Sender as TDBGrid;
  if (not Grid.DataSource.DataSet.IsEmpty) then
    if AnsiLowerCase(Column.FieldName) = 'qt_tempo' then
    begin
      if copy(Grid.DataSource.DataSet.FieldByName('qt_tempo').AsString,1,1) = '-' then
      begin
        Grid.canvas.Brush.Color := $00BBBBFF;
        Grid.canvas.TextRect(rect,rect.Left,rect.top,Grid.DataSource.DataSet.FieldByName('qt_tempo').AsString);
      end
      else
      if Trim(copy(Grid.DataSource.DataSet.FieldByName('qt_tempo').AsString,1,1)) = '' then
      begin
        Grid.canvas.Brush.Color := $00CAFFFF;
        Grid.canvas.TextRect(rect,rect.Left,rect.top,Grid.DataSource.DataSet.FieldByName('qt_tempo').AsString);
      end;
    end;
end;

procedure Tfm_Gerencia_Horario.qy_Consulta_Horario_BatidaAfterScroll(
  DataSet: TDataSet);
begin
   dbg_Consulta_hr_detalhado.Invalidate;
end;

procedure Tfm_Gerencia_Horario.dbg_Consulta_hr_detalhadoTitleClick(
  Column: TColumn);
begin
  inherited;
  OnGridTitleClick(Column,lv_ordenacao_hr_detalhado);
end;

procedure Tfm_Gerencia_Horario.dbg_Consulta_hr_mesDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  Grid:TDBGrid;
begin
  Grid := Sender as TDBGrid;
  if (not qy_Consulta_Horario_Mes.IsEmpty) then
    if AnsiLowerCase(Column.FieldName) = 'total' then
    begin
      if copy(qy_Consulta_Horario_Mes.FieldByName('total').AsString,1,1) = '-' then
      begin
        Grid.canvas.Brush.Color := $00BBBBFF;
        Grid.canvas.TextRect(rect,rect.Left,rect.top,qy_Consulta_Horario_Mes.FieldByName('total').AsString);
      end;
    end;
end;

procedure Tfm_Gerencia_Horario.dbg_Consulta_hr_mesTitleClick(Column: TColumn);
begin
  inherited;
  OnGridTitleClick(Column,lv_ordenacao_hr_mes);
end;

procedure Tfm_Gerencia_Horario.DblClickLvSetado(Sender: TObject);
begin
  OnDblClickLvSetado(Sender);
end;

procedure Tfm_Gerencia_Horario.dt_FinalChange(Sender: TObject);
begin
  inherited;
  bt_Visualizar.Enabled := false;
end;

procedure Tfm_Gerencia_Horario.dt_InicialChange(Sender: TObject);
begin
  inherited;
  bt_Visualizar.Enabled := false;
end;

procedure Tfm_Gerencia_Horario.Consulta_Horario_Batida(pOrderBy:string);
begin
  try
    qy_Consulta_Horario_Batida.Close;
    qy_Consulta_Horario_Batida.SQL.Clear;
    qy_Consulta_Horario_Batida.SQL.Add('select  a.* from vw_total_hora_detalhada a');
    qy_Consulta_Horario_Batida.SQL.Add('where   1=1');
    qy_Consulta_Horario_Batida.SQL.Add('and		  a.nm_usuario_criacao = '+QuotedStr(Banco_dm.BancoAttributes.User_ID));
    case rg_Modo_Calculo.ItemIndex of
      1,2:
        begin
          qy_Consulta_Horario_Batida.SQL.Add('and a.dt_saida is not null');
        end;
    end;

    if pOrderBy <> '' then
      qy_Consulta_Horario_Batida.SQL.Add('order by '+pOrderBy)
    else
      qy_Consulta_Horario_Batida.SQL.Add('order by a.nm_funcionario,a.dt_entrada');

    qy_Consulta_Horario_Batida.Open;
  Except
    on E:Exception do
      Erro(Self.ClassName,'Consulta_Horario_Batida',E.Message,true,True,E);
  end;
end;

procedure Tfm_Gerencia_Horario.Consulta_Horario_Mes(pOrderBy: string);
begin
  try
    qy_Consulta_Horario_Mes.Close;
    qy_Consulta_Horario_Mes.SQL.Clear;
    qy_Consulta_Horario_Mes.SQL.Add('select  a.nr_seq_funcionario,a.nm_funcionario,');
    qy_Consulta_Horario_Mes.SQL.Add('        a.mes_ano,a.qt_tempo_previsto::varchar(255),a.qt_tempo_trabalho::varchar(255) qt_tempo_trabalho,');
    qy_Consulta_Horario_Mes.SQL.Add('        a.total,a.nm_usuario_criacao');
    qy_Consulta_Horario_Mes.SQL.Add('from    vw_total_hora_mes a');
    qy_Consulta_Horario_Mes.SQL.Add('where   1=1');
    qy_Consulta_Horario_Mes.SQL.Add('and		 a.nm_usuario_criacao = '+QuotedStr(Banco_dm.BancoAttributes.User_ID));

    if pOrderBy <> '' then
      qy_Consulta_Horario_Mes.SQL.Add('order by '+pOrderBy)
    else
      qy_Consulta_Horario_Mes.SQL.Add('order by a.nm_funcionario,a.mes_ano');

    qy_Consulta_Horario_Mes.Open;
  Except
    on E:Exception do
      Erro(Self.ClassName,'Consulta_Horario_Batida',E.Message,true,True,E);
  end;
end;

procedure Tfm_Gerencia_Horario.cx_Calcular_Entrada_TurnoClick(
  Sender: TObject);
begin
  inherited;
  bt_Visualizar.Enabled := false;
end;

procedure Tfm_Gerencia_Horario.cx_Descontar_Minuto_TurnoClick(
  Sender: TObject);
begin
  inherited;
  bt_Visualizar.Enabled := false;
end;

procedure Tfm_Gerencia_Horario.cx_Exibir_InativosClick(Sender: TObject);
begin
  inherited;
  bt_Visualizar.Enabled := false;
end;


end.
