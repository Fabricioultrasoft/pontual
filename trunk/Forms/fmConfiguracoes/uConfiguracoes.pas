unit uConfiguracoes;

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
  ComCtrls,
  StdCtrls,
  Buttons,
  ExtCtrls,
  uDataModule,
  Mask,
  ADODB,
  Focus,
  uPadrao,
  StrUtils,
  PngImageList,
  uPrincipal,
  uUtils,
  uBackup,
  ImgList,
  Menus,
  CheckLst;

type
  Tfm_Configuracoes = class(Tfm_Padrao)
    pc_Principal: TPageControl;
    ts_Conexao_Bd: TTabSheet;
    lblConexao_lb: TLabel;
    gb_Grid_Conexao: TGroupBox;
    img_list: TPngImageList;
    ts_Manutencao: TTabSheet;
    pc_Manutencao: TPageControl;
    ts_Backup: TTabSheet;
    GroupBox8: TGroupBox;
    GroupBox7: TGroupBox;
    lbx_Backups: TListBox;
    GroupBox2: TGroupBox;
    lbl4: TLabel;
    rg_Tipo_Usuario: TRadioGroup;
    Panel2: TPanel;
    ts_Arquivos_Banco: TTabSheet;
    grp_Arquivos: TGroupBox;
    Label1: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Label5: TLabel;
    Label10: TLabel;
    ed_Caminho_Dir_PostgresSQL: TFocusEdit;
    ed_Caminho_pg_dump_exe: TFocusEdit;
    ed_Caminho_pg_restore_exe: TFocusEdit;
    ed_Caminho_createdb_exe: TFocusEdit;
    ed_Caminho_dropdb_exe: TFocusEdit;
    ed_Caminho_Backup: TFocusEdit;
    Label4: TLabel;
    ed_Caminho_arquivo_pg_hba_conf: TFocusEdit;
    ed_Caminho_arquivo_PostgresSQL_conf: TFocusEdit;
    lbl3: TLabel;
    lbl2: TLabel;
    Panel1: TPanel;
    ed_Caminho_arquivo_config: TFocusEdit;
    lbl1: TLabel;
    rg_Tipo_Exportacao: TRadioGroup;
    TabSheet1: TTabSheet;
    pm_Config: TPopupMenu;
    Label9: TLabel;
    Label11: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    ed_user_admin: TFocusEdit;
    ed_pass_admin: TFocusEdit;
    ed_server: TFocusEdit;
    ed_database: TFocusEdit;
    ed_port: TFocusEdit;
    mi_Abrir_Local: TMenuItem;
    ts_Automatizacao: TTabSheet;
    pc_Automatizacao: TPageControl;
    ts_Email: TTabSheet;
    GroupBox4: TGroupBox;
    ed_email_backups: TFocusEdit;
    Label12: TLabel;
    ts_Agendamento: TTabSheet;
    GroupBox5: TGroupBox;
    ed_hora_envio_backup: TFocusEdit;
    clbx_dias_envio_backup: TFocusCheckListBox;
    Label17: TLabel;
    pm_Fonte_Dados_32_64: TPopupMenu;
    mi_32_bits: TMenuItem;
    mi_64_bits: TMenuItem;
    bt_Salvar: TButton;
    clbx_Comandos: TFocusCheckListBox;
    bt_executar_cmd_banco: TButton;
    bt_Gerar_Backup: TButton;
    bt_Recriar_Banco: TButton;
    bt_Restaurar_Backup: TButton;
    bt_Listar_Backups: TButton;
    bt_procurar_Arq_Postgres: TButton;
    bt_Abrir_Pg_Hba_Conf: TButton;
    bt_Abrir_PostgreSQL_Conf: TButton;
    bt_Testar_conexao: TButton;
    ed_nm_empresa: TFocusEdit;
    Label2: TLabel;
    lb_Driver: TLabel;
    cb_Driver: TFocusCombobox;
    procedure bt_Testar_conexaoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure pc_PrincipalChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bt_procurar_Arq_PostgresClick(Sender: TObject);
    procedure ed_Caminho_Dir_PostgresSQLExit(Sender: TObject);
    procedure bt_Gerar_BackupClick(Sender: TObject);
    procedure bt_Listar_BackupsClick(Sender: TObject);
    procedure bt_Recriar_BancoClick(Sender: TObject);
    procedure bt_SalvarClick(Sender: TObject);
    procedure bt_Abrir_Pg_Hba_ConfClick(Sender: TObject);
    procedure bt_Abrir_PostgreSQL_ConfClick(Sender: TObject);
    procedure mi_Abrir_LocalClick(Sender: TObject);
    procedure pm_ConfigPopup(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure mi_32_bitsClick(Sender: TObject);
    procedure mi_64_bitsClick(Sender: TObject);
    procedure bt_executar_cmd_bancoClick(Sender: TObject);
    procedure clbx_ComandosClickCheck(Sender: TObject);
    procedure bt_Restaurar_BackupClick(Sender: TObject);
  private
    vExtracaoBD:       TExtracaoBD;
    vRestauracaoBackup:TRestauracaoBackup;
    vCreateDB:         TCreateDB;
    vDropDB:           TDropDB;
    procedure CarregarTela;
    procedure ProcurarArquivos;
    procedure ListarBackups;
    procedure RestaurarBackup(pFile:string);
    procedure DroparBanco;
    procedure CriarBanco;
    procedure RecriarBanco;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fm_Configuracoes: Tfm_Configuracoes;

implementation

uses
  uVarGlobal,
  uUtilsDatabase;

{$R *.dfm}

procedure Tfm_Configuracoes.CarregarTela;
var
  i: Integer;
  Dias,
  vPathBackup:string;
begin
  try
    //Banco_dm.BancoAttributes.CarregarAtributos;

    if Banco_dm.BancoAttributes.PathBackup = '' then
    begin
      vPathBackup := IncludeTrailingPathDelimiter(g_VarDiretorioExecutavel+'backup');
      CreateDir(vPathBackup);
      Banco_dm.BancoAttributes.PathBackup := vPathBackup;
    end;

    cb_Driver.Text                          := Banco_dm.BancoAttributes.Driver;
    ed_Caminho_Backup.Text                  := Banco_dm.BancoAttributes.PathBackup;
    ed_Caminho_Dir_PostgresSQL.Text         := Banco_dm.BancoAttributes.PathPostgresInst;
    ed_Caminho_arquivo_pg_hba_conf.Text     := Banco_dm.BancoAttributes.Pg_Hba_Conf;
    ed_Caminho_arquivo_PostgresSQL_conf.Text:= Banco_dm.BancoAttributes.PostgreSQL_Conf;
    rg_Tipo_Usuario.ItemIndex               := AnsiIndexStr(Banco_dm.BancoAttributes.ModoConexao,['F','G']);
    ed_Caminho_pg_dump_exe.Text             := Banco_dm.BancoAttributes.pg_dump_exe;
    ed_Caminho_pg_restore_exe.Text          := Banco_dm.BancoAttributes.pg_restore_exe;
    ed_Caminho_createdb_exe.Text            := Banco_dm.BancoAttributes.createdb_exe;
    ed_Caminho_dropdb_exe.Text              := Banco_dm.BancoAttributes.dropdb_exe;
    ed_database.Text                        := Banco_dm.BancoAttributes.Database;

    ed_email_backups.Text       := Banco_dm.BancoAttributes.Email_Receb_Backup;
    ed_hora_envio_backup.Text   := Banco_dm.BancoAttributes.Hora_Exec_Dump;
    Dias                        := Banco_dm.BancoAttributes.Dias_Exec_Dump;
    for i := 0 to clbx_dias_envio_backup.Items.Count -1 do
      clbx_dias_envio_backup.Checked[i] := (pos(Inttostr(i),Dias) > 0);

    ed_user_admin.Text:= Banco_dm.BancoAttributes.User_Admin;
    ed_pass_admin.Text:= Encrypt(Banco_dm.BancoAttributes.Pass_Admin);
    ed_database.Text  := Banco_dm.BancoAttributes.Database;
    ed_server.Text    := Banco_dm.BancoAttributes.Server;
    ed_port.Text      := IntToStr(Banco_dm.BancoAttributes.Port);
    ed_nm_empresa.Text := Banco_dm.BancoAttributes.Empresa;

    ed_Caminho_arquivo_config.Text := g_VarDiretorioExecutavel + 'Config\Config.ini';
  except
    on E:Exception do
      Erro(Self.ClassName,'CarregarTela',E.Message,true,True,E);
  end;
end;

procedure Tfm_Configuracoes.clbx_ComandosClickCheck(Sender: TObject);
begin
  inherited;
  bt_executar_cmd_banco.Enabled := clbx_Comandos.HasChecked;
end;

procedure Tfm_Configuracoes.CriarBanco;
begin
  vCreateDB.Usuario      := Banco_dm.BancoAttributes.User_Admin;
  vCreateDB.Senha        := Banco_dm.BancoAttributes.Pass_Admin;
  vCreateDB.DbName       := Banco_dm.BancoAttributes.Database;
  vCreateDB.Createdb_exe := Banco_dm.BancoAttributes.createdb_exe;
  vCreateDB.CriarBanco;
end;

procedure Tfm_Configuracoes.DroparBanco;
begin
  vDropDB.DbName      := Banco_dm.BancoAttributes.Database;
  vDropDB.Dropdb_exe  := Banco_dm.BancoAttributes.dropdb_exe;
  vDropDB.Usuario     := Banco_dm.BancoAttributes.User_Admin;
  vDropDB.Senha       := Banco_dm.BancoAttributes.Pass_Admin;
  vDropDB.Deletarbanco;
end;

procedure Tfm_Configuracoes.ed_Caminho_Dir_PostgresSQLExit(
  Sender: TObject);
begin
  inherited;
  if ed_Caminho_Dir_PostgresSQL.Text <> '' then
    ProcurarArquivos;
end;

procedure Tfm_Configuracoes.bt_Testar_conexaoClick(Sender: TObject);
begin
  Banco_dm.Desconectar;
  Banco_dm.BancoAttributes.CarregarAtributos;
  if Banco_dm.Conectado(Banco_dm.BancoAttributes.User_Admin,Banco_dm.BancoAttributes.Pass_Admin) then
    MessageBox('Arquivo de conexão correto e o sistema está configurado para conectar automaticamente no terminal',mInformation,bmOK);
  if Assigned(fm_Principal) then
    fm_Principal.AtualizarUsuario;
end;

procedure Tfm_Configuracoes.bt_Abrir_Pg_Hba_ConfClick(Sender: TObject);
begin
  inherited;
  ExecutarComandoParametrizado(GetWindowsDrive+':\windows\notepad.exe','"'+ed_Caminho_arquivo_pg_hba_conf.Text+'"');
end;

procedure Tfm_Configuracoes.bt_Abrir_PostgreSQL_ConfClick(Sender: TObject);
begin
  inherited;
  ExecutarComandoParametrizado(GetWindowsDrive+':\windows\notepad.exe','"'+ed_Caminho_arquivo_PostgresSQL_conf.Text+'"');
end;

procedure Tfm_Configuracoes.bt_executar_cmd_bancoClick(Sender: TObject);
var
  Db:string;
  vCmdExecutados:TStringList;
begin
  Try
    vCmdExecutados := TStringList.Create;
    Db := NvlStr(Banco_dm.BancoAttributes.Database,Banco_dm.BancoAttributes.Database);
    if db <> '' then
    begin
      if clbx_Comandos.Checked[0] then {Sincronizar Sequences}
        try
          ExecutarSQL('select reset_sequence('+QuotedStr('')+')');
          vCmdExecutados.Add('Ponteiros de sequências ajustados');
        except
          on E:Exception do
            Erro(Self.ClassName,clbx_Comandos.Items[0],E.Message,true,true,E);
        end;

      if clbx_Comandos.Checked[1] then {Reindexar database}
        try
            ExecutarSQL('reindex database "'+db+'"');
            vCmdExecutados.Add('Reindex realizado');
        except
          on E:Exception do
            Erro(Self.ClassName,clbx_Comandos.Items[1],E.Message,true,true,E);
        end;

      if clbx_Comandos.Checked[2] then {Vacuum Simples}
        try
          ExecutarSQL('vacuum');
          vCmdExecutados.Add('Vacuum simples realizado');
        except
          on E:Exception do
            Erro(Self.ClassName,clbx_Comandos.Items[2],E.Message,true,true,E);
        end;

      if clbx_Comandos.Checked[3] then {Vacuum Analyze}
        try
          ExecutarSQL('vacuum analyze');
          vCmdExecutados.Add('Vacuum analyze realizado');
        except
          on E:Exception do
            Erro(Self.ClassName,clbx_Comandos.Items[3],E.Message,true,true,E);
        end;

      if clbx_Comandos.HasChecked then
        MessageBox(vCmdExecutados.Text+#13+#10+'Operações Concluídas',mInformation,bmOK);
    end
    else
      MessageBox('Banco não informado',mExclamation,bmOK);
  Finally
    vCmdExecutados.Free;
  End;
end;

procedure Tfm_Configuracoes.bt_Gerar_BackupClick(Sender: TObject);
var
  vTipoExp:TTipoExtracao;
begin
  vTipoExp := TECompleto;
  try
    case rg_Tipo_Exportacao.ItemIndex of
      0:vTipoExp := TECompleto;
      1:vTipoExp := TESomenteDados;
      2:vTipoExp := TESomenteEstrutura;
    end;
    bt_Gerar_Backup.Enabled := False;
    vExtracaoBD.Dir_Destino := Banco_dm.BancoAttributes.PathBackup;
    vExtracaoBD.Dir_Pg_Dump := Banco_dm.BancoAttributes.pg_dump_exe;
    vExtracaoBD.Usuario     := Banco_dm.BancoAttributes.User_Admin;
    vExtracaoBD.Senha       := Banco_dm.BancoAttributes.Pass_Admin;
    vExtracaoBD.IP_Servidor := Banco_dm.BancoAttributes.Server;
    vExtracaoBD.DataBase    := Banco_dm.BancoAttributes.Database;
    vExtracaoBD.Extrair(vTipoExp);
    bt_Gerar_Backup.Enabled := true;
    bt_Listar_BackupsClick(Nil);
  except
    on E:Exception do
    begin
      Erro(Self.ClassName,'bt_Gerar_BackupClick',E.Message,True,True,E);
      bt_Gerar_Backup.Enabled := True;
    end;
  end;
end;

procedure Tfm_Configuracoes.RecriarBanco;
begin
  try
    if MessageBox('Tenha a certeza de ter o arquivo de backup correto, ou tudo será perdido! Continuar ?',mConfirmation,bmYES_NO) = IDYES then
    begin
      Banco_dm.Desconectar;
      Banco_dm.Conexao_banco_aco.Free;
      DroparBanco;
      CriarBanco;
      Banco_dm.Conexao_banco_aco := TADOConnection.Create(Application);
      Banco_dm.Conexao_banco_aco.LoginPrompt := false;
    end;
  except
    on E:Exception do
      Erro(Self.ClassName,'bt_Recriar_DbClick',E.Message,true,true,E);
  end;
end;

procedure Tfm_Configuracoes.RestaurarBackup(pFile: string);
var
  vTipoExp:TTipoExtracao;
begin
  vTipoExp := TECompleto;
  try
    bt_Restaurar_Backup.Enabled       := false;
    vRestauracaoBackup.Dir_Pg_Restore := ed_Caminho_pg_restore_exe.Text;
    vRestauracaoBackup.Usuario        := Banco_dm.BancoAttributes.User_Admin;
    vRestauracaoBackup.IP_Servidor    := Banco_dm.BancoAttributes.Server;
    vRestauracaoBackup.Arquivo_Dump   := pFile;
    vRestauracaoBackup.Database       := Banco_dm.BancoAttributes.Database;
    vRestauracaoBackup.Senha          := Banco_dm.BancoAttributes.Pass_Admin;

    case rg_Tipo_Exportacao.ItemIndex of
      0:vTipoExp := TECompleto;
      1:vTipoExp := TESomenteDados;
      2:vTipoExp := TESomenteEstrutura;
    end;

    vRestauracaoBackup.RestaurarBackup(vTipoExp);
    bt_Restaurar_Backup.Enabled       := True;
  except
    on E:Exception do
    begin
      Erro(Self.ClassName,'bt_Restaurar_BackupClick',E.Message,True,True,E);
      bt_Restaurar_Backup.Enabled := True;
    end;
  end;
end;

procedure Tfm_Configuracoes.bt_Recriar_BancoClick(Sender: TObject);
begin
  RecriarBanco;
end;

procedure Tfm_Configuracoes.bt_Restaurar_BackupClick(Sender: TObject);
begin
  inherited;
  Banco_dm.Desconectar;
  if lbx_Backups.ItemIndex > -1 then
  begin
    if MessageBox('Confirmar a resturação do backup ?',mExclamation,bmYES_NO) = IDYES then
    begin
      RestaurarBackup(lbx_Backups.Items[lbx_Backups.ItemIndex]);
      if Banco_dm.Conectado(Banco_dm.BancoAttributes.User_Admin,Banco_dm.BancoAttributes.Pass_Admin) then
        if MessageBox('Executar manutenção (Reindex e Vacuum) ?',mConfirmation,bmYES_NO) = IDYES then
          ExecutarManutencaoBanco;
    end;
  end
  else
    Erro(Self.ClassName,'','Arquivo não definido',true,false,Nil);
end;

procedure Tfm_Configuracoes.bt_procurar_Arq_PostgresClick(Sender: TObject);
begin
  inherited;
  if ed_Caminho_Dir_PostgresSQL.Validar then
    ProcurarArquivos
  else
    Erro(Self.ClassName,'bt_procurar_Arq_PostgresClick','É preciso definir o diretório de instalação do banco no servidor',False,false,Nil);
end;

procedure Tfm_Configuracoes.bt_SalvarClick(Sender: TObject);
var
  Dias:string;
  i:integer;
begin
  inherited;
  try
    if ValidCrypt(ed_pass_admin.Text) then
      Banco_dm.BancoAttributes.Pass_Admin := ed_pass_admin.Text;
    Banco_dm.BancoAttributes.User_Admin   := ed_user_admin.Text;
    Banco_dm.BancoAttributes.Database     := ed_database.Text;
    Banco_dm.BancoAttributes.Server       := ed_server.Text;
    Banco_dm.BancoAttributes.Port         := StrToInt(ed_port.Text);
    Banco_dm.BancoAttributes.Empresa      := ed_nm_empresa.Text;
    Banco_dm.BancoAttributes.Driver       := cb_Driver.Text;

    if rg_Tipo_Usuario.ItemIndex <> -1 then
    begin
      Banco_dm.BancoAttributes.ModoConexao := Copy(rg_Tipo_Usuario.Items[rg_Tipo_Usuario.ItemIndex],1,1);
    end
    else
    begin
      Erro(Self.ClassName,'bt_SalvarClick','Tipo de usuário não informado',True,False,Nil);
      Exit;
    end;
    if Assigned(fm_Principal) then
      fm_Principal.AtualizarUsuario;

    if ed_Caminho_Backup.Validar then
      Banco_dm.BancoAttributes.PathBackup := ed_Caminho_Backup.Text;

    if ed_Caminho_Dir_PostgresSQL.Validar then
    begin
      Banco_dm.BancoAttributes.PathPostgresInst := ed_Caminho_Dir_PostgresSQL.Text;
      Banco_dm.BancoAttributes.Pg_Hba_Conf      := ed_Caminho_arquivo_pg_hba_conf.Text;
      Banco_dm.BancoAttributes.PostgreSQL_Conf  := ed_Caminho_arquivo_PostgresSQL_conf.Text;
      Banco_dm.BancoAttributes.pg_dump_exe      := ed_Caminho_pg_dump_exe.Text;
      Banco_dm.BancoAttributes.pg_restore_exe   := ed_Caminho_pg_restore_exe.Text;
      Banco_dm.BancoAttributes.createdb_exe     := ed_Caminho_createdb_exe.Text;
      Banco_dm.BancoAttributes.dropdb_exe       := ed_Caminho_dropdb_exe.Text;
    end;
    Banco_dm.BancoAttributes.Email_Receb_Backup := ed_email_backups.Text;

    for i:=0 to clbx_dias_envio_backup.Items.Count -1 do
      if clbx_dias_envio_backup.Checked[i] then
        Dias := Dias+IntToStr(i)+',';
    Dias := Copy(Dias,1,Length(Dias)-1);
    Banco_dm.BancoAttributes.Dias_Exec_Dump := Dias;
    Banco_dm.BancoAttributes.Hora_Exec_Dump := ed_hora_envio_backup.Text;

    CarregarTela;
  except
    on E:Exception do
    begin
      Erro(Self.ClassName,'bt_SalvarClick',E.Message,true,true,E);
    end;
  end;
end;

procedure Tfm_Configuracoes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if ts_Manutencao.TabVisible then
  begin
    vExtracaoBD.Free;
    vRestauracaoBackup.Free;
    vDropDB.Free;
    vCreateDB.Free;
  end;
  Action := caFree;
  inherited;
end;

procedure Tfm_Configuracoes.FormCreate(Sender: TObject);
var
  DriversList:TStrings;
begin
  inherited;
  try
    CarregarTela;
    vExtracaoBD        := TExtracaoBD.Create;
    vRestauracaoBackup := TRestauracaoBackup.Create;
    vCreateDB          := TCreateDB.Create;
    vDropDB            := TDropDB.Create;
    pc_Principal.ActivePage := ts_Conexao_Bd;
    try
      DriversList := GetODBCDriversList;
      cb_Driver.Items.Assign(DriversList);
    finally
      DriversList.Free;
    end;
  except
    on E:Exception do
      Erro(Self.ClassName,'FormCreate',E.Message,True,True,E)
  end;
end;

procedure Tfm_Configuracoes.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (ssCtrl in Shift) and (Key = 83) then
    bt_SalvarClick(Nil);
end;

procedure Tfm_Configuracoes.ListarBackups;
var
  i:integer;
  vStrList:TStringList;
begin
  lbx_Backups.Items.Clear;
  if ed_Caminho_Backup.Validar then
  begin
    try
      FileSearch(ed_Caminho_Backup.Text,'*.backup',false,vStrList);
      for i := 0 to vStrList.Count -1 do
        lbx_Backups.Items.Add(vStrList[i]);
    finally
      vStrList.Free;
    end;
  end
  else
    Erro(Self.ClassName,'ListarBackups','Diretório não informado ou inválido',true,false,Nil);
end;

procedure Tfm_Configuracoes.mi_32_bitsClick(Sender: TObject);
begin
  inherited;
  ExecutarComandoParametrizado(GetWindowsDrive+':\windows\System32\odbcad32.exe','');
end;

procedure Tfm_Configuracoes.mi_64_bitsClick(Sender: TObject);
begin
  inherited;
  ExecutarComandoParametrizado(GetWindowsDrive+':\windows\SysWOW64\odbcad32.exe','');
end;

procedure Tfm_Configuracoes.mi_Abrir_LocalClick(Sender: TObject);
begin
  inherited;
  ExecutarComandoParametrizado(ExtractFilePath(lbx_Backups.Items.Strings[lbx_Backups.ItemIndex]),'open');
end;

procedure Tfm_Configuracoes.pc_PrincipalChange(Sender: TObject);
begin
  try
    bt_Testar_conexao.Enabled  := pc_Principal.ActivePage = ts_Conexao_Bd;
  except
    on E:Exception do
      Erro(Self.ClassName,'Principal_pcChange',E.Message,true,True,E);
  end;
end;

procedure Tfm_Configuracoes.pm_ConfigPopup(Sender: TObject);
begin
  inherited;
  mi_Abrir_Local.Enabled := (pc_Manutencao.ActivePage = ts_Manutencao) and (lbx_Backups.Items.Count > 0);
  mi_Abrir_Local.Visible := mi_Abrir_Local.Enabled;
end;

procedure Tfm_Configuracoes.ProcurarArquivos;
var
  vStrList:TStringList;
  vCaminho:string;
begin
  inherited;
  try
    ed_Caminho_arquivo_pg_hba_conf.Clear;
    ed_Caminho_arquivo_PostgresSQL_conf.Clear;
    ed_Caminho_pg_dump_exe.Clear;
    ed_Caminho_createdb_exe.Clear;
    ed_Caminho_pg_restore_exe.Clear;
    ed_Caminho_dropdb_exe.Clear;

    if ed_Caminho_Dir_PostgresSQL.Text <> '' then
    begin
      vCaminho := IncludeTrailingPathDelimiter(ed_Caminho_Dir_PostgresSQL.Text);

      FileSearch(vCaminho+'Data','pg_hba.conf',false,vStrList);
      if vStrList.Count>0 then
        ed_Caminho_arquivo_pg_hba_conf.Text := vStrList[0];
      vStrList.Free;

      FileSearch(vCaminho+'Data','postgresql.conf',false,vStrList);
      if vStrList.Count>0 then
        ed_Caminho_arquivo_PostgresSQL_conf.Text := vStrList[0];
      vStrList.Free;

      FileSearch(vCaminho+'Bin','pg_dump.exe',false,vStrList);
      if vStrList.Count>0 then
        ed_Caminho_pg_dump_exe.Text := vStrList[0];
      vStrList.Free;

      FileSearch(vCaminho+'Bin','pg_restore.exe',false,vStrList);
      if vStrList.Count>0 then
        ed_Caminho_pg_restore_exe.Text := vStrList[0];
      vStrList.Free;

      FileSearch(vCaminho+'Bin','createdb.exe',false,vStrList);
      if vStrList.Count>0 then
        ed_Caminho_createdb_exe.Text := vStrList[0];
      vStrList.Free;

      FileSearch(vCaminho+'Bin','dropdb.exe',false,vStrList);
      if vStrList.Count>0 then
        ed_Caminho_dropdb_exe.Text := vStrList[0];
      vStrList.Free;
    end;
  except
    on E:Exception do
      Erro(Self.ClassName,'ProcurarArquivos',E.Message,True,True,E)
  end;
end;

procedure Tfm_Configuracoes.bt_Listar_BackupsClick(Sender: TObject);
begin
  inherited;
  ListarBackups;
end;

end.
