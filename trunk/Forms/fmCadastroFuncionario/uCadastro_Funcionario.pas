unit uCadastro_Funcionario;

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
  StdCtrls,
  Buttons,
  ComCtrls,
  ExtCtrls,
  Menus,
  DB,
  ADODB,
  DBGrids,
  uDataModule,
  Mask,
  Focus,
  uManipulacaoDados,
  uUtils,
  uPesquisa_Padrao,
  uRotinas_Nitgen,
  uPadrao,
  qrprntr,
  Generics.Collections,
  Grids;

type
  Tfm_Cadastro_Funcionario = class(Tfm_Padrao)
    pm_Lista_Func: TPopupMenu;
    mi_Consultar: TMenuItem;
    mi_Ocultar_Filtros: TMenuItem;
    pc_principal: TPageControl;
    ts_ListaFuncionario: TTabSheet;
    ts_CadastroFuncionario: TTabSheet;
    gb_Ordenacao: TGroupBox;
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
    dbg_ListaFuncionario: TDBGrid;
    lv_ordenacao_setada: TListView;
    ed_nr_seq_func_calc: TFocusButtonedEdit;
    GroupBox1: TGroupBox;
    ed_Nr_Sequencia: TFocusButtonedEdit;
    Label1: TLabel;
    ed_nm_funcionario: TFocusEdit;
    Label2: TLabel;
    cx_Inativo: TCheckBox;
    cpg_Funcionario_Cadastro: TCategoryPanelGroup;
    cp_Dados_Pessoais: TCategoryPanel;
    cp_Identificacao_Digital: TCategoryPanel;
    cp_Turno_Trabalho: TCategoryPanel;
    Panel5: TPanel;
    GroupBox3: TGroupBox;
    Label7: TLabel;
    Label4: TLabel;
    ed_ds_seq_cidade: TFocusEdit;
    ed_nr_seq_cidade: TFocusButtonedEdit;
    ed_ds_endereco: TFocusEdit;
    GroupBox5: TGroupBox;
    Label6: TLabel;
    Label5: TLabel;
    ed_nr_tel_celular: TFocusEdit;
    ed_nr_tel_residencial: TFocusEdit;
    gb_Cad_Biometrico: TGroupBox;
    dbg_Digital_Cadastrada: TDBGrid;
    Panel2: TPanel;
    Splitter1: TSplitter;
    ed_nr_seq_turno: TFocusButtonedEdit;
    Label3: TLabel;
    ed_ds_turno: TEdit;
    GroupBox4: TGroupBox;
    dbg_Digital_Dedo: TDBGrid;
    Panel3: TPanel;
    bt_Primeiro: TButton;
    bt_Anterior: TButton;
    bt_Proximo: TButton;
    bt_Ultimo: TButton;
    bt_Novo: TButton;
    bt_Salvar: TButton;
    bt_Cancelar: TButton;
    bt_Excluir: TButton;
    Panel1: TPanel;
    bt_Consultar: TButton;
    bt_Visualizar: TButton;
    bt_Novo_Biometria: TButton;
    bt_Excluir_Biometria: TButton;
    qy_ListaFuncionario: TADOQuery;
    qy_Digital_Cadastrada: TADOQuery;
    qy_Digital_Dedo: TADOQuery;
    ds_ListaFuncionario: TDataSource;
    ds_Digital_Cadastrada: TDataSource;
    ds_Digital_Dedo: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure mi_ConsultarClick(Sender: TObject);
    procedure pm_Lista_FuncPopup(Sender: TObject);
    procedure mi_Ocultar_FiltrosClick(Sender: TObject);
    procedure ed_dt_Criacao_deClick(Sender: TObject);
    procedure ed_dt_Criacao_ateClick(Sender: TObject);
    procedure ed_dt_modificacao_deClick(Sender: TObject);
    procedure ed_dt_modificacao_ateClick(Sender: TObject);
    procedure dbg_ListaFuncionarioDblClick(Sender: TObject);
    procedure ed_Nr_SequenciaChange(Sender: TObject);
    procedure bt_CancelarClick(Sender: TObject);
    procedure qy_Digital_CadastradaAfterScroll(DataSet: TDataSet);
    procedure bt_VisualizarClick(Sender: TObject);
    procedure dbg_ListaFuncionarioTitleClick(Column: TColumn);
    procedure ed_nr_seq_func_calcLeftButtonClick(Sender: TObject);
    procedure ed_nr_seq_cidadeLeftButtonClick(Sender: TObject);
    procedure FocusButtonedEdit1Change(Sender: TObject);
    procedure bt_ConsultarClick(Sender: TObject);
    procedure bt_NovoClick(Sender: TObject);
    procedure bt_SalvarClick(Sender: TObject);
    procedure bt_ExcluirClick(Sender: TObject);
    procedure bt_PrimeiroClick(Sender: TObject);
    procedure bt_AnteriorClick(Sender: TObject);
    procedure bt_ProximoClick(Sender: TObject);
    procedure bt_UltimoClick(Sender: TObject);
    procedure bt_Novo_BiometriaClick(Sender: TObject);
    procedure ed_Nr_SequenciaLeftButtonClick(Sender: TObject);
    procedure ed_nr_seq_turnoLeftButtonClick(Sender: TObject);
    procedure ed_nr_seq_turnoChange(Sender: TObject);
    procedure bt_Excluir_BiometriaClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
      vNitgen:TNitgen;
      g_LeitorIdentificado:boolean;
    procedure ExecutarConsulta(pOrderBy:string);
    procedure ExecutarSQLConsDigital;
    procedure ExecutarSQLConsDigital_Dedo;
    function  Inserir_Func_Biometria(pNr_Seq_Funcionario:integer;pCd_Biometria:WideString):integer;
    procedure Inserir_Func_Biometria_Dedo(pNr_Seq_Func_Biometria,pNr_Seq_dedo,pNr_Sample:integer);
    procedure ClickLvSetado(Sender:TOBject);
    procedure DblClickLvSetado(Sender:TObject);
    { Private declarations }
  public
    procedure Carregar(pNr_Sequencia:integer);
    { Public declarations }
  end;

