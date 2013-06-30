unit uBackup;

interface

const Espaco=' ';

type TTipoExtracao = (TECompleto,TESomenteDados,TESomenteEstrutura);

type
  TCreateDB = class
  private
    FDbName: string;
    FCreatedb_exe: string;
    FUsuario: string;
    FSenha: string;
    procedure SetDbName(const Value: string);
    procedure SetCreatedb_exe(const Value: string);
    procedure SetUsuario(const Value: string);
    procedure SetSenha(const Value: string);
  public
    function  GetDbName:string;
    function  GetCreatedb_exe:string;
    function  GetUsuario:string;
    function  GetSenha:string;
    procedure CriarBanco;
  published
    property DbName:string read FDbName write SetDbName;
    property Createdb_exe:string read FCreatedb_exe write SetCreatedb_exe;
    property Usuario:string read FUsuario write SetUsuario;
    property Senha:string read FSenha write SetSenha;
  end;

  TDropDB = class
  private
    FSenha: string;
    FDbName: string;
    FDropdb_exe: string;
    FUsuario: string;
    procedure SetDbName(const Value: string);
    procedure SetDropdb_exe(const Value: string);
    procedure SetSenha(const Value: string);
    procedure SetUsuario(const Value: string);
  public
    function  GetDbName:string;
    function  GetDropdb_exe:string;
    function  GetUsuario:string;
    function  GetSenha:string;
    procedure Deletarbanco;
  published
    property DbName:string read FDbName write SetDbName;
    property Dropdb_exe:string read FDropdb_exe write SetDropdb_exe;
    property Usuario:string read FUsuario write SetUsuario;
    property Senha:string read FSenha write SetSenha;
  end;

  TExtracaoBD = class
  private
    FDir_Pg_Dump: string;
    FUsuario: string;
    FSenha: string;
    FDir_Destino: string;
    FIP_Servidor: string;
    FPorta: Integer;
    FDataBase: string;
    FNm_ArquivoDumpGerado: string;
    procedure SetDir_Pg_Dump(const Value: string);
    procedure SetUsuario(const Value: string);
    procedure SetSenha(const Value: string);
    procedure SetDir_Destino(const Value: string);
    procedure SetIP_Servidor(const Value: string);
    procedure SetPorta(const Value: Integer);
    procedure SetDataBase(const Value: string);
    procedure SetNm_ArquivoDumpGerado(const Value: string);
  public
    function GetDir_Pg_Dump:string;
    function GetUsuario:string;
    function GetSenha:string;
    function GetDir_Destino:string;
    function GetIP_Servidor:string;
    function GetPorta:Integer;
    function GetDatabase:string;
    function GetNm_ArquivoDumpGerado:string;
    procedure Extrair(pTipo:TTipoExtracao;pMostraCMD:boolean=true);
  published
    property DataBase:string read FDataBase write SetDataBase; {.exe}
    property Dir_Pg_Dump:string read FDir_Pg_Dump write SetDir_Pg_Dump; {.exe}
    property Usuario:string read FUsuario write SetUsuario;
    property Senha:string read FSenha write SetSenha;
    property Dir_Destino:string read FDir_Destino write SetDir_Destino;
    property IP_Servidor:string read FIP_Servidor write SetIP_Servidor;
    property Porta:integer read FPorta write SetPorta default 0;
    property Nm_ArquivoDumpGerado:string read FNm_ArquivoDumpGerado write SetNm_ArquivoDumpGerado;
  end;

  TRestauracaoBackup=class
  private
    FDir_Pg_Restore: string;
    FUsuario: string;
    FIP_Servidor: string;
    FArquivo_Dump: string;
    FDatabase: string;
    FSenha: string;
    procedure SetDir_Pg_Restore(const Value: string);
    procedure SetUsuario(const Value: string);
    procedure SetIP_Servidor(const Value: string);
    procedure SetArquivo_Dump(const Value: string);
    procedure SetDatabase(const Value: string);
    procedure SetSenha(const Value: string);
  public
    function GetDir_Pg_Restore:string;
    function GetUsuario:string;
    function GetIP_Servidor:string;
    function GetArquivo_Dump:string;
    function GetDatabase:string;
    function GetSenha:string;
    procedure RestaurarBackup(pTipoImportacao:TTipoExtracao);
  published
    property Dir_Pg_Restore:string read FDir_Pg_Restore write SetDir_Pg_Restore; {.exe}
    property Usuario:string read FUsuario write SetUsuario;
    property IP_Servidor:string read FIP_Servidor write SetIP_Servidor;
    property Arquivo_Dump:string read FArquivo_Dump write SetArquivo_Dump;
    property Database:string read FDatabase write SetDatabase;
    property Senha:string read FSenha write SetSenha;
  end;



