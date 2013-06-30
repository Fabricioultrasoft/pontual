unit uEnvioEmail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, IdIOHandler, IdIOHandlerSocket, IdIOHandlerStack, IdSSL,
  IdSSLOpenSSL, IdMessage, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdExplicitTLSClientServerBase, IdMessageClient, IdSMTPBase,
  IdSMTP, IdUserPassProvider, IdSASL, IdSASLUserPass, IdSASLLogin,
  IdAntiFreezeBase, IdAntiFreeze, IdIntercept, IdLogBase, IdLogEvent, IdText,
  ExtCtrls,IdAttachmentFile,IdEMailAddress,uUtils;

type
  TEnvioEmail = class(TObject)
    v_idHandle:   TIdSSLIOHandlerSocketOpenSSL;
    v_IdMessage:  TIdMessage;
    v_IdSMTP:     TIdSMTP;
    v_CorpoMsg:   TIdText;
    v_Anexo:      TIdAttachmentFile;
  private
    FHost: string;
    FPort: integer;
    FCorpoMensagem: string;
    FArquivoAnexo: string;
    FAssunto: string;
    FDestinatarios: TStringList;
    FEmpresa: string;
//    FUser_ID_Remetente: string;
//    FNomeRemetente: string;
    procedure SetHost(const Value: string);
    procedure SetPort(const Value: integer);
    procedure SetAssunto(const Value: string);
    procedure SetCorpoMensagem(const Value: string);
    procedure SetArquivoAnexo(const Value: string);
    procedure SetDestinatarios(const Value: TStringList);
    procedure SetEmpresa(const Value: string);
  public
    constructor Create;
    destructor Free;
    function Enviar:boolean;
  published
    property Host:string read FHost write SetHost;
    property Port:integer read FPort write SetPort;
    property Assunto: string read FAssunto write SetAssunto;
    property CorpoMensagem: string read FCorpoMensagem write SetCorpoMensagem;
    property ArquivoAnexo: string read FArquivoAnexo write SetArquivoAnexo;
    property Destinatarios: TStringList read FDestinatarios write SetDestinatarios;
    property Empresa: string read FEmpresa write SetEmpresa;
  end;

implementation

uses
  uDataModule;

{ TEnvioEmail }

constructor TEnvioEmail.Create;
begin
  try
    Destinatarios        := TStringList.Create;
    v_idHandle           := TIdSSLIOHandlerSocketOpenSSL.Create(Application);
    v_IdMessage          := TIdMessage.Create(Application);
    v_IdSMTP             := TIdSMTP.Create(Application);
    v_IdSMTP.ReadTimeout := 15000;
    v_IdSMTP.IOHandler   := v_idHandle; {E-mails que usam SSL, senao NIL}
    v_IdSMTP.AuthType    := satDefault; {E-mails com autenticacao, senao satNone}
    v_IdSMTP.UseTLS      := utUseImplicitTLS;
    v_IdSMTP.Host        := 'smtp.gmail.com';{Dados de quem envia}
    v_IdSMTP.Port        := 465;
    v_IdSMTP.Username    := 'abreiter.pontual@gmail.com';
    v_IdSMTP.Password    := 're94088ab';
    Assunto              := '['+Banco_dm.BancoAttributes.Empresa+'] '+'Envio Automático de Backup';
    CorpoMensagem        := 'Empresa: '+Banco_dm.BancoAttributes.Empresa+#13+#10+
                            'Segue em anexo arquivo gerado em ['+DateTimeToStr(now)+']'+#13+
                            'Este arquivo está compactado no formato .ZIP, basta renomear com esta '+
                            'extensão para torná-lo reconhecível. Após isto, o arquivo estará no formato ".backup", '+
                            'este arquivo então estará pronto para ser importado pelo sistema.';
    v_idHandle.SSLOptions.Method  := sslvSSLv23;
  except
    on E:Exception do
      Erro(Self.ClassName,'Create',E.Message,false,true,E)
  end;
end;

