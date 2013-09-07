unit uRotinas_Nitgen;

interface

uses
  Variants,
  Dialogs,
  Windows,
  comobj,

  OleCtrls,
  ActiveX,
  ExtCtrls,
  Generics.Collections,
  Classes;

type
  TNitgen = class
  const
    NBIOstrOLEObject = 'NBioBSPCOM.NBioBSP';
    NBioBSPERROR_NONE = 0;
    NBioBSP_DEVICE_ID_AUTO_DETECT   = 255;
    NBioAPI_WINDOW_STYLE_POPUP      = 0;
    NBioAPI_WINDOW_STYLE_INVISIBLE  = 1;
    NBioAPI_WINDOW_STYLE_CONTINUOUS = 2;
    POLEGAR_DIREITO    = 1;
    INDICADOR_DIREITO  = 2;
    MEDIO_DIREITO      = 3;
    ANELAR_DIREITO     = 4;
    MINIMO_DIREITO     = 5;
    POLEGAR_ESQUERDO   = 6;
    INDICADOR_ESQUERDO = 7;
    MEDIO_ESQUERDO     = 8;
    ANELAR_ESQUERDO    = 9;
    MINIMO_ESQUERDO    = 10;

  private
    FTipoLeitura:string;

    FData:string;
    FHora:string;
    FMinuto:string;
    FSegundo:string;

    procedure SetTipoLeitura(Value: string);
    procedure SetDate;
    procedure SetHora;
    procedure SetMinuto;
    procedure SetSegundo;
  public
    Timer:TTimer;
    UltFuncIdenticado:Integer; {Ultimo funcionário identificado em public}
    DedoDetectado   : Boolean;
    openedDeviceID  : LongWord;
    objExtraction   : Variant;
    objNBioBSP      : Variant;
    objDevice       : Variant;
    objNSearch      : variant;

    constructor Create;
    destructor  Free;
    function    InicializarLeitor(pMostrarErro:boolean):boolean; {Rotina de inicialização}
    procedure   LerDigital(Sender: TObject); {TIMER = Fica rodando na tela de bate ponto}

    procedure   Comparar;                    {Apenas seta o tipo de leitura = 'COMPARAR'}
    procedure   Cadastrar;                    {Apenas seta o tipo de leitura = 'CADASTRAR'}

    procedure   FinalizarCadastro;           {Apenas seta o tipo de leitura = ''}

    function    GetTipoLeitura:      string; {Retorna FTipoLeitura;}
    function    GetUltFuncIdenticado:integer;{Retorna UltFuncIdenticado}
    function    GetDedoDetectado:    Boolean;{Retorna true ou false para DedoDetectado;}

    {Retorna a codificação referente as digitais informadas no cadastro}
    function    RetornaDigitalInformada(pvDedosIndisp:TStringList):widestring;

    {Carrega na memoria do leitor o codigo biometrico e o codigo de funcionario e retorna o objeto referente para posterior gravação no banco}
    function    Popular_FIR_Leitor(pNr_Seq_Funcionario: integer; pCd_Biometria: widestring;var pMsgErro:string):Variant;

    {passa como parametro o objeto vindo de PopularLeitorDigital e retorna num TLIST todos os objetos gerados na gravação das digitais}
    function    ObterDadosDigitais(pObjNSearch:Variant):TList<Variant>;

    {Retorna o codigo do funcionario ao por o dedo no leitor, claro, leitor deve estar carregado com todas as digitais dos funcionarios}
    function    IdentificarDigital(pCd_Digital:widestring): integer;

    {Retorna versao do SDK}
    function    Versao: string;

    procedure AtualizarDateTime;

    function  GetDate:    string;
    function  GetHora:    string;
    function  GetMinuto:  string;
    function  GetSegundo: string;

    property    TipoLeitura:string       read GetTipoLeitura write SetTipoLeitura;
  end;


implementation

uses
  uUtils,
  SysUtils,
  Forms,
  uBatidaPonto,
  uVarGlobal;

{ TNitgen }

constructor TNitgen.Create;
begin
  try
    Timer         := TTimer.Create(Nil);
    Timer.Enabled := false;
    Timer.Interval:= 1000;
    Timer.OnTimer := LerDigital;
  except
    On E:Exception do
      Erro(Self.ClassName,'Create',E.Message,true,true,E);
  end;
end;