implementation

uses
  uDataModule,
  uUtils,
  Classes,
  SysUtils,
  StrUtils;

{ TBackup }

procedure TExtracaoBD.Extrair(pTipo:TTipoExtracao;pMostraCMD:boolean=true);
var
  vComando:TStringList;
  vLinhaComando,
  vArqCMD,
  vArqBackup:string;
  i:integer;
  vFormatoNome:string;
  vTipo:string;
begin
  case pTipo of
    TECompleto:        vTipo := '[Completo]';
    TESomenteDados:    vTipo := '[Somente_Dados]';
    TESomenteEstrutura:vTipo := '[Somente_Estrutura]';
  end;

  vComando := TStringList.Create;
  Try
    vFormatoNome := FormatDateTime('YYYY',now)+'_';
    vFormatoNome := vFormatoNome + FormatDateTime('MM',now) +'_'+
                    FormatDateTime('DD',now)                +'_('+
                    FormatDateTime('hh',now)+'.'+FormatDateTime('nn',now)+')_';

    vFormatoNome := vFormatoNome+vTipo;

    if (GetDir_Destino = '') then
      vComando.Add('Diretório de destino do arquivo de backup não definido');
    if (GetDir_Pg_Dump = '') then
      vComando.Add('Diretório do executável "pg_dump.exe" não definido');
    if (GetUsuario = '') then
      vComando.Add('Usuário não definido');
    if (GetSenha = '') then
      vComando.Add('Senha não definida');
    if (GetIP_Servidor = '') then
      vComando.Add('IP do servidor não informado');
    if (GetDatabase = '') then
      vComando.Add('Nome do banco não informado');

    if vComando.Count > 0 then
    begin
      Erro(Self.ClassName,'CriarBackup',vComando.Text,True,false,Nil);
      vComando.Free;
      Exit;
    end;

    vComando.Clear;

    vArqBackup := IncludeTrailingPathDelimiter(GetDir_Destino)+
                  '['+Banco_dm.BancoAttributes.Empresa+']_'+
                  vFormatoNome+'.backup';

    vComando.Add('@echo off');
    vComando.Add('Set PGUSER='+GetUsuario);
    vComando.Add('Set PGPASSWORD='+GetSenha);
    vComando.Add('cls');

    vComando.Add('"'+GetDir_Pg_Dump+'" -i -h '+GetIP_Servidor  +Espaco+
                 IfThen(pTipo=TESomenteEstrutura,'-s')         +Espaco+
                 IfThen(pTipo=TESomenteDados,'-a')             +Espaco+
                 IfThen(GetPorta > 0,'-p '+IntToStr(GetPorta)) +Espaco+
                 '-U '+GetUsuario                              +Espaco+
                 '-E UTF-8'                                    +Espaco+
                 '-C --column-inserts -Z 0 -Ft -b -v'          +Espaco+
                 '-f '+'"'+vArqBackup+'"'                      +Espaco+
                 '"'+GetDatabase+'"'
                 );
    if pMostraCMD then {Caso true, ira mostrar a janela de CMD}
      vComando.Add('pause');

    vArqCMD := IncludeTrailingPathDelimiter(GetTempDir)+'Arq.bat';
    vComando.SaveToFile(vArqCMD);
    i:=0;
    while (i < 10) do
    begin
      if FileExists(vArqCMD) then
        Break;
      Sleep(1000);
      inc(i);
    end;

    if not FileExists(vArqCMD) then
    begin
      Erro(Self.ClassName,'CriarBackup','Comando não pôde ser criado',true,true,Nil);
      vComando.Free;
      Exit;
    end
    else
    begin
      ExecAndWait(vArqCMD,'',StrToInt(IfThen(pMostraCMD,'1','0')));
      Nm_ArquivoDumpGerado := vArqBackup;
        //vComando.SaveToFile('c:\criacao.bat');
      DeleteFile(vArqCMD);
    end;
    vComando.Free;
  except
    on E:Exception do
    begin
      Erro(Self.ClassName,'CriarBackup',E.Message,false,True,E);
      if Assigned(vComando) then
        vComando.Free;
    end;
  End;