var
  fm_Cadastro_Funcionario: Tfm_Cadastro_Funcionario;

implementation

uses
  uRelFuncionario,
  uUtilsDatabase;

{$R *.dfm}

procedure Tfm_Cadastro_Funcionario.bt_CancelarClick(Sender: TObject);
begin
  Carregar(StrToIntDef(ed_Nr_Sequencia.Text,0));
end;

procedure Tfm_Cadastro_Funcionario.bt_ConsultarClick(Sender: TObject);
begin
  ExecutarConsulta(GetCampoOrderBy(dbg_ListaFuncionario,lv_ordenacao_setada));
  AutoSizeDbGridCol(dbg_ListaFuncionario);
end;

procedure Tfm_Cadastro_Funcionario.bt_NovoClick(Sender: TObject);
begin
  try
    SetPropertyAttributes(vListaCompObr,'obrigatorio',false);
    LimparCampos(Self,0);
    ed_nm_funcionario.SetFocus;
    bt_Salvar.Enabled := true;
    SetPropertyAttributes(vListaCompObr,'obrigatorio',true);
  except
    on E:Exception do
      Erro(Self.ClassName,'bt_NovoClick',E.Message,True,True,E);
  end;
end;

procedure Tfm_Cadastro_Funcionario.bt_Novo_BiometriaClick(Sender: TObject);
var
  cd_biometria:widestring;
  Obj:Variant;
  ObjResult:TList<Variant>;
  i,vCurrVal:integer;
  vRetry:Boolean;
  vMsgErro:string;
  vDedosIndisp: TStringList;