destructor TNitgen.Free;
begin
  try
    Timer.Free;
    if not VarIsClear(objDevice) then
      objDevice.Close(objDevice.OpenedDeviceID);
    objNBioBSP      := 0;
    objDevice       := 0;
    objNSearch      := 0;
    objExtraction   := 0;
  Except
    On E:Exception do
      Erro(Self.ClassName,'Create',E.Message,true,true,E);
  end;
end;

function TNitgen.InicializarLeitor(pMostrarErro:boolean):boolean;
var
  iDeviceID:Integer;
  ClassID:  TCLSID;

begin
  result := true;

  if (CLSIDFromProgID(PWideChar(WideString(NBIOstrOLEObject)), ClassID) = S_OK) then {Se está instalado..}
  begin
    try
      try
        objNBioBSP     := CreateOleObject('NBioBSPCOM.NBioBSP');{Create NBioBSP object}
      except
        result := false;
        Erro(Self.ClassName,'InicializarLeitor','Falha ao inicializar o objeto',pMostrarErro,pMostrarErro,Nil);
        Exit;
      end;

      if result then
      begin
        objDevice      := objNBioBSP.Device;
        objExtraction  := objNBioBSP.Extraction;
        objNSearch     := objNBioBSP.NSearch;

        objNSearch.MaxCandidateNumber := 50000;

        if objNSearch.ErrorCode <> NBioBSPERROR_NONE then
        begin
          Erro(Self.ClassName,'InicializarLeitor','Falha ao inicializar Index Search',pMostrarErro,pMostrarErro,Nil);
          if pMostrarErro then
            Encerrar;
        end;

        iDeviceID := NBioBSP_DEVICE_ID_AUTO_DETECT;

        {Close Device}
        openedDeviceID := objDevice.OpenedDeviceID;
        objDevice.Close(openedDeviceID);

        {Open Device}
        objDevice.Open(iDeviceID);

        {Setar o arquivo de tradução em portugues}
        if FileExists(g_VarDiretorioExecutavel+'DLL\NBSP2Por.dll') then
          objNBioBSP.SetSkinResource(g_VarDiretorioExecutavel+'DLL\NBSP2Por.dll');

        if (objDevice.ErrorCode = NBioBSPERROR_NONE) then
        begin
          if GetTipoLeitura = 'COMPARAR' then
            Timer.Enabled   := True;
          objDevice.Open(NBioBSP_DEVICE_ID_AUTO_DETECT) ;
        end
        else
        begin
          result := false;
          Erro(Self.ClassName,'InicializarLeitor','Falha ao inicializar o dispositivo, verifique se o mesmo encontra-se conectado',pMostrarErro,pMostrarErro,Nil);
          if pMostrarErro then
          begin
            Free;
            Encerrar;
          end;
        end;
      end;
    except
      on E:Exception do
      begin
        result := false;
        Erro(Self.ClassName,'InicializarLeitor','Falha ao inicializar o leitor'+#13+E.Message,pMostrarErro,pMostrarErro,E);
        if pMostrarErro then
          Encerrar;
      end;
    end;
  end
  else
  begin
    result := false;
    Erro(Self.ClassName,'InicializarLeitor','DLL de comunicação com leitor não encontrada, instale os drivers que acompanham o dispositivo NITGEN',pMostrarErro,pMostrarErro,Nil);
    //if pMostrarErro then
    //  Encerrar;
  end;
end;

procedure TNitgen.LerDigital(Sender: TObject);
begin
  Try
    {Verifica se foi enviado algo}
    if (GetTipoLeitura <> '') then
    begin
    {Verifica se existe um dedo posicionado no sensor}
      if (objDevice.CheckFinger <>  0)  then
      begin
        if (GetTipoLeitura = 'COMPARAR') then
        begin
          Timer.Enabled               := false;{Interrompe o laço até terminar a comparação}
          objExtraction.DefaultTimeout:= 2000; {Tempo de captura}
          objExtraction.Capture(1);
          IdentificarDigital(objExtraction.TextEncodeFIR);
          DedoDetectado := True;
        end;
      end;
    end;
    AtualizarDateTime;
    fm_Batida_Ponto.tr_RelogioTimer(Sender);
  except
    On E:Exception do
      Erro(Self.ClassName,'Create',E.Message,true,true,E);
  end;
end;

function TNitgen.Popular_FIR_Leitor(pNr_Seq_Funcionario: integer; pCd_Biometria: widestring;var pMsgErro:string):Variant;
begin
  try
    Result := null;

    objNSearch.AddFIR(pCd_Biometria, pNr_Seq_Funcionario);

    if objNSearch.ErrorCode = NBioBSPERROR_NONE then
      Result := objNSearch
    else
    begin
      pMsgErro := LowerCase(objNSearch.ErrorDescription);

      if Pos('duplicate',pMsgErro) > 0  then
        pMsgErro := 'duplicado';

      Erro(Self.ClassName,'PopularLeitorDigital',objNSearch.ErrorDescription+#13+pCd_Biometria+#13+Inttostr(pNr_Seq_Funcionario),false,false,Nil);
    end;
  except
    On E:Exception do
    begin
      pMsgErro := LowerCase(objNSearch.ErrorDescription);
      if Pos('duplicate',pMsgErro) > 0  then
      begin
        Erro(Self.ClassName,'PopularLeitorDigital',pMsgErro,True,False,E);
      end
      else
        Erro(Self.ClassName,'PopularLeitorDigital',pMsgErro+#13+'Funcionario:'+Inttostr(pNr_Seq_Funcionario),True,false,E);
      Exit;
    end;
  end;
end;

procedure TNitgen.Comparar;
begin
  SetTipoLeitura('COMPARAR');
end;

procedure TNitgen.AtualizarDateTime;
begin
  SetDate;
  SetHora;
  SetMinuto;
  SetSegundo;
end;

procedure TNitgen.Cadastrar;
begin
  SetTipoLeitura('CADASTRAR');
end;

function TNitgen.ObterDadosDigitais(pObjNSearch:Variant):TList<Variant>;
var
  i:Integer;
begin
  Result := TList<Variant>.Create;
  if pObjNSearch.ErrorCode = NBioBSPERROR_NONE then
  begin
    for i:=1 to pObjNSearch.Count do
      Result.Add(pObjNSearch.Item[i]);
  end;
end;

function TNitgen.IdentificarDigital(pCd_Digital:widestring): integer;
begin
  objNSearch.IdentifyUser(pCd_Digital, 5);

  if objNSearch.ErrorCode <> NBioBSPERROR_NONE then
    result := 0 {Quer dizer que não encontrou}
  else
    Result := objNSearch.UserID;
  UltFuncIdenticado := Result;

  Timer.Enabled := True;
end;

procedure TNitgen.SetTipoLeitura(Value: string);
begin
  FTipoLeitura := Value;
end;

function TNitgen.GetDedoDetectado: Boolean;
begin
  result := DedoDetectado;
end;

procedure TNitgen.SetDate;
begin
  FData := FormatDateTime('dd-mm-yyyy',now);
end;

function TNitgen.GetDate: string;
begin
  result := FData;
end;

procedure TNitgen.SetHora;
begin
  FHora := FormatDateTime('hh',now);
end;

function TNitgen.GetHora: string;
begin
  result := FHora;
end;

procedure TNitgen.SetMinuto;
begin
  FMinuto := FormatDateTime('nn',now);
end;

function TNitgen.GetMinuto: string;
begin
  result := FMinuto;
end;

procedure TNitgen.SetSegundo;
begin
  FSegundo := FormatDateTime('ss',now);
end;

function TNitgen.GetSegundo: string;
begin
  result := FSegundo;
end;

function TNitgen.GetTipoLeitura: string;
begin
  result := FTipoLeitura;
end;

function TNitgen.GetUltFuncIdenticado: integer;
begin
  result := UltFuncIdenticado;
end;

procedure TNitgen.FinalizarCadastro;
begin
  SetTipoLeitura('');
end;

function TNitgen.RetornaDigitalInformada(pvDedosIndisp:TStringList):widestring;
var
  i:integer;
begin
  result := '';

  pvDedosIndisp.Sort;

  for i := 0 to 10 do
    objExtraction.DisableFingerForEnroll[i] := false;

  for i := 0 to pvDedosIndisp.Count -1 do
    objExtraction.DisableFingerForEnroll[StrToInt(pvDedosIndisp[i])-1] := true;

  objExtraction.Enroll('0',0);
  if objExtraction.ErrorCode = NBioBSPERROR_NONE then   {Registrado com sucesso}
    result := objExtraction.TextEncodeFIR;
end;

function TNitgen.Versao:string;
begin
  result := 'BSP Version: ' + objNBioBSP.MajorVersion + '.' + objNBioBSP.MinorVersion;
end;
end.