end;

function TExtracaoBD.GetDatabase: string;
begin
  result := FDataBase;
end;

function TExtracaoBD.GetDir_Destino: string;
begin
  Result := FDir_Destino;
end;

function TExtracaoBD.GetDir_Pg_Dump: string;
begin
  result := FDir_Pg_Dump;
end;

function TExtracaoBD.GetIP_Servidor: string;
begin
  Result := IP_Servidor;
end;

function TExtracaoBD.GetNm_ArquivoDumpGerado: string;
begin
  result := FNm_ArquivoDumpGerado;
end;

function TExtracaoBD.GetPorta: Integer;
begin
  result := FPorta;
end;

function TExtracaoBD.GetSenha: string;
begin
  result := FSenha;
end;

function TExtracaoBD.GetUsuario: string;
begin
  result := FUsuario;
end;

procedure TExtracaoBD.SetDataBase(const Value: string);
begin
  FDataBase := Value;
end;

procedure TExtracaoBD.SetDir_Destino(const Value: string);
begin
  FDir_Destino := Value;
end;

procedure TExtracaoBD.SetDir_Pg_Dump(const Value: string);
begin
  FDir_Pg_Dump := Value;
end;

procedure TExtracaoBD.SetIP_Servidor(const Value: string);
begin
  FIP_Servidor := Value;
end;

procedure TExtracaoBD.SetNm_ArquivoDumpGerado(const Value: string);
begin
  FNm_ArquivoDumpGerado := Value;
end;

procedure TExtracaoBD.SetPorta(const Value: Integer);
begin
  FPorta := Value;
end;

procedure TExtracaoBD.SetSenha(const Value: string);
begin
  FSenha := Value;
end;

procedure TExtracaoBD.SetUsuario(const Value: string);
begin
  FUsuario := Value;
end;

{ TRestauracaoBackup }

function TRestauracaoBackup.GetArquivo_Dump: string;
begin
  result := FArquivo_Dump;
end;

function TRestauracaoBackup.GetDatabase: string;
begin
  Result := FDatabase;
end;

function TRestauracaoBackup.GetDir_Pg_Restore: string;
begin
  result := FDir_Pg_Restore;
end;

function TRestauracaoBackup.GetIP_Servidor: string;
begin
  Result := IP_Servidor;
end;

function TRestauracaoBackup.GetSenha: string;
begin
  Result := FSenha;
end;

function TRestauracaoBackup.GetUsuario: string;
begin
  result := FUsuario;
end;

procedure TRestauracaoBackup.RestaurarBackup(pTipoImportacao:TTipoExtracao);
var
  vComando:TStringList;
  vArqCMD,
  vArqBackup:string;
  i:integer;