begin
  try
    vRetry := True;
    while vRetry do
    begin
      vDedosIndisp := Busca_Valores(' select 	  a.nr_seq_dedo '+
                                      ' from	  funcionario_biometria_dedo a,'+
                                      '         funcionario_biometria b'+
                                      ' where	  b.nr_sequencia 		   = a.nr_seq_func_biometria'+
                                      ' and		  b.nr_seq_funcionario = '+IntToStr(vFuncionario.Nr_Sequencia)+
                                      ' group by a.nr_seq_dedo');
      try
        {Usado pra consistir o cadastro do funcionario, a nao permitir inserir digitais iguais}
        CarregarDigitaisLeitor(vNitgen,vFuncionario.Nr_Sequencia,false);

        cd_biometria := vNitgen.RetornaDigitalInformada(vDedosIndisp);
        Obj          := vNitgen.Popular_FIR_Leitor(vFuncionario.Nr_Sequencia,cd_biometria,vMsgErro);
        if not VarIsNull(Obj) and (vMsgErro = '') then
        begin
          try
            ObjResult    := vNitgen.ObterDadosDigitais(Obj);
            if ObjResult.Count > 0 then {ou seja, nao retornou erro}
            begin
              {vCurrVal recebe a sequencia atual "funcionario_biometria_seq" para gravação da tabela filha}
              vCurrVal := Inserir_Func_Biometria(vFuncionario.Nr_Sequencia,cd_biometria);
              if vCurrVal > 0 then
              for i := 0 to ObjResult.Count - 1 do
                Inserir_Func_Biometria_Dedo(vCurrVal,objResult[I].FingerID,objResult[I].SampleNumber)
            end;
          finally
            ObjResult.Free;
          end;
          Carregar(vFuncionario.Nr_Sequencia);
        end
        else
        if vMsgErro = 'duplicado' then
          vRetry := MessageBox('Digital já existe, tentar novamente ?',mConfirmation,bmYES_NO) = IDYES
        else
          vRetry := false;
      finally
        vDedosIndisp.Free;
      end;
    end;
  except
    On E:Exception do
    begin
      Erro(Self.ClassName,'bt_Novo_BiometriaClick',E.Message,True,True,E);
      if Assigned(vDedosIndisp) then
        vDedosIndisp.Free;
    end;
  end;
end;

function Tfm_Cadastro_Funcionario.Inserir_Func_Biometria(pNr_Seq_Funcionario:integer;pCd_Biometria:WideString):integer;
begin
  result := 0;
  try
    ExecutarSQL('insert into funcionario_biometria            '+
                '(cd_biometria,'                               +
                ' nm_usuario_criacao,'                         +
                ' dt_criacao,'                                 +
                ' nr_seq_funcionario)'                         +
                ' values ('                                    +
                QuotedStr(pCd_Biometria)                       +','+
                QuotedStr(Banco_dm.BancoAttributes.User_ID)    +','+
                QuotedStr(DateTimeToStr(now))                  +','+
                IntToStr(pNr_Seq_Funcionario)                  +')');
    result := CurrValue('funcionario_biometria_seq');
  except
    on E:Exception do
      Erro(Self.ClassName,'Inserir_Func_Biometria',E.Message,True,True,E);
  end;
end;

procedure Tfm_Cadastro_Funcionario.Inserir_Func_Biometria_Dedo(pNr_Seq_Func_Biometria,pNr_Seq_dedo,pNr_Sample:integer);
begin
  try
    ExecutarSQL('insert into funcionario_biometria_dedo  '+
                '(nr_seq_dedo,'                           +
                ' nr_sample,'                             +
                ' nr_seq_func_biometria)'                 +
                ' values ('                               +
                IntToStr(pNr_Seq_dedo)                    +','+
                IntToStr(pNr_Sample)                      +','+
                IntToStr(pNr_Seq_Func_Biometria)          +')');
  except
    on E:Exception do
      Erro(Self.ClassName,'Inserir_Func_Biometria_Dedo',E.Message,True,True,E);
  end;
end;

