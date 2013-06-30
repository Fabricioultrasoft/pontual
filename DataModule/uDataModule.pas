unit uDataModule;

interface

uses
  SysUtils,
  Classes,
  DB,
  ADODB,
  Controls,
  PngImageList,
  Strutils,
  Forms,
  Windows,
  ImgList,
  Dialogs;


type TBancoAttributes = class;

  TBanco_dm = class(TDataModule)
    img_List: TPngImageList;
    Conexao_banco_aco: TADOConnection;
    procedure DataModuleCreate(Sender: TObject);
  private
  public
    BancoAttributes:TBancoAttributes;
    destructor Free;
    function  Conectado(pUser,pPassword:string):boolean;
    procedure Desconectar;
      { Public declarations }
  end;

  TBancoAttributes = class
  protected
    procedure Salvar(p_Atributo,p_Valor:string);
  private
    FProvider:              string;
    FDriver:                string;
    FPort:                  integer;
    FDatabase:              string;
    FPassword:              string;
    FServer:                string;
    FPersist_Security_Info: string;
    FUser_ID:               string;
    FPass_Admin:            string;
    FUser_Admin:            string;
    FModoConexao:           string;
    FSuperUser: boolean;
    FConectado: boolean;
    FPathBackup: string;
    Fpg_dump_exe: string;
    Fdropdb_exe: string;
    Fcreatedb_exe: string;
    Fpg_restore_exe: string;
    FEmail_Receb_Backup: string;
    FHora_Exec_Dump: string;
    FDias_Exec_Dump: string;
    FDt_Ult_Envio_Backup: TDate;
    FPostgreSQL_Conf: string;
    FPg_Hba_Conf: string;
    FPathPostgresInst: string;
    FAbrir_Configuracoes: string;
    FEmpresa: string;
    procedure SetDatabase(const Value: string);
    procedure SetDriver(const Value: string);
    procedure SetPassword(const Value: string);
    procedure SetPersist_Security_Info(const Value: string);
    procedure SetPort(const Value: integer);
    procedure SetProvider(const Value: string);
    procedure SetServer(const Value: string);
    procedure SetUser_ID(const Value: string);
    procedure SetPass_Admin(const Value: string);
    procedure SetUser_Admin(const Value: string);
    procedure SetModoConexao(const Value: string);
    procedure SetSuperUser(const Value: boolean);
    procedure SetConectado(const Value: boolean);
    procedure SetPathBackup(const Value: string);
    procedure Setcreatedb_exe(const Value: string);
    procedure Setdropdb_exe(const Value: string);
    procedure Setpg_dump_exe(const Value: string);
    procedure Setpg_restore_exe(const Value: string);
    procedure SetEmail_Receb_Backup(const Value: string);
    procedure SetHora_Exec_Dump(const Value: string);
    procedure SetDias_Exec_Dump(const Value: string);
    procedure SetDt_Ult_Envio_Backup(const Value: TDate);
    procedure SetPg_Hba_Conf(const Value: string);
    procedure SetPostgreSQL_Conf(const Value: string);
    procedure SetPathPostgresInst(const Value: string);
    procedure SetAbrir_Configuracoes(const Value: string);
    procedure SetEmpresa(const Value: string);
  public
    procedure CarregarAtributos;
    function  MontarConnString:string; {pTipo = F ou G -> Funcionario ou Gerencia}
    constructor Create;
  //published
    property Provider:              string  read FProvider              write SetProvider;
    property Driver:                string  read FDriver                write SetDriver;
    property User_ID:               string  read FUser_ID               write SetUser_ID;
    property Password:              string  read FPassword              write SetPassword;
    property Persist_Security_Info: string  read FPersist_Security_Info write SetPersist_Security_Info;
    property Database:              string  read FDatabase              write SetDatabase;
    property Server:                string  read FServer                write SetServer;
    property Port:                  integer read FPort                  write SetPort;
    property User_Admin:            string  read FUser_Admin            write SetUser_Admin;
    property Pass_Admin:            string  read FPass_Admin            write SetPass_Admin;
    property ModoConexao:           string  read FModoConexao           write SetModoConexao;
    property SuperUser:             boolean read FSuperUser             write SetSuperUser;
    property Conectado:             boolean read FConectado             write SetConectado;
    property PathBackup:            string  read FPathBackup            write SetPathBackup;
    property Dt_Ult_Envio_Backup:   TDate   read FDt_Ult_Envio_Backup    write SetDt_Ult_Envio_Backup;

    property pg_dump_exe:           string read Fpg_dump_exe            write Setpg_dump_exe;
    property pg_restore_exe:        string read Fpg_restore_exe         write Setpg_restore_exe;
    property createdb_exe:          string read Fcreatedb_exe           write Setcreatedb_exe;
    property dropdb_exe:            string read Fdropdb_exe             write Setdropdb_exe;

    property Email_Receb_Backup:    string read FEmail_Receb_Backup     write SetEmail_Receb_Backup;
    property Hora_Exec_Dump:        string read FHora_Exec_Dump         write SetHora_Exec_Dump;
    property Dias_Exec_Dump:        string read FDias_Exec_Dump         write SetDias_Exec_Dump;
    property Pg_Hba_Conf:           string read FPg_Hba_Conf            write SetPg_Hba_Conf;
    property PostgreSQL_Conf:       string read FPostgreSQL_Conf        write SetPostgreSQL_Conf;
    property PathPostgresInst:      string read FPathPostgresInst       write SetPathPostgresInst;
    property Abrir_Configuracoes:   string read FAbrir_Configuracoes    write SetAbrir_Configuracoes;

    property Empresa:               string read FEmpresa                write SetEmpresa;
  end;