begin
  vComando := TStringList.Create;
  Try

    if (GetArquivo_Dump = '') or (not FileExists(GetArquivo_Dump)) then
      vComando.Add('Arquivo não definido ou inexistente');
    if (GetDir_Pg_Restore = '') then
      vComando.Add('Diretório do executável "pg_restore.exe" nao definido');
    if (GetUsuario = '') then
      vComando.Add('Usuário não definido');
    if ( GetSenha = '') then
      vComando.Add('Senha não definida');
    if (GetDatabase = '') then
      vComando.Add('Banco de dados nao informado');
    if (GetIP_Servidor = '') then
      vComando.Add('IP do servidor nao informado');

    if vComando.Count > 0 then
    begin
      Erro(Self.ClassName,'RestaurarBackup',vComando.Text,true,false,Nil);
      vComando.Free;
      Exit;
    end;

    vComando.Clear;
    vComando.Add('@echo off');
    vComando.Add('set PGUSER='+GetUsuario);
    vComando.Add('set PGPASSWORD='+GetSenha);
    vComando.Add('cls');

    vComando.Add('@echo on');

    vComando.Add('"'+GetDir_Pg_Restore+'" '+
                 IfThen(pTipoImportacao=TESomenteEstrutura,'-s')+Espaco+
                 IfThen(pTipoImportacao=TESomenteDados,'-a')    +Espaco+
                 '-d "'+GetDatabase+'"'                         +Espaco+
                 '-U ' +GetUsuario                              +Espaco+
                 '-h ' +GetIP_Servidor                          +Espaco+
                 '"'   +GetArquivo_Dump+'"'
                 );

    vArqCMD := IncludeTrailingPathDelimiter(GetTempDir)+'Restaurar_backup.bat';

    vComando.Add('pause');

    vComando.SaveToFile(vArqCMD);
    i:=0;
    while (i < 10) do
    begin
      if FileExists(vArqCMD) then
        Break;
      Sleep(1000);
      inc(i);
    end;

    if not FileExists(vArqCMD) then
    begin
      Erro(Self.ClassName,'RestaurarBackup','Comando não pôde ser criado',true,true,Nil);
      vComando.Free;
      Exit;
    end
    else
    begin
      ExecAndWait(vArqCMD,'',1);
      DeleteFile(vArqCMD);
      //vComando.SaveToFile('c:\Restauracao.bat');
    end;

    vComando.Free;
  except
    on E:Exception do
    begin
      Erro(Self.ClassName,'RestaurarBackup',E.Message,false,True,E);
      if Assigned(vComando) then
        vComando.Free;
    end;
  End;
end;

procedure TRestauracaoBackup.SetArquivo_Dump(const Value: string);
begin
  FArquivo_Dump := Value;
end;

procedure TRestauracaoBackup.SetDatabase(const Value: string);
begin
  FDatabase := Value;
end;

procedure TRestauracaoBackup.SetDir_Pg_Restore(const Value: string);
begin
  FDir_Pg_Restore := Value;
end;

procedure TRestauracaoBackup.SetIP_Servidor(const Value: string);
begin
  FIP_Servidor := Value;
end;

procedure TRestauracaoBackup.SetSenha(const Value: string);
begin
  FSenha := Value;
end;

procedure TRestauracaoBackup.SetUsuario(const Value: string);
begin
  FUsuario := Value;
end;

{ TCreateDB }

procedure TCreateDB.CriarBanco;
var
  vComando:TStringList;
  vArqCMD:string;
  i:integer;
begin
  vComando := TStringList.Create;
  Try
    vComando.Clear;
    if (GetDbName = '') then
      vComando.Add('Nome do Banco não definido');
    if (GetCreatedb_exe = '') then
      vComando.Add('Executável do Postgres "Createdb.exe" não definido');
    if (GetUsuario = '') then
      vComando.Add('Usuario nao definido');
    if (GetSenha = '') then
      vComando.Add('Senha nao definida');
    if vComando.Count > 0 then
    begin
      Erro(Self.ClassName,'CriarBanco',vComando.Text,true,false,Nil);
      vComando.Free;
      Exit;
    end;
    vComando.Clear;
    vComando.Add('@echo off');
    vComando.Add('set PGUSER='+GetUsuario);
    vComando.Add('set PGPASSWORD='+GetSenha);
    vComando.Add('cls');
    vComando.Add('echo on');
    vComando.Add('"'+GetCreatedb_exe+'" -E "UTF8" "'+GetDbName);
    vComando.Add('pause');

    vArqCMD := IncludeTrailingPathDelimiter(GetTempDir)+'CriarDB.bat';

    vComando.SaveToFile(vArqCMD);
    i:=0;
    while (i < 10) do
    begin
      if FileExists(vArqCMD) then
        Break;
      Sleep(1000);
      inc(i);
    end;

    if not FileExists(vArqCMD) then
    begin
      Erro(Self.ClassName,'CriarBanco','Comando não pôde ser criado',true,true,Nil);
      vComando.Free;
      Exit;
    end;

    try
      ExecAndWait(vArqCMD,'',1);
    except
    end;

    DeleteFile(vArqCMD);

    vComando.Free;
  except
    on E:Exception do
    begin
      Erro(Self.ClassName,'CriarBanco',E.Message,false,True,E);
      if Assigned(vComando) then
        vComando.Free;
    end;
  End;