{CONSULTA DE FUNCIONARIO}
procedure Tfm_Cadastro_Funcionario.ExecutarConsulta(pOrderBy:string);
begin
//  try
    qy_ListaFuncionario.Close;
    qy_ListaFuncionario.SQL.Clear;
    qy_ListaFuncionario.SQL.Add('select  a.nr_sequencia,');
    qy_ListaFuncionario.SQL.Add('        a.nm_funcionario::varchar(255)nm_funcionario,');
    qy_ListaFuncionario.SQL.Add('        a.nm_usuario_criacao::varchar(255)nm_usuario_criacao,');
    qy_ListaFuncionario.SQL.Add('        a.dt_criacao,');
    qy_ListaFuncionario.SQL.Add('        a.dt_atualizacao,');
    qy_ListaFuncionario.SQL.Add('        a.nm_usuario_atualizacao::varchar(255) nm_usuario_atualizacao,');
    qy_ListaFuncionario.SQL.Add('        a.ie_inativo,');
    qy_ListaFuncionario.SQL.Add('        a.ds_endereco::varchar(255)ds_endereco,');
    qy_ListaFuncionario.SQL.Add('        a.nr_tel_residencial::varchar(255)nr_tel_residencial,');
    qy_ListaFuncionario.SQL.Add('        a.nr_tel_celular::varchar(255)nr_tel_celular,');
    qy_ListaFuncionario.SQL.Add('        c.ds_cidade::varchar(255) ds_cidade,');
    qy_ListaFuncionario.SQL.Add('        b.ds_turno::varchar(255) ds_turno');
    qy_ListaFuncionario.SQL.Add('from    funcionario a');
    qy_ListaFuncionario.SQL.Add('left join turno b on (a.nr_seq_turno = b.nr_sequencia)');
    qy_ListaFuncionario.SQL.Add('left join cidade c on (a.nr_seq_cidade = c.nr_sequencia)');
    qy_ListaFuncionario.SQL.Add('where   1=1');

    if ed_nr_seq_func_calc.Text <> '' then
      qy_ListaFuncionario.SQL.Add('and a.nr_sequencia = '+ed_nr_seq_func_calc.Text);

    if ed_dt_Criacao_de.Checked then
      qy_ListaFuncionario.SQL.Add('and a.dt_criacao     >= '+QuotedStr(DateToStr(ed_dt_Criacao_de.Date)     +' '+ed_hr_Criacao_de.Text+':00'));

    if ed_dt_Criacao_ate.Checked then
      qy_ListaFuncionario.SQL.Add('and a.dt_criacao     <= '+QuotedStr(DateToStr(ed_dt_Criacao_ate.Date)    +' '+ed_hr_Criacao_ate.Text+':59'));

    if ed_dt_modificacao_de.Checked then
      qy_ListaFuncionario.SQL.Add('and a.dt_atualizacao >= '+QuotedStr(DateToStr(ed_dt_modificacao_de.Date) +' '+ed_hr_Modificacao_de.Text+':00'));

    if ed_dt_modificacao_ate.Checked then
      qy_ListaFuncionario.SQL.Add('and a.dt_atualizacao <= '+QuotedStr(DateToStr(ed_dt_modificacao_ate.Date)+' '+ed_hr_modificacao_ate.Text+':59'));

    if ed_nm_usuario_criacao_filtro.Text <> '' then
      qy_ListaFuncionario.SQL.Add('and lower(a.nm_usuario_criacao) like '+Like(ed_nm_usuario_criacao_filtro.Text));

    if ed_nm_usuario_atualizacao_filtro.Text <> '' then
      qy_ListaFuncionario.SQL.Add('and lower(a.nm_usuario_atualizacao) like '+Like(ed_nm_usuario_atualizacao_filtro.Text));

    if pOrderBy <> '' then
      qy_ListaFuncionario.SQL.Add('order by '+pOrderBy)
    else
      qy_ListaFuncionario.SQL.Add('order by a.nm_funcionario');

    qy_ListaFuncionario.Open;
//  Except
//    on E:Exception do
//      Erro(Self.ClassName,'ExecutarConsulta',E.Message,true,True,E);
//  end;
end;

procedure Tfm_Cadastro_Funcionario.ExecutarSQLConsDigital;
begin
  try
    qy_Digital_Dedo.Close;
    qy_Digital_Cadastrada.Close;

    qy_Digital_Cadastrada.SQL.Clear;

    qy_Digital_Cadastrada.SQL.Add('select a.nr_sequencia,');
    qy_Digital_Cadastrada.SQL.Add('       a.cd_biometria,');
    qy_Digital_Cadastrada.SQL.Add('       a.nm_usuario_criacao,');
    qy_Digital_Cadastrada.SQL.Add('       a.dt_criacao');
    qy_Digital_Cadastrada.SQL.Add('from	  funcionario_biometria a');
    qy_Digital_Cadastrada.SQL.Add('where	1=1');
    qy_Digital_Cadastrada.SQL.Add('and    a.nr_seq_funcionario = '+IntToStr(vFuncionario.Nr_Sequencia));
    qy_Digital_Cadastrada.Open;
  Except
    on E:Exception do
      Erro(Self.ClassName,'ExecutarSQLConsDigital',E.Message,true,True,E);
  end;