var
  Banco_dm: TBanco_dm;

implementation

uses
  uUtils;

{$R *.dfm}

{ TBanco_dm }
function TBanco_dm.Conectado(pUser,pPassword:string):boolean;
var
  vmsgErro:string;
begin
  try
    Desconectar;
    if not Ping(BancoAttributes.Server) then
    begin
      result := False;
      Erro(Self.ClassName,'Conectado','Erro de conexão'+#13+#13+'Servidor '+BancoAttributes.Server+' não responde.',true,true,Nil);
      Exit;
    end;
    BancoAttributes.User_ID             := pUSer;
    BancoAttributes.Password            := pPassword;
    Conexao_banco_aco.ConnectionString  := Banco_dm.BancoAttributes.MontarConnString;
    Conexao_banco_aco.Connected         := true;
    result                              := Conexao_banco_aco.Connected;
    BancoAttributes.Conectado           := result;
  except
    on E:Exception do
    begin
      result := false;
      vmsgErro := AnsiLowerCase(E.Message);
      if AnsiContainsStr(vmsgErro,'driver') then
        BancoAttributes.Abrir_Configuracoes := 'S';

      Erro(Self.ClassName,'Conectado','Erro de conexão'+#13+#13+E.Message,true,true,E);
    end;
  end;
end;

procedure TBanco_dm.DataModuleCreate(Sender: TObject);
begin
  BancoAttributes := TBancoAttributes.Create;
end;

procedure TBanco_dm.Desconectar;
begin
  BancoAttributes.Conectado   := False;
  Conexao_banco_aco.Connected := False;
  Conexao_banco_aco.Close;
end;

destructor TBanco_dm.free;
begin
  BancoAttributes.Free;
end;

function TBancoAttributes.MontarConnString:string; {pTipo = F ou G -> Funcionario ou Gerencia}
var
  vStrConn:TStringList;
  vUser:string;
  vPass:string;
begin
  vStrConn := TStringList.Create;
  vUser := IfThen(ModoConexao='G',User_ID,User_Admin);
  vPass := IfThen(ModoConexao='G',Password,Pass_Admin);
  try
    vStrConn.Clear;
    vStrConn.Add('Provider='             +Provider             +';');
    vStrConn.Add('User ID='              +vUser                +';');
    vStrConn.Add('Password='             +vPass                +';');
    vStrConn.Add('Persist Security Info='+Persist_Security_Info+';');
    vStrConn.Add('Extended Properties='  +'"DRIVER={'+Driver   +'};');
    vStrConn.Add('Database='             +Database             +';');
    vStrConn.Add('Server='               +Server               +';');
    vStrConn.Add('Port='                 +IntToStr(Port)       +';"');
    result := vStrConn.Text;
  finally
    vStrConn.Free;
  end;
end;

{ TBancoAttributes }

procedure TBancoAttributes.CarregarAtributos;
begin
  ModoConexao         := NvlStr(UpperCase(Obter_Valor_Parametro('Config', 'Definicoes', 'Tipo_Usuario')),'G');
  Driver              := NvlStr(Obter_Valor_Parametro('Config', 'Dados_Conexao', 'DRIVER'),'PostgreSQL ODBC Driver(ANSI)');
  Provider            := NvlStr(Obter_Valor_Parametro('Config', 'Dados_Conexao', 'Provider'),'MSDASQL.1');
  Server              := NvlStr(Obter_Valor_Parametro('Config', 'Dados_Conexao', 'Server'),'localhost');
  Port                := StrToIntDef(NvlStr(Obter_Valor_Parametro('Config', 'Dados_Conexao', 'Port'),'5432'),0);
  User_Admin          := Obter_Valor_Parametro('Config', 'Dados_Conexao', 'User_Admin');
  Pass_Admin          := Decrypt(Obter_Valor_Parametro('Config', 'Dados_Conexao', 'Pass_Admin'));
  Database            := Obter_Valor_Parametro('Config', 'Dados_Conexao', 'Database');

  PathBackup          := Obter_Valor_Parametro('Config', 'Definicoes', 'Diretorio_Backup');
  Dt_Ult_Envio_Backup := StrToDateDef(Obter_Valor_Parametro('Config', 'Automatizacao', 'Dt_Ult_Envio_Backup'),0);
  pg_dump_exe         := Obter_Valor_Parametro('Config', 'ArquivosPostGres', 'pg_dump.exe');
  pg_restore_exe      := Obter_Valor_Parametro('Config', 'ArquivosPostGres', 'pg_restore.exe');
  createdb_exe        := Obter_Valor_Parametro('Config', 'ArquivosPostGres', 'createdb.exe');
  dropdb_exe          := Obter_Valor_Parametro('Config', 'ArquivosPostGres', 'dropdb.exe');

  Email_Receb_Backup  := Obter_Valor_Parametro('Config', 'Automatizacao', 'Email_Recebimento_Backup');
  Hora_Exec_Dump      := Trim(AnsiReplaceStr(Trim(Obter_Valor_Parametro('Config', 'Automatizacao', 'Hora_Exec_Dump')),' ',''));
  Dias_Exec_Dump      := Trim(Obter_Valor_Parametro('Config', 'Automatizacao', 'Dias_Exec_Dump'));

  Pg_Hba_Conf         := Obter_Valor_Parametro('Config', 'ArquivosPostGres', 'Pg_Hba.Conf');
  PostgreSQL_Conf     := Obter_Valor_Parametro('Config', 'ArquivosPostGres', 'PostgreSQL.Conf');

  PathPostgresInst    := Obter_Valor_Parametro('Config', 'PostGreSQL', 'PathPostgresInst');

  Abrir_Configuracoes := Obter_Valor_Parametro('Config', 'Definicoes', 'Abrir_Configuracoes');

  Empresa             := Obter_Valor_Parametro('Config', 'Definicoes', 'Empresa');
end;

constructor TBancoAttributes.Create;
begin
  Persist_Security_Info := 'false';
  CarregarAtributos;
end;

procedure TBancoAttributes.Salvar(p_Atributo,p_Valor:string);
const
  cAtributo : array[0..21] of string=('pass_admin',                                 {0 }
                                      'provider',                                   {1 }
                                      'user_admin',                                 {2 }
                                      'driver',                                     {3 }
                                      'database',                                   {4 }
                                      'server',                                     {5 }
                                      'port',                                       {6 }
                                      'tipo_usuario',                               {7 }
                                      'diretorio_backup',                           {8 }
                                      'abrir_configuracoes',                        {9 }
                                      'empresa',                                    {10}
                                      'pathpostgresinst',                           {11}
                                      'pg_hba.conf',                                {12}
                                      'postgresql.conf',                            {13}
                                      'pg_dump.exe',                                {14}
                                      'pg_restore.exe',                             {15}
                                      'createdb.exe',                               {16}
                                      'dropdb.exe',                                 {17}
                                      'email_recebimento_backup',                   {18}
                                      'dias_exec_dump',                             {19}
                                      'hora_exec_dump',                             {20}
                                      'dt_ult_envio_backup'                         {21}
                                      );
begin
  case AnsiIndexText(AnsiLowerCase(p_Atributo),cAtributo) of
    0:     GravaArquivoIni('Config','Dados_Conexao',   p_Atributo, Encrypt(p_Valor)); {Senha encriptada}
    1..6:  GravaArquivoIni('Config','Dados_Conexao',   p_Atributo, p_Valor);
    7..10: GravaArquivoIni('Config','Definicoes',      p_Atributo, p_Valor);
    11:    GravaArquivoIni('Config','PostGreSQL',      p_Atributo, p_Valor);
    12..17:GravaArquivoIni('Config','ArquivosPostGres',p_Atributo, p_Valor);
    18..21:GravaArquivoIni('Config','Automatizacao',   p_Atributo, p_Valor);
  end;
end;

procedure TBancoAttributes.SetAbrir_Configuracoes(const Value: string);
begin
  FAbrir_Configuracoes := Value;
  Salvar('Abrir_Configuracoes',Value);
end;

procedure TBancoAttributes.SetConectado(const Value: boolean);
begin
  FConectado := Value;
end;

procedure TBancoAttributes.Setcreatedb_exe(const Value: string);
begin
  Fcreatedb_exe := Value;
  Salvar('createdb.exe',Value);
end;

procedure TBancoAttributes.SetDatabase(const Value: string);
begin
  FDatabase := Value;
  Salvar('DATABASE',Value);
end;

procedure TBancoAttributes.SetDias_Exec_Dump(const Value: string);
begin
  FDias_Exec_Dump := Value;
  Salvar('Dias_Exec_Dump',Value);
end;

procedure TBancoAttributes.SetDriver(const Value: string);
begin
  FDriver := Value;
  Salvar('Driver',Value);
end;

procedure TBancoAttributes.Setdropdb_exe(const Value: string);
begin
  Fdropdb_exe := Value;
  Salvar('dropdb.exe',Value);
end;

procedure TBancoAttributes.SetDt_Ult_Envio_Backup(const Value: TDate);
begin
  FDt_Ult_Envio_Backup := Value;
  Salvar('Dt_Ult_Envio_Backup',DateToStr(Value));
end;

procedure TBancoAttributes.SetEmail_Receb_Backup(const Value: string);
begin
  FEmail_Receb_Backup := Value;
  Salvar('Email_Recebimento_Backup',Value);
end;

procedure TBancoAttributes.SetEmpresa(const Value: string);
begin
  FEmpresa := Value;
  Salvar('Empresa',Value);
end;

procedure TBancoAttributes.SetHora_Exec_Dump(const Value: string);
begin
  FHora_Exec_Dump := Value;
  Salvar('Hora_Exec_Dump',Value);
end;

procedure TBancoAttributes.SetModoConexao(const Value: string);
begin
  FModoConexao := Value;
  Salvar('tipo_usuario',Value);
end;

procedure TBancoAttributes.SetPassword(const Value: string);
begin
  FPassword := Value;
end;

procedure TBancoAttributes.SetPass_Admin(const Value: string);
begin
  FPass_Admin := Value;
  Salvar('Pass_Admin',Value);
end;

procedure TBancoAttributes.SetPathBackup(const Value: string);
begin
  FPathBackup := Value;
  Salvar('Diretorio_Backup',Value);
end;

procedure TBancoAttributes.SetPathPostgresInst(const Value: string);
begin
  FPathPostgresInst := Value;
  Salvar('PathPostgresInst',Value);
end;

procedure TBancoAttributes.SetPersist_Security_Info(const Value: string);
begin
  FPersist_Security_Info := Value;
end;

procedure TBancoAttributes.Setpg_dump_exe(const Value: string);
begin
  Fpg_dump_exe := Value;
  Salvar('pg_dump.exe',Value);
end;

procedure TBancoAttributes.SetPg_Hba_Conf(const Value: string);
begin
  FPg_Hba_Conf := Value;
  Salvar('Pg_Hba.Conf',Value);
end;

procedure TBancoAttributes.Setpg_restore_exe(const Value: string);
begin
  Fpg_restore_exe := Value;
  Salvar('pg_restore.exe',Value);
end;

procedure TBancoAttributes.SetPort(const Value: integer);
begin
  FPort := Value;
  Salvar('port',IntToStr(Value));
end;

procedure TBancoAttributes.SetPostgreSQL_Conf(const Value: string);
begin
  FPostgreSQL_Conf := Value;
  Salvar('PostgreSQL.Conf',Value);
end;

procedure TBancoAttributes.SetProvider(const Value: string);
begin
  FProvider := Value;
  Salvar('Provider',Value);
end;

procedure TBancoAttributes.SetServer(const Value: string);
begin
  FServer := Value;
  Salvar('Server',Value);
end;

procedure TBancoAttributes.SetSuperUser(const Value: boolean);
begin
  FSuperUser := Value;
end;

procedure TBancoAttributes.SetUser_Admin(const Value: string);
begin
  FUser_Admin := Value;
  Salvar('User_Admin',Value);
end;

procedure TBancoAttributes.SetUser_ID(const Value: string);
begin
  FUser_ID := Value;
end;

end.