end;

function TCreateDB.GetCreatedb_exe: string;
begin
  result := FCreatedb_exe;
end;

function TCreateDB.GetDbName: string;
begin
  Result := FDbName;
end;

function TCreateDB.GetSenha: string;
begin
  result := FSenha;
end;

function TCreateDB.GetUsuario: string;
begin
  Result := FUsuario;
end;

procedure TCreateDB.SetCreatedb_exe(const Value: string);
begin
  FCreatedb_exe := Value;
end;

procedure TCreateDB.SetDbName(const Value: string);
begin
  FDbName := Value;
end;

procedure TCreateDB.SetSenha(const Value: string);
begin
  FSenha := Value;
end;

procedure TCreateDB.SetUsuario(const Value: string);
begin
  FUsuario := Value;
end;

{ TDropDB }

procedure TDropDB.Deletarbanco;
var
  vComando:TStringList;
  vArqCMD:string;
  i:integer;
begin
  vComando := TStringList.Create;
  Try
    vComando.Clear;
    if (GetDbName = '') then
      vComando.Add('Nome do Banco não definido');
    if (GetDropdb_exe = '') then
      vComando.Add('Executável do Postgres "DropDb.exe" não definido');
    if (GetUsuario = '') then
      vComando.Add('Usuario nao definido');
    if (GetSenha = '') then
      vComando.Add('Senha nao definida');
    if vComando.Count > 0 then
    begin
      Erro(Self.ClassName,'Deletarbanco',vComando.Text,true,false,Nil);
      vComando.Free;
      Exit;
    end;
    vComando.Clear;
    vComando.Add('@echo off');
    vComando.Add('set PGUSER='+GetUsuario);
    vComando.Add('set PGPASSWORD='+GetSenha);
    vComando.Add('cls');
    vComando.Add('echo on');
    vComando.Add('"'+GetDropdb_exe+'" "'+GetDbName+'"');
    vComando.Add('pause');
    vArqCMD := IncludeTrailingPathDelimiter(GetTempDir)+'CriarDB.bat';
    vComando.SaveToFile(vArqCMD);
    i:=0;
    while (i < 10) do
    begin
      if FileExists(vArqCMD) then
        Break;
      Sleep(1000);
      inc(i);
    end;

    if not FileExists(vArqCMD) then
    begin
      Erro(Self.ClassName,'Deletarbanco','Comando não pôde ser criado',true,true,Nil);
      vComando.Free;
      Exit;
    end;

    try
      ExecAndWait(vArqCMD,'',1);
    except
    end;

    DeleteFile(vArqCMD);

    vComando.Free;
  except
    on E:Exception do
    begin
      Erro(Self.ClassName,'Deletarbanco',E.Message,false,True,E);
      if Assigned(vComando) then
        vComando.Free;
    end;
  End;
end;

function TDropDB.GetDbName: string;
begin
  result := FDbName;
end;

function TDropDB.GetDropdb_exe: string;
begin
  result := FDropdb_exe;
end;

function TDropDB.GetSenha: string;
begin
  result := FSenha;
end;

function TDropDB.GetUsuario: string;
begin
  result := FUsuario;
end;

procedure TDropDB.SetDbName(const Value: string);
begin
  FDbName := Value;
end;

procedure TDropDB.SetDropdb_exe(const Value: string);
begin
  FDropdb_exe := Value;
end;

procedure TDropDB.SetSenha(const Value: string);
begin
  FSenha := Value;
end;

procedure TDropDB.SetUsuario(const Value: string);
begin
  FUsuario := Value;
end;

end.