end;

procedure Tfm_Cadastro_Funcionario.ExecutarSQLConsDigital_Dedo;
var
  bAtivar:Boolean;
begin
  try
    qy_Digital_Dedo.Close;
    bAtivar := not GridIsNull(dbg_Digital_Cadastrada);
    if bAtivar then
    begin
      qy_Digital_Dedo.SQL.Clear;
      qy_Digital_Dedo.SQL.Add('select a.*,');
      qy_Digital_Dedo.SQL.Add('		    b.ds_dedo');
      qy_Digital_Dedo.SQL.Add('from	  funcionario_biometria_dedo a,');
      qy_Digital_Dedo.SQL.Add('       dedo b');
      qy_Digital_Dedo.SQL.Add('where	a.nr_seq_func_biometria = '+qy_Digital_Cadastrada.FieldByName('nr_sequencia').AsString);
      qy_Digital_Dedo.SQL.Add('and		a.nr_seq_dedo           = b.nr_sequencia');
      qy_Digital_Dedo.Open;
    end;
  Except
    on E:Exception do
      Erro(Self.ClassName,'ExecutarSQLConsDigital_Dedo',E.Message,true,True,E);
  end;
end;

procedure Tfm_Cadastro_Funcionario.ed_nr_seq_func_calcLeftButtonClick(
  Sender: TObject);
begin
  try
    ed_nr_seq_func_calc.Text := fm_Pesquisa_Padrao.AbrirConsulta('funcionario',ed_Nr_Seq_Func_Calc.Text,ed_Nr_Seq_Func_Calc.Nome_Campo_Banco);
  except
    on E:Exception do
      Erro(Self.ClassName,'ed_nr_seq_func_calcLeftButtonClick',E.Message,True,True,E);
  end;
end;

procedure Tfm_Cadastro_Funcionario.ed_nr_seq_turnoChange(Sender: TObject);
begin
  ed_ds_turno.Text := VarToStrDef(Busca_Valor('turno','ds_turno','nr_sequencia',ed_nr_seq_turno.Text),'');
end;

procedure Tfm_Cadastro_Funcionario.ed_nr_seq_turnoLeftButtonClick(
  Sender: TObject);
begin
  try
    ed_nr_seq_turno.Text := fm_Pesquisa_Padrao.AbrirConsulta('turno',ed_nr_seq_turno.Text,ed_nr_seq_turno.Nome_Campo_Banco);
  except
    on E:Exception do
      Erro(Self.ClassName,'ed_nr_seq_turnoLeftButtonClick',E.Message,True,True,E);
  end;
end;

procedure Tfm_Cadastro_Funcionario.FocusButtonedEdit1Change(Sender: TObject);
begin
  try
    ed_ds_seq_cidade.Text := VarToStrDef(Busca_Valor('cidade','ds_cidade','nr_sequencia',ed_nr_seq_cidade.Text),'');
  except
    on E:Exception do
      Erro(Self.ClassName,'ed_nr_seq_cidadeChange',E.Message,True,True,E);
  end;
end;

procedure Tfm_Cadastro_Funcionario.ed_nr_seq_cidadeLeftButtonClick(
  Sender: TObject);
begin
  ed_nr_seq_cidade.Text := fm_Pesquisa_Padrao.AbrirConsulta('cidade',ed_nr_seq_cidade.Text,ed_nr_seq_cidade.Nome_Campo_Banco);
end;

procedure Tfm_Cadastro_Funcionario.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if g_LeitorIdentificado then
    vNitgen.Free;
  inherited;
end;

