unit uCadastro_Usuario;

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
  Mask,
  Focus,
  Buttons,
  Grids,
  DBGrids,
  ExtCtrls,
  ComCtrls,
  Menus,
  uManipulacaoDados,
  DB,
  ADODB,
  uDataModule,
  StrUtils;

type
  Tfm_Cadastro_Usuario = class(Tfm_Padrao)
    pc_Principal: TPageControl;
    ts_Lista_Usuario: TTabSheet;
    ts_Cadastro_Usuario: TTabSheet;
    dbg_Usuario: TDBGrid;
    gb_Principal: TGroupBox;
    gb_Dados: TGroupBox;
    Label13: TLabel;
    ed_nm_usuario: TFocusEdit;
    gb_Codigo_Sequencial: TGroupBox;
    Label11: TLabel;
    pm_Lista_Usuario: TPopupMenu;
    mi_Consultar: TMenuItem;
    ed_nr_sequencia: TFocusButtonedEdit;
    cpg_Principal: TCategoryPanelGroup;
    cp_Perm_Global: TCategoryPanel;
    cp_Perm_Detal: TCategoryPanel;
    cx_Permite_Manipular_Usuario: TCheckBox;
    rg_Permite_Select: TRadioGroup;
    rg_Permite_Delete: TRadioGroup;
    rg_Permite_Insert: TRadioGroup;
    rg_Permite_Update: TRadioGroup;
    GroupBox1: TGroupBox;
    dbg_Permissao: TDBGrid;
    GroupBox2: TGroupBox;
    dbg_Permissao_Status: TDBGrid;
    Panel3: TPanel;
    bt_Primeiro: TButton;
    bt_Anterior: TButton;
    bt_Proximo: TButton;
    bt_Ultimo: TButton;
    bt_Novo: TButton;
    bt_Salvar: TButton;
    bt_Excluir: TButton;
    bt_Redefinir_Senha: TButton;
    Panel2: TPanel;
    bt_Consultar: TButton;
    qy_permissao: TADOQuery;
    ds_permissao: TDataSource;
    ds_lista_usuario: TDataSource;
    ds_permissao_status: TDataSource;
    qy_permissao_status: TADOQuery;
    qy_lista_usuario: TADOQuery;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bt_ProximoClick(Sender: TObject);
    procedure bt_AnteriorClick(Sender: TObject);
    procedure bt_PrimeiroClick(Sender: TObject);
    procedure bt_UltimoClick(Sender: TObject);
    procedure dbg_Permissao_StatusDblClick(Sender: TObject);
    procedure qy_PermissaoAfterScroll(DataSet: TDataSet);
    procedure bt_salvarClick(Sender: TObject);
    procedure mi_ConsultarClick(Sender: TObject);
    procedure pm_Lista_UsuarioPopup(Sender: TObject);
    procedure dbg_UsuarioDblClick(Sender: TObject);
    procedure ed_nr_sequenciaChange(Sender: TObject);
    procedure ed_nr_sequenciaLeftButtonClick(Sender: TObject);
    procedure cp_Perm_GlobalCollapse(Sender: TObject);
    procedure cp_Perm_DetalCollapse(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure cp_Perm_GlobalExpand(Sender: TObject);
    procedure cp_Perm_DetalExpand(Sender: TObject);
    procedure bt_ConsultarClick(Sender: TObject);
    procedure bt_NovoClick(Sender: TObject);
    procedure bt_ExcluirClick(Sender: TObject);
    procedure bt_Redefinir_SenhaClick(Sender: TObject);
  private
    procedure ExecutarConsulta(pOrderBy:string);
    procedure Carregar(pNr_Sequencia:integer);
    procedure AtualizarStatus;
    procedure Limpa;
    { Private declarations }
  public
    vUsuario:TUsuario;
    { Public declarations }
  end;

var
  fm_Cadastro_Usuario: Tfm_Cadastro_Usuario;

implementation

uses
  uUtils,
  uPesquisa_Padrao,
  uUtilsDatabase;

{$R *.dfm}

procedure Tfm_Cadastro_Usuario.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  vUsuario.Free;
  Action := caFree;
end;

procedure Tfm_Cadastro_Usuario.FormCreate(Sender: TObject);
begin
  inherited;
  try
    fm_Cadastro_Usuario := Self;
    qy_Permissao.Connection       := Banco_dm.Conexao_banco_aco;
    qy_Permissao_Status.Connection:= Banco_dm.Conexao_banco_aco;
    qy_Lista_Usuario.Connection   := Banco_dm.Conexao_banco_aco;

    vUsuario                      := TUsuario.Create;
    pc_Principal.ActivePage       := ts_Lista_Usuario;
  except
    on E:Exception do
      Erro(Self.ClassName,'FormCreate',E.Message,True,True,E);
  end;
end;

procedure Tfm_Cadastro_Usuario.FormResize(Sender: TObject);
begin
  inherited;
  cp_Perm_Detal.ClientHeight := cpg_Principal.ClientHeight - (cp_Perm_Global.Height+25);
end;

procedure Tfm_Cadastro_Usuario.Limpa;
begin
  rg_Permite_Select.ItemIndex := 2;
  rg_Permite_Insert.ItemIndex := 2;
  rg_Permite_Update.ItemIndex := 2;
  rg_Permite_Delete.ItemIndex := 2;
end;

procedure Tfm_Cadastro_Usuario.mi_ConsultarClick(Sender: TObject);
begin
  inherited;
  bt_Consultar.OnClick(nil);
end;

procedure Tfm_Cadastro_Usuario.pm_Lista_UsuarioPopup(Sender: TObject);
begin
  inherited;
  mi_Consultar.Enabled := pc_Principal.ActivePage = ts_Lista_Usuario;
  mi_Consultar.Visible := mi_Consultar.Enabled;
end;

procedure Tfm_Cadastro_Usuario.qy_PermissaoAfterScroll(DataSet: TDataSet);
begin
  inherited;
  AtualizarStatus;
end;

procedure Tfm_Cadastro_Usuario.AtualizarStatus;
begin
  if not GridIsNull(dbg_Permissao) and (vUsuario.Nr_Sequencia > 0) then
    begin
      qy_Permissao_Status.Close;
      qy_Permissao_Status.Parameters.ParamByName('tabela').Value := qy_Permissao.FieldByName('nm_tabela').AsString;
      qy_Permissao_Status.Parameters.ParamByName('usuario').Value:= vUsuario.Nm_Usuario;
      qy_Permissao_Status.Open;
    end;
end;

procedure Tfm_Cadastro_Usuario.bt_AnteriorClick(Sender: TObject);
begin
  inherited;
  if ed_Nr_Sequencia.Text = '' then
    Carregar(vUsuario.Primeiro)
  else
    Carregar(vUsuario.Anterior(StrToIntDef(ed_Nr_Sequencia.Text,0)));
end;

procedure Tfm_Cadastro_Usuario.bt_ConsultarClick(Sender: TObject);
begin
  inherited;
  ExecutarConsulta('');
end;

procedure Tfm_Cadastro_Usuario.bt_ExcluirClick(Sender: TObject);
begin
  inherited;
  if MessageBox('Excluir usuario "'+AnsiLowerCase(ed_nm_usuario.Text)+'" do banco ?',mConfirmation,bmYES_NO) = IDYES then
  begin
    ExecutarSQL('REVOKE ALL PRIVILEGES on database "'+Banco_dm.BancoAttributes.Database+'"'+' from "'+AnsiLowerCase(ed_nm_usuario.Text)+'"');
    ExecutarSQL('REVOKE ALL on database "'+           Banco_dm.BancoAttributes.Database+'"'+' from "'+AnsiLowerCase(ed_nm_usuario.Text)+'"');
    ExecutarSQL('drop owned by "'+AnsiLowerCase(ed_nm_usuario.Text)+'" cascade');
    ExecutarSQL('drop role "'+AnsiLowerCase(ed_nm_usuario.Text)+'"');
    Limpa;
    LimparCampos(Self,0);
  end;
end;

procedure Tfm_Cadastro_Usuario.bt_NovoClick(Sender: TObject);
begin
  inherited;
  LimparCampos(Self,0);
  bt_Salvar.Enabled := true;
  ed_nm_usuario.Enabled := True;
  ed_nm_usuario.SetFocus;
end;

procedure Tfm_Cadastro_Usuario.bt_PrimeiroClick(Sender: TObject);
begin
  inherited;
  Carregar(vUsuario.Primeiro);
end;

procedure Tfm_Cadastro_Usuario.bt_ProximoClick(Sender: TObject);
begin
  inherited;
  if ed_Nr_Sequencia.Text = '' then
    Carregar(vUsuario.Ultimo)
  else
    Carregar(vUsuario.Proximo(StrToIntDef(ed_Nr_Sequencia.Text,0)));
end;

procedure Tfm_Cadastro_Usuario.bt_Redefinir_SenhaClick(Sender: TObject);
var
  vPass:string;
begin
  inherited;
  if PasswordInputBox(vPass) then
    if MessageBox('Confirmar senha "'+vPass+'" para o usuário "'+ed_nm_usuario.Text+'" ?',mConfirmation,bmYES_NO) = IDYES then
      ExecutarSQL('alter user "'+ed_nm_usuario.Text+'" with encrypted password '+QuotedStr(vPass));
end;

procedure Tfm_Cadastro_Usuario.bt_salvarClick(Sender: TObject);
begin
  inherited;
  ed_nm_usuario.Enabled := false;
  qy_Permissao.Close;
  if vUsuario.Nr_Sequencia > 0 then
  begin
    if cx_Permite_Manipular_Usuario.Enabled then
    begin
      if cx_Permite_Manipular_Usuario.Checked then
      begin
        ExecutarSQL('alter role "'+vUsuario.Nm_Usuario+'" CREATEROLE SUPERUSER');
        ExecutarSQL('grant all on all sequences in schema public to "'+vUsuario.Nm_Usuario+'"');
      end
      else
        ExecutarSQL('alter role "'+vUsuario.Nm_Usuario+'" NOCREATEROLE NOSUPERUSER ');
    end;

    case rg_Permite_Select.ItemIndex of
      0:ExecutarSQL('grant Select on all tables in schema public to "'+vUsuario.Nm_Usuario+'"');
      1:ExecutarSQL('revoke Select on all tables in schema public from "'+vUsuario.Nm_Usuario+'"');
    end;

    case rg_Permite_Insert.ItemIndex of
      0:begin
          ExecutarSQL('grant Insert on all tables in schema public to "'+vUsuario.Nm_Usuario+'"');
          ExecutarSQL('grant all on all sequences in schema public to "'+vUsuario.Nm_Usuario+'"');
        end;
      1:begin
          ExecutarSQL('revoke Insert on all tables in schema public from "'+vUsuario.Nm_Usuario+'"');
          ExecutarSQL('revoke all on all sequences in schema public from "'+vUsuario.Nm_Usuario+'"');
        end;
    end;

    case rg_Permite_Update.ItemIndex of
      0:ExecutarSQL('grant Update on all tables in schema public to "'+vUsuario.Nm_Usuario+'"');
      1:ExecutarSQL('revoke Update on all tables in schema public from "'+vUsuario.Nm_Usuario+'"');
    end;

    case rg_Permite_Delete.ItemIndex of
      0:ExecutarSQL('grant Delete on all tables in schema public to "'+vUsuario.Nm_Usuario+'"');
      1:ExecutarSQL('revoke Delete on all tables in schema public from "'+vUsuario.Nm_Usuario+'"');
    end;

    qy_Permissao.Open;
  end
  else
  begin
    {Novo}
    if VarToStrDef(Busca_Valor('vw_usuario','nr_sequencia','nm_usuario',QuotedStr(ed_nm_usuario.Text)),'') <> '' then
    begin
      Erro(Self.ClassName,'bt_salvarClick','Usuário '+ed_nm_usuario.Text+' já existe',True,False,Nil);
      Exit;
    end
    else
    begin
      if MessageBox('Incluir usuário "'+ed_nm_usuario.Text+'" com permissão para se conectar ao sistema ?',mConfirmation,bmYES_NO) = IDYES then
      begin
        ExecutarSQL('create role "'+AnsiLowerCase(ed_nm_usuario.Text)+'" with ENCRYPTED password '+QuotedStr('123456')+' login');
        MessageBox('Usuário "'+ed_nm_usuario.Text+'" criado com sucesso, sua senha temporária é: 123456'+#13+#13+'Auxilie-o em como alterar sua senha '+#13+'através do menu superior "Sistema/Alterar Senha".'+#13+#13+'Agora defina suas permissões dentro do sistema.',mExclamation,bmOk);
        if cp_Perm_Global.Collapsed then
          cp_Perm_Global.Expand;
        bt_Ultimo.OnClick(nil);
        qy_Permissao.Open;
      end;
    end;
  end;
  Carregar(vUsuario.Nr_Sequencia);
end;

procedure Tfm_Cadastro_Usuario.bt_UltimoClick(Sender: TObject);
begin
  inherited;
  Carregar(vUsuario.Ultimo);
end;

procedure Tfm_Cadastro_Usuario.ExecutarConsulta(pOrderBy: string);
begin
  try
    qy_Lista_Usuario.Close;
    qy_Lista_Usuario.SQL.Clear;

    qy_Lista_Usuario.SQL.Add('select  a.*');
    qy_Lista_Usuario.SQL.Add('from    vw_usuario a');
    qy_Lista_Usuario.SQL.Add('where   1=1');

    if not Banco_dm.BancoAttributes.SuperUser then
      qy_Lista_Usuario.SQL.Add('and a.nm_usuario = '+QuotedStr(Banco_dm.BancoAttributes.User_ID));

    if pOrderBy <> '' then
      qy_Lista_Usuario.SQL.Add('order by '+pOrderBy)
    else
      qy_Lista_Usuario.SQL.Add('order by nm_usuario');

    qy_Lista_Usuario.Open;
  Except
    on E:Exception do
      Erro(Self.ClassName,'ExecutarConsulta',E.Message,true,True,E);
  end;
end;

procedure Tfm_Cadastro_Usuario.Carregar(pNr_Sequencia:integer);
var
  bAtivar:boolean;
begin
  try
    Limpa;

    qy_Permissao.Close;
    qy_Permissao_Status.Close;

    vUsuario.Select(pNr_Sequencia);

    bAtivar := vUsuario.Nr_Sequencia > 0;

    if bAtivar then
    begin
      ed_Nr_Sequencia.Text               := InttoStr(vUsuario.Nr_Sequencia);
      qy_Permissao.Open;
    end;

    ed_nm_usuario.Text                   := vUsuario.Nm_Usuario;
    cx_Permite_Manipular_Usuario.Enabled := bAtivar and (Banco_dm.BancoAttributes.User_ID <> vUsuario.Nm_Usuario);
    cx_Permite_Manipular_Usuario.Checked := (AnsiLowerCase(Copy(vUsuario.ie_permite_criar_usuario,1,1)) = 's') and (cx_Permite_Manipular_Usuario.Enabled);

    bt_Excluir.Enabled         := bAtivar;
    bt_Salvar.Enabled          := bAtivar;
    ed_nm_usuario.Enabled      := bAtivar;
    cp_Perm_Detal.Enabled      := bAtivar;
    cp_Perm_Detal.Enabled      := bAtivar;
    bt_Redefinir_Senha.Enabled := bAtivar;
    AutoSizeDbGridCol(dbg_Permissao);
  except
    on E:Exception do
      Erro(Self.ClassName,'Carregar',E.Message,True,True,Nil);
  end;
end;


procedure Tfm_Cadastro_Usuario.cp_Perm_DetalCollapse(Sender: TObject);
begin
  inherited;
  cp_Perm_Detal.ClientHeight := cpg_Principal.ClientHeight - (cp_Perm_Global.Height+25);
end;

procedure Tfm_Cadastro_Usuario.cp_Perm_DetalExpand(Sender: TObject);
begin
  inherited;
  cp_Perm_Detal.ClientHeight := cpg_Principal.ClientHeight - (cp_Perm_Global.Height+25);
end;

procedure Tfm_Cadastro_Usuario.cp_Perm_GlobalCollapse(Sender: TObject);
begin
  inherited;
  cp_Perm_Detal.ClientHeight := cpg_Principal.ClientHeight - (cp_Perm_Global.Height+25);
end;

procedure Tfm_Cadastro_Usuario.cp_Perm_GlobalExpand(Sender: TObject);
begin
  inherited;
  cp_Perm_Detal.ClientHeight := cpg_Principal.ClientHeight - (cp_Perm_Global.Height+25);
end;

procedure Tfm_Cadastro_Usuario.dbg_Permissao_StatusDblClick(Sender: TObject);
var
  vTipoComando:string[6];
  vComando:string;
  vDescComando:string;
  vTabela:string;
  vSequence:string;
  vTo_From:string;
begin
  inherited;
  if not GridIsNull(dbg_Permissao) and not GridIsNull(dbg_Permissao_Status) and (vUsuario.Nr_Sequencia > 0) then
  begin
    vTabela := qy_Permissao.FieldByName('nm_tabela').AsString;
    vSequence := qy_Permissao.FieldByName('ds_sequence').AsString;

    case AnsiIndexStr(AnsiLowerCase(Copy(dbg_Permissao_Status.SelectedField.FieldName,1,1)),['v','i','e','m']) of
      0:vTipoComando := 'select';
      1:vTipoComando := 'insert';
      2:vTipoComando := 'delete';
      3:vTipoComando := 'update';
    end;

    case AnsiIndexStr(Copy(dbg_Permissao_Status.SelectedField.Value,1,1),['S']) of
      0:begin
          vComando     := 'revoke';
          vDescComando := 'Negar';
          vTo_From     := ' from ';
        end
        else
        begin
          vComando     := 'grant';
          vDescComando := 'Permitir';
          vTo_From     := ' to ';
        end;
    end;

    if MessageBox('Usuário: '+vUsuario.Nm_Usuario+#13+
                  'Tabela: ' +vTabela+#13+
                  'Comando:' +UpperCase(dbg_Permissao_Status.SelectedField.FieldName)+#13+#13+
                  vDescComando+'?',mConfirmation,bmYES_NO) = IDYES
    then
    begin
      ExecutarSQL(vComando+' '+vTipoComando+' on "'+vTabela+'" '+vTo_From+' "'+vUsuario.Nm_Usuario+'"');
      if (vTipoComando = 'insert') and (vSequence <> '') then
        ExecutarSQL(vComando+' all on '+vSequence+' '+vTo_From+' "'+vUsuario.Nm_Usuario+'"');
      AtualizarStatus;
    end;
  end;
end;

procedure Tfm_Cadastro_Usuario.dbg_UsuarioDblClick(Sender: TObject);
begin
  inherited;
  if not (qy_Lista_Usuario.IsEmpty) then
  begin
    Carregar(qy_Lista_Usuario.FieldByName('nr_sequencia').AsInteger);
    pc_Principal.ActivePage := ts_Cadastro_Usuario;
  end;
end;

procedure Tfm_Cadastro_Usuario.ed_nr_sequenciaChange(Sender: TObject);
begin
  inherited;
  Carregar(StrToIntDef(ed_nr_sequencia.Text,0));
end;

procedure Tfm_Cadastro_Usuario.ed_nr_sequenciaLeftButtonClick(Sender: TObject);
begin
  inherited;
  try
    ed_Nr_Sequencia.Text := fm_Pesquisa_Padrao.AbrirConsulta('vw_usuario',ed_Nr_Sequencia.Text,ed_Nr_Sequencia.Nome_Campo_Banco);
  except
    on E:Exception do
      Erro(Self.ClassName,'ed_Nr_SequenciaLeftButtonClick',E.Message,True,True,E);
  end;
end;

end.