function TEnvioEmail.Enviar:boolean;
  function Send:boolean;
  begin
    result := true;
    try
      try
        v_IdSMTP.Connect;
        if v_IdSMTP.AuthType <> satNone then
          v_IdSMTP.Authenticate;
        v_IdSMTP.Send(v_IdMessage);
      finally
        result := true;
        v_IdSMTP.Disconnect();
      end;
    Except
      on E:Exception do
      begin
        result := false; {nao enviou}
        Erro(Self.ClassName,'Send',E.Message,false,true,E)
      end;
    end;
  end;
var
  i:integer;
begin
  result := true; {enviou...Se cair em except result false}
  try
    with v_IdMessage do
    begin
      IsEncoded          := true;
      AttachmentEncoding := 'MIME';
      Encoding           := meMIME;
      ConvertPreamble    := true;
      Priority           := mpNormal;
      ContentType        := 'multipart/mixed';
      CharSet            := 'ISO-8859-1';
      Date               := now;
      ContentDisposition := 'inline';

      v_CorpoMsg           := TIdText.Create(v_IdMessage.MessageParts,nil);
      with v_CorpoMsg do
      begin
        ContentType         := 'text/plain';
        ContentDescription  := 'multipart-1';
        CharSet             := 'ISO-8859-1'; // NOSSA LINGUAGEM PT-BR (Latin-1)!!!!
        ContentTransfer     := '16bit';     { para SAIR ACENTUADO !!!! Pois, 8bit SAI SEM acento !!!!}
        //ContentDescription  := Assunto;
        Body.Clear;
        Body.Add(CorpoMensagem);
      end;
      {Anexo}
      if FileExists(ArquivoAnexo) then
      begin
        v_Anexo              := TIdAttachmentFile.Create(MessageParts,ArquivoAnexo);
        {O anexo será incluido dentro da Parte 1 que foi criada ao adicionar o BodyPlai^}
        with v_Anexo do
        begin
          v_Anexo.ContentType        := 'text/plain'+'; '+'name='+FileName;
          v_Anexo.ContentDescription := 'Arquivo Anexo: '+FileName;
        end;
      end;
      Subject := Assunto;                     {Assunto}
      From.Address  := v_IdSMTP.Username;     {Remetente}
      From.Name     := 'Sistema Pontual';     {Nome (exibição) do Remetente}
      for i := 0 to Destinatarios.Count -1 do
      begin
        Recipients.Add.Address := Destinatarios[i];        {Destinatário}
      end;
    end;

    while true do
    begin
      if Send then
      begin
        result := true;
        Exit;
      end
      else
      if not ConectadoInternet then
        sleep(60*1000) {tempo para retentar = 1 minuto}
      else
        sleep(10000); {10 segundos}
    end;
  Except
    on E:Exception do
    begin
      result := false; {nao enviou}
      Erro(Self.ClassName,'Create',E.Message,false,true,E)
    end;
  end;
end;

destructor TEnvioEmail.Free;
begin
  try
    if Assigned(v_idHandle) then
      FreeAndNil(v_idHandle);
    if Assigned(v_IdMessage) then
      FreeAndNil(v_IdMessage);
    if Assigned(v_IdSMTP) then
      FreeAndNil(v_IdSMTP);
    if Assigned(Destinatarios) then
      Destinatarios.Free;
  except
    on E: Exception do
      Erro(Self.ClassName, 'Free', E.Message, true, true,E);
  end;
end;

procedure TEnvioEmail.SetArquivoAnexo(const Value: string);
begin
  FArquivoAnexo := Value;
end;

procedure TEnvioEmail.SetAssunto(const Value: string);
begin
  FAssunto := Value;
end;

procedure TEnvioEmail.SetCorpoMensagem(const Value: string);
begin
  FCorpoMensagem := Value;
end;

procedure TEnvioEmail.SetDestinatarios(const Value: TStringList);
begin
  FDestinatarios := Value;
end;

procedure TEnvioEmail.SetEmpresa(const Value: string);
begin
  FEmpresa := Value;
end;

procedure TEnvioEmail.SetHost(const Value: string);
begin
  FHost := Value;
end;

procedure TEnvioEmail.SetPort(const Value: integer);
begin
  FPort := Value;
end;

end.