procedure Tfm_Cadastro_Funcionario.FormCreate(Sender: TObject);
begin
  inherited;
  try
    qy_ListaFuncionario.Connection       := Banco_dm.Conexao_banco_aco;
    qy_Digital_Cadastrada.Connection := Banco_dm.Conexao_banco_aco;
    qy_Digital_Dedo.Connection       := Banco_dm.Conexao_banco_aco;

    lv_ordenacao_setada.OnClick     := ClickLvSetado;
    lv_ordenacao_setada.OnDblClick  := DblClickLvSetado;

    vNitgen                         := TNitgen.Create;
    g_LeitorIdentificado            := vNitgen.InicializarLeitor(False);
    //bt_Novo_Biometria.Enabled       := g_LeitorIdentificado;

    if not g_LeitorIdentificado  then
    begin
      gb_Cad_Biometrico.Caption := gb_Cad_Biometrico.Caption+' [Desabilitado]';
      vNitgen.Free;
    end
    else
    begin
      vNitgen.Cadastrar;
      gb_Cad_Biometrico.Caption := gb_Cad_Biometrico.Caption+' [Habilitado]';
    end;

    pc_Principal.ActivePage := ts_ListaFuncionario;
  except
    on E:Exception do
      Erro(Self.ClassName,'FormCreate',E.Message,false,True,E);
  end;
end;

procedure Tfm_Cadastro_Funcionario.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if pc_Principal.ActivePage = ts_CadastroFuncionario then
  begin
    if (ssCtrl in Shift) and (Key = 83) then
      bt_SalvarClick(Nil);
    if (ssCtrl in Shift) and (Key = 78) then
      bt_NovoClick(Nil);
  end;
end;

procedure Tfm_Cadastro_Funcionario.bt_SalvarClick(Sender: TObject);
var
  bUpdating:boolean;
begin
  try
    if Campo_Invalido(Self,0) then
      Exit;

    bUpdating := ed_Nr_Sequencia.Text <> '';

    if bUpdating then
    begin
      vFuncionario.Nm_Usuario_Atualizacao := Banco_dm.BancoAttributes.User_ID;
      vFuncionario.Dt_Atualizacao         := now;
    end
    else
    begin
      vFuncionario.Nm_Usuario_Criacao     := Banco_dm.BancoAttributes.User_ID;
      vFuncionario.Dt_Criacao             := now;
    end;

    vFuncionario.Nr_Sequencia            := StrToIntDef(ed_Nr_Sequencia.Text,0);
    vFuncionario.Nm_Funcionario          := ed_nm_funcionario.Text;
    vFuncionario.Nr_Seq_Cidade           := StrToIntDef(ed_nr_seq_cidade.Text,0);
    vFuncionario.Ie_Inativo              := Bool_To_S_N(cx_Inativo.Checked);
    vFuncionario.Nr_Seq_Turno            := StrToIntDef(ed_nr_seq_turno.Text,0);
    vFuncionario.Ds_endereco             := ed_ds_endereco.Text;
    vFuncionario.Nr_Tel_Residencial      := ed_nr_tel_residencial.Text;
    vFuncionario.Nr_Tel_Celular          := ed_nr_tel_celular.Text;

    if vFuncionario.Gravar then
    begin
      if bUpdating then
        Carregar(StrToInt(ed_Nr_Sequencia.Text))
      else
        Carregar(vFuncionario.Ultimo);
    end;
  except
    on E:Exception do
      Erro(Self.ClassName,'bt_SalvarClick',E.Message,True,True,E);
  end;
end;

procedure Tfm_Cadastro_Funcionario.bt_VisualizarClick(Sender: TObject);
begin
  inherited;
  try
    if ExisteImpressora then
    begin
      fm_Rel_Funcionario := Tfm_Rel_Funcionario.Create(Application);
      fm_Rel_Funcionario.Qr_Report.Preview;
      //TForm(Retorna_Form(Tfm_Rel_Funcionario.ClassName)).Close;
      fm_Rel_Funcionario.Close;
    end
    else
      fm_Rel_Funcionario.Close;
  except
    fm_Rel_Funcionario.Close;
  end;
end;

procedure Tfm_Cadastro_Funcionario.Carregar(pNr_Sequencia:integer);
var
  bAtivar:boolean;
begin
  try
    SetPropertyAttributes(vListaCompObr,'color',clWindow);

    pc_principal.ActivePage := ts_CadastroFuncionario;
    vFuncionario.Select(pNr_Sequencia);
    bAtivar := vFuncionario.Nr_Sequencia > 0;

    if bAtivar then
    begin
      ed_Nr_Sequencia.Text          := InttoStr(vFuncionario.Nr_Sequencia);
    end;

    ed_nm_funcionario.Text          := vFuncionario.Nm_Funcionario;
    ed_nr_seq_cidade.Text           := IntToVazio(vFuncionario.Nr_Seq_Cidade);
    cx_Inativo.Checked              := vFuncionario.Ie_Inativo = 'S';
    ed_nr_seq_turno.Text            := IntToVazio(vFuncionario.Nr_Seq_Turno);
    ed_ds_endereco.Text             := vFuncionario.Ds_endereco;
    ed_nr_tel_residencial.Text      := vFuncionario.Nr_Tel_Residencial;
    ed_Nr_Tel_Celular.Text          := vFuncionario.Nr_Tel_Celular;

    bt_Excluir.Enabled                := bAtivar;
    bt_Salvar.Enabled                 := bAtivar;
    bt_Cancelar.Enabled               := bAtivar;

    ExecutarSQLConsDigital;

    Bt_Excluir_Biometria.Enabled      := (bAtivar) and (not GridIsNull(dbg_Digital_Cadastrada));
    bt_Novo_Biometria.Enabled         := (bAtivar) and (g_LeitorIdentificado);
  except
    on E:Exception do
      Erro(Self.ClassName,'Carregar',E.Message,True,True,E);
  end;
end;

procedure Tfm_Cadastro_Funcionario.dbg_ListaFuncionarioDblClick(
  Sender: TObject);
begin
  if not GridIsNull(dbg_ListaFuncionario) then
  begin
    Carregar(qy_ListaFuncionario.FieldByName('NR_SEQUENCIA').AsInteger);
    pc_Principal.ActivePage := ts_CadastroFuncionario;
  end;
end;

procedure Tfm_Cadastro_Funcionario.dbg_ListaFuncionarioTitleClick(Column: TColumn);
begin
  OnGridTitleClick(Column,lv_ordenacao_setada);
end;

procedure Tfm_Cadastro_Funcionario.DblClickLvSetado;
begin
  OnDblClickLvSetado(Sender);
end;

procedure Tfm_Cadastro_Funcionario.ed_dt_Criacao_ateClick(Sender: TObject);
begin
  ed_hr_Criacao_ate.Enabled := ed_dt_Criacao_ate.Checked;
end;

procedure Tfm_Cadastro_Funcionario.ed_dt_Criacao_deClick(Sender: TObject);
begin
  ed_hr_Criacao_de.Enabled := ed_dt_Criacao_de.Checked;
end;

procedure Tfm_Cadastro_Funcionario.ed_dt_modificacao_ateClick(
  Sender: TObject);
begin
  ed_hr_Modificacao_ate.Enabled := ed_dt_modificacao_ate.Checked;
end;

procedure Tfm_Cadastro_Funcionario.ed_dt_modificacao_deClick(
  Sender: TObject);
begin
  ed_hr_Modificacao_de.Enabled := ed_dt_modificacao_de.Checked;
end;

procedure Tfm_Cadastro_Funcionario.ed_Nr_SequenciaChange(Sender: TObject);
begin
  Carregar(StrToIntDef(ed_Nr_Sequencia.Text,0));
end;

procedure Tfm_Cadastro_Funcionario.ed_Nr_SequenciaLeftButtonClick(
  Sender: TObject);
begin
  try
    ed_Nr_Sequencia.Text := fm_Pesquisa_Padrao.AbrirConsulta('funcionario',ed_Nr_Sequencia.Text,ed_Nr_Sequencia.Nome_Campo_Banco);
  except
    on E:Exception do
      Erro(Self.ClassName,'ed_Nr_SequenciaLeftButtonClick',E.Message,True,True,E);
  end;
end;

procedure Tfm_Cadastro_Funcionario.mi_ConsultarClick(Sender: TObject);
begin
  bt_Consultar.OnClick(nil);
end;

procedure Tfm_Cadastro_Funcionario.mi_Ocultar_FiltrosClick(Sender: TObject);
begin
  inherited;
  gb_Filtros.Visible := not gb_Filtros.Visible;
end;

procedure Tfm_Cadastro_Funcionario.pm_Lista_FuncPopup(Sender: TObject);
begin
  inherited;
  mi_Consultar.Enabled         := pc_Principal.ActivePage = ts_ListaFuncionario;
  mi_Consultar.Visible         := mi_Consultar.Enabled;

  mi_Ocultar_Filtros.Enabled   := pc_Principal.ActivePage = ts_ListaFuncionario;
  mi_Ocultar_Filtros.Visible   := mi_Ocultar_Filtros.Enabled;
end;

procedure Tfm_Cadastro_Funcionario.qy_Digital_CadastradaAfterScroll(DataSet: TDataSet);
begin
  inherited;
  ExecutarSQLConsDigital_Dedo;
end;

procedure Tfm_Cadastro_Funcionario.bt_AnteriorClick(Sender: TObject);
begin
  inherited;
  if ed_Nr_Sequencia.Text = '' then
    Carregar(vFuncionario.Primeiro)
  else
    Carregar(vFuncionario.Anterior(StrToIntDef(ed_Nr_Sequencia.Text,0)));
end;

procedure Tfm_Cadastro_Funcionario.bt_ProximoClick(Sender: TObject);
begin
  inherited;
  if ed_Nr_Sequencia.Text = '' then
    Carregar(vFuncionario.Ultimo)
  else
    Carregar(vFuncionario.Proximo(StrToIntDef(ed_Nr_Sequencia.Text,0)));
end;

procedure Tfm_Cadastro_Funcionario.bt_PrimeiroClick(Sender: TObject);
begin
  inherited;
  Carregar(vFuncionario.Primeiro);
end;

procedure Tfm_Cadastro_Funcionario.bt_UltimoClick(Sender: TObject);
begin
  inherited;
  Carregar(vFuncionario.Ultimo);
end;

procedure Tfm_Cadastro_Funcionario.bt_ExcluirClick(Sender: TObject);
begin
  inherited;
  if MessageBox('Confirmar a exclusão do funcionário ('+IntToStr(vFuncionario.Nr_Sequencia)+') - "'+
                ed_nm_funcionario.Text+'" ?'+#13+#13+
                'Serão excluídos todos os horários deste funcionário assim como suas digitais',
                mConfirmation,bmYES_NO,db2) =ID_YES
  then
  begin
    ExecutarSQL('delete from funcionario_ponto where nr_seq_funcionario = '+IntToStr(vFuncionario.Nr_Sequencia));
    ExecutarSQL('delete from funcionario_biometria_dedo a '                       +#13+
                'where	exists ( select 1                 '                       +#13+
                '                from	  funcionario_biometria b '                 +#13+
                '                where	a.nr_seq_func_biometria = b.nr_sequencia '+#13+
                '                and		b.nr_seq_funcionario	  = '+IntToStr(vFuncionario.Nr_Sequencia)+')'
                );
    ExecutarSQL('delete from funcionario_biometria where nr_seq_funcionario = '+IntToStr(vFuncionario.Nr_Sequencia));
    ExecutarSQL('delete from tmp_func_horario where nr_seq_funcionario      = '+IntToStr(vFuncionario.Nr_Sequencia));
    if vFuncionario.Deletar(vFuncionario.Nr_Sequencia) then
    begin
      LimparCampos(Self,0);
      Carregar(vFuncionario.Ultimo);
    end;
  end;
end;

procedure Tfm_Cadastro_Funcionario.bt_Excluir_BiometriaClick(Sender: TObject);
begin
  try
    if MessageBox('Confirmar a exclusão da biometria '+
                  QuotedStr(qy_Digital_Cadastrada.FieldByName('nr_sequencia').AsString)+
                  ' do funcionário '+#13+'"'+vFuncionario.Nm_Funcionario+'" ?',
                  mConfirmation,bmYES_NO,db2) = IDYES
    then
    begin
      ExecutarSQL('delete from funcionario_biometria_dedo where nr_seq_func_biometria = '+qy_Digital_Cadastrada.FieldByName('nr_sequencia').AsString);
      ExecutarSQL('delete from funcionario_biometria      where nr_sequencia          = '+qy_Digital_Cadastrada.FieldByName('nr_sequencia').AsString);
      Carregar(StrToIntDef(ed_Nr_Sequencia.Text,0));
    end;
  except
    on E:Exception do
      Erro(Self.ClassName,'bt_Excluir_BiometriaClick',E.Message,True,True,E);
  end;
end;

procedure Tfm_Cadastro_Funcionario.ClickLvSetado(Sender: TOBject);
begin
  OnClickLvSetado(Sender);
end;

end.
