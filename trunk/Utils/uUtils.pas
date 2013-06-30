unit uUtils;

interface

uses
  SysUtils,
  Grids,
  DB,
  DbGrids,
  Dialogs,
  IniFiles,
  ADODB,
  Forms,
  Classes,
  ComCtrls,
  IdBaseComponent,
  IdIcmpClient,
  Focus,
  Windows,
  StrUtils,
  rtti,
  TypInfo,
  uRotinas_Nitgen,
  Menus,
  ShellAPI,
  CommCtrl,
  Controls,
  Messages,
  StdCtrls,
  IdSNTP,
  Winsock,
  IdHTTP,
  Printers,
  Buttons,
  Registry,
  variants,
  Generics.Collections,
  ZipForge,
  WinInet,
  DateUtils,
  ComObj;

  type
  TExec = procedure of object;

  type
  TTipoMensagem = (mError,mConfirmation,mExclamation,mInformation);

  type
  TTipoDefaultButton = (db1,db2,db3);

  type
  TTipoBotaoMensagem = (bmOK,bmOK_CANCEL,bmYES_NO, bmIGNORE);

  type
  TExceptionRec=record
    EClasse:string;
    EUnitName:string;
    ECode:Integer;
    EMessage:string;
    EMensagemTratada:string;
  end;


procedure ExecutarManutencaoBanco;
procedure AutoSizeStrGridCol(Grid: TStringGrid; Column: integer);
procedure AutoSizeDbGridCol(Grid:TDBGrid);

function ExecAndWait(const Filename, Params: string; WindowState: word): boolean;

function ExisteImpressora:boolean;

{Funcoes de conexao}
function  ObterDataHoraInternet:boolean;
procedure LimparDiretorio(pDiretorio,pExtensao:string);
function  LocalIP: string;
//function  GetExternalIP:string;
function  IAddrToHostName(const IP: string): string;
function  GetODBCDriversList: TStrings;

{Rotinas para gravar/recuperar informações INI}
function  Obter_Valor_Parametro(NomeArquivo: String; Secao: String;Descricao: String): String;
procedure GravaArquivoIni(NomeArquivo: String; Secao: String; Descricao: String;Valor: String);

{Manipulação de Formulario}
procedure CriaForm(ClasseForm: TFormClass);
function  Retorna_Form(pNomeForm: String): TForm;
procedure RestartApplication;
Function  Ping(HostName: String): boolean;
procedure Erro(pTela,pMetodo,pMsgErro:String;pExibirErro:boolean;pGravarErro:boolean;E:Exception);
function  RPad(value:string; tamanho:integer; caractere:char): string;
function  Campo_Invalido(pForm:TForm;pCodigoGrupoTela:integer): Boolean;

{Funções DBGrid}
function  GetCampoOrderBy(pDbGrid:TDBGrid; pListView:TListView):string;
function  GridIsNull(pdbGrid:TdbGrid):boolean;

{Funcoes ListView}
procedure OnClickLvSetado(Sender:TOBject);
procedure OnDblClickLvSetado(Sender:TOBject);
procedure OnGridTitleClick(Column: TColumn;lv_ordenacao_setada:TListView);
function  MoveListViewItem(listView: TListView; ItemFrom, ItemTo: Word): Boolean;

{Funções String}
function  DateTimeToStrTime(pDateTime:string):string;
function  Bool_To_S_N(Value:boolean):char;
function  BoolToStr(Value:boolean):string;
function  ContemItemMenu(pMenu:TMainMenu;pNomeItem:string):boolean;
function  DateTimeToStrNull(const DateTime: TDateTime):string;overload;
function  DateTimeToStrNull(pString:string):string;overload;
function  DateTimeToStrH(const DateTime: TDateTime): string;
function  Decrypt(pStr:String):string;
function  IntToNull(pNumero:string):string;
function  IntToVazio(pValue:integer):string;
function  NvlStr(pTexto1,pTexto2:string):string;
function  NvlValidarInteger(pN1Correto:string;pNRetorno:integer):string;
function  Opcao(Cadeia, Separador: String; Posicao: byte; ie_opcao_p: string): string;
function  NomeDoMes(pDate:TDate):string;
function  NomeDoDia(pDate : TDateTime):string;
function  Dia_Semana(pDate:TDateTime):integer;
function  Encrypt(pStr:String):string;
function  ValidCrypt(pStr:string):boolean;
function  Retorna_Index_StrList(pProcura:string;pStrList:TStrings):integer;
function  PasswordInputBox(var PassResult:string):boolean; {Se cancelou, false, se erro, true}
function  ContemStrList(pStrList:TStringList;pTexto:string):Boolean;
function  IndexContainsArray(pText:string;pArrayText:array of string):integer;
procedure Encerrar;
procedure LimparCampos(pForm:TForm;pCodigoGrupoTela:integer);
procedure ExecMethod(pObject: TObject; MethodName: string) ;

function  ListaComponentes( pForm:TForm;
                            pCodigoGrupoTela:integer;
                            pAttr:string;
                            pAttrValue:Variant):TList<TObject>;

procedure SetPropertyAttributes(pComponentes:TList<TObject>;pAtributo:string;pValor:Variant);
procedure SetPropertyObject(pComponente:TObject;pAtributo:string;pValor:variant);

{Funções de sistema operacional}
procedure SetarParametroRegiao;
function  GetWindowsDrive: Char; {retorna a letra do drive onde está instalado o Windows}
procedure ExecutarComandoParametrizado(diretorio_executavel_p,comando_p :string);
function  GetTempDir: string;
procedure InstalarFonte;

{Buscador de arquivos}
procedure FileSearch(const PathName, FileName : string; const InDir : boolean;var pStrList:TStringList);

function  Obter_Valor_Registro(RootKey: HKEY; Key, Value: string): variant;
procedure Gravar_Valor_Registro(RootKey: HKEY; Key, Value: string; RegDataType: TRegDataType; Data: variant; Oper:String);
function  MessageBox(pTexto:string;
                     pTipoMsg:TTipoMensagem;
                     pTipoBotaoMensagem:TTipoBotaoMensagem;
                     pTipoDefaultButton:TTipoDefaultButton = db1):integer;

procedure Zip(pZipFileName,pAddFileName:string;pMostrarErro:boolean);
procedure Unzip(CaminhoArquivo:String);
function  ValidaEmail(email:String):boolean;
function  GetParentDirectory(path : string) : string;
function  ConectadoInternet:boolean;
function  TimeToSeconds(const sTime : String): Int64;
function  DateDiffSec(pDt_Inicial,pDt_Final:TDateTime):integer;

function GetFileModDate(filename : string) : TDateTime;
Function GetRouterIP: string;

const
  Nm_Unit = 'uUtils';

implementation

uses uVarGlobal,
    uUtilsDatabase,
    uDataModule;

function Opcao(Cadeia, Separador: String; Posicao: byte; ie_opcao_p: string): string;
{
  Cadeia              = Cadeia de caracteres
  Separador           = Delimitador ',' etc..
  Posicao             = Texto após cada delimitador ([TEXTO]Delimitador1,[TEXTO]Delimitador2...)
  TamanhoDelimitador  = Delimitador maior que 1 caracter (,,)
  IE_Opcao_p          =
  'T' - Separar texto
  'C' - Obter quantidade caracteres antes e após delimitador
}

var
  a, i, resultado: integer;
  TamanhoDelimitador:Byte;
begin
  try
    TamanhoDelimitador := Length(Separador);
    a := 0;
    i := 1;
    Cadeia := Cadeia + Separador;

    if UpperCase(ie_opcao_p) = 'T' then
    begin
      while i <= Length(Cadeia) do
      begin
        if Copy(Cadeia, i, TamanhoDelimitador) = Separador then
        begin
          Posicao := Posicao - TamanhoDelimitador;
          if Posicao = 0 then
            break
          else
            a := i;
        end;
        i := i + TamanhoDelimitador;
      end;

      if Posicao = 0 then
        Result := Copy(Cadeia, a + TamanhoDelimitador, i - TamanhoDelimitador - a)
      else
        Result := '';
    end
    else
    if UpperCase(ie_opcao_p) = 'C' then
    begin
      resultado := 0;
      for i := 0 to Length(Cadeia) do
      begin
        if Copy(Cadeia, i, TamanhoDelimitador) = Separador then
          resultado := resultado + 1;
      end;
      Result := IntToStr(resultado);
    end;
  Except
    on E:Exception do
      Erro(Nm_Unit,'Opcao',E.Message,True,True,E);
  end;
end;

function  ContemItemMenu(pMenu:TMainMenu;pNomeItem:string):boolean;
var
  i:integer;
begin
  result := false;
  Try    
    for i:=0 to pMenu.Items.Count -1 do
      if pMenu.Items[i].Find(pNomeItem) <> nil then
      begin
        result := true;
        break;
      end;
  Except
    on E:Exception do
      Erro(Nm_Unit,'ContemItemMenu',E.Message,True,true,E);
  end;
end;

procedure AutoSizeStrGridCol(Grid: TStringGrid; Column: integer);
var
  i, W, WMax: integer;
begin
  try
    WMax := 0;
    for i := 0 to (Grid.RowCount - 1) do
    begin
      W := Grid.Canvas.TextWidth(Grid.Cells[Column, i]);
      if (W > WMax) and (W < 500) then
        WMax := W;
    end;
    Grid.ColWidths[Column] := WMax + 20;
  Except
    on E:Exception do
      Erro(Nm_Unit,'AutoSizeCol',E.Message,True,true,E);

  end;
end;

procedure AutoSizeDbGridCol(Grid:TDBGrid);
const
  DEFBORDER = 10;
var
  temp, n: Integer;
  lmax: array [0..30] of Integer;
begin
  try
    if not GridIsNull(Grid) then
    with Grid do
    begin
      Canvas.Font := Font;
      for n := 0 to Columns.Count - 1 do
        if Assigned(Fields[n]) then
          lmax[n] := Canvas.TextWidth(Fields[n].FieldName) + DEFBORDER;
      grid.DataSource.DataSet.First;
      while not grid.DataSource.DataSet.EOF do
      begin
        for n := 0 to Columns.Count - 1 do
        begin
          if Assigned(Fields[n]) then
          begin
            temp := Canvas.TextWidth(trim(Columns[n].Field.DisplayText)) + DEFBORDER;
            if temp > lmax[n] then
              lmax[n] := temp;
          end;
          //end; { if }
        end;
        grid.DataSource.DataSet.Next;
      end;
      grid.DataSource.DataSet.First;
      for n := 0 to Columns.Count - 1 do
        if lmax[n] > 0 then
          Columns[n].Width := lmax[n];
    end; { With }
  except
    on E:Exception do
      Erro(Nm_Unit,'AutoSizeDbGridCol',E.Message,True,True,E);
  end; {SetGridColumnWidths  }

end;

procedure GravaArquivoIni(NomeArquivo: String; Secao: String; Descricao: String;
  Valor: String);
var
  ArquivoINI: TIniFile;
begin
  ArquivoINI := TIniFile.Create(g_VarDiretorioExecutavel + ('Config\' + NomeArquivo + '.ini'));
  if not DirectoryExists(ExtractFilePath(ArquivoINI.FileName)) then
    CreateDir(ExtractFilePath(ArquivoINI.FileName));
  try
    ArquivoINI.WriteString(Secao, Descricao, Valor);
  finally
    ArquivoINI.Free;
  end;
end;

function Obter_Valor_Parametro(NomeArquivo: String; Secao: String;
  Descricao: String): String;
var
  // variável que irá conter o arquivo
  ArquivoINI: TIniFile;
  Valor: String;
begin
  // associa o arquivo de configuração a variável
  ArquivoINI := TIniFile.Create(g_VarDiretorioExecutavel + ('Config\' + NomeArquivo + '.ini'));
  // variável param recebe 12345
  Valor := ArquivoINI.ReadString(Secao, Descricao, '');
  Result := Valor;
  ArquivoINI.Free;
end;

procedure CriaForm(ClasseForm: TFormClass);
var
  Form:TForm;
begin
  try
    Form := TForm(Retorna_Form(ClasseForm.ClassName));
    if Form <> Nil then
    begin
      Form.Show;
      Exit;
    end;
    Form           := ClasseForm.Create(Application);
    Form.FormStyle := fsMDIChild;
    Form.Show;
  except
    on E:Exception do
      Erro(Nm_Unit,'CriaForm'+ClasseForm.ClassName,E.Message,true,true,E);
  end;
end;

function Retorna_Form(pNomeForm: String): TForm;
var
  i: integer;
  VarComponente: TForm;
begin
  VarComponente := nil;
  Result := VarComponente;
  try
    for i := 0 to Application.ComponentCount - 1 do
      if Application.Components[i] is TForm then
      begin
        if UpperCase(Application.Components[i].ClassName) = UpperCase(pNomeForm) then
        begin
          VarComponente := TForm(Application.Components[i]);
          break;
        end;
      end;
    Result := VarComponente;
  except
    on E:Exception do
      Erro(Nm_Unit,'Retorna_Form'+pNomeForm,E.Message,true,true,E);
  end;
end;

Function Ping(HostName: String): boolean;
var
 ICMP : TIdIcmpClient;
begin
  ICMP := TIdIcmpClient.Create(nil);
  result := false;  
  try    
     try
      ICMP.Host := HostName;
      ICMP.ReceiveTimeout := 500;
      try
        ICMP.Ping;
      except
        result := false;
        Exit;
      end;
       if ICMP.ReplyStatus.BytesReceived > 0 then
         result := true
       else
         result := false;
     except
      result := false;
     end;
  finally
    ICMP.Destroy;
  end;
end;

function Campo_Invalido(pForm:TForm;pCodigoGrupoTela:integer): Boolean;
var
  i:integer;
  vCampoInvalido:string;
  StrListComponente:TStringList;

  vFocusCombobox:     TFocusCombobox;
  vFocusEdit:         TFocusEdit;
  vFocusButtonedEdit: TFocusButtonedEdit;
  vFocusCheckListBox: TFocusCheckListBox;
  vListaCompo:TList<TObject>;
begin
  vListaCompo := ListaComponentes(pForm,pCodigoGrupoTela,'',Null);
  StrListComponente := TStringList.Create;
  StrListComponente.Clear;
  result          := false;
  try
    try
      vCampoInvalido  := '';
      for i:=0 to vListaCompo.Count -1 do
      begin
        if GetPropValue(vListaCompo[i],'CodigoGrupoTela') = pCodigoGrupoTela then
        begin
          vFocusCombobox:=nil;
          vFocusEdit:=nil;
          vFocusButtonedEdit:=nil;
          vFocusCheckListBox:=nil;

          {IDENTIFICAÇÃO DE COMPONENTES}
          if (vListaCompo[i] is TFocusEdit) then
            vFocusEdit := TFocusEdit(vListaCompo[i])
          else
          if (vListaCompo[i] is TFocusButtonedEdit) then
            vFocusButtonedEdit := TFocusButtonedEdit(vListaCompo[i])
          else
          if (vListaCompo[i] is TFocusCombobox) then
            vFocusCombobox := TFocusCombobox(vListaCompo[i])
          else
          if (vListaCompo[i] is TFocusCheckListBox) then
            vFocusCheckListBox := TFocusCheckListBox(vListaCompo[i]);

          if vFocusEdit <> Nil then
          begin
            if (vFocusEdit.Obrigatorio) and (not vFocusEdit.Validar) then
            begin
              vCampoInvalido   := vCampoInvalido+vFocusEdit.Nome+#13;
              vFocusEdit.Color := vFocusEdit.ErrorColor;
              StrListComponente.Add(vFocusEdit.Name);
            end;
          end
          else
          if vFocusButtonedEdit <> nil then
          begin
            if (vFocusButtonedEdit.Obrigatorio) and (not vFocusButtonedEdit.Validar) then
            begin
              vCampoInvalido  := vCampoInvalido+vFocusButtonedEdit.Nome+#13;
              vFocusButtonedEdit.Color     := vFocusButtonedEdit.ErrorColor;
              StrListComponente.Add(vFocusButtonedEdit.Name);
            end;
          end
          else
          if vFocusCombobox <> Nil then
          begin
            if (vFocusCombobox.Obrigatorio) and (vFocusCombobox.ItemIndex = -1) then
            begin
              vCampoInvalido  := vCampoInvalido+(vFocusCombobox.Nome)+#13;
              vFocusCombobox.Color := vFocusCombobox.ErrorColor;
              StrListComponente.Add(vFocusCombobox.Name);
            end;
          end
          else
          if vFocusCheckListBox <> Nil then
          begin
            if (vFocusCheckListBox.Obrigatorio) and (not vFocusCheckListBox.Validar) then
            begin
              if not ContemStrList(StrListComponente,vFocusCheckListBox.Name) then
              begin
                vCampoInvalido  := vCampoInvalido+(vFocusCheckListBox.Nome)+#13;
                vFocusCheckListBox.Color := vFocusCheckListBox.ErrorColor;
                StrListComponente.Add(vFocusCheckListBox.Name);
              end;
            end;
          end;
        end;
      end;

      if (vCampoInvalido <> '') then
      begin
        MessageBox('Verifique os seguintes campos (obrigatórios):'+#13+#13+vCampoInvalido,mExclamation,bmOK);
        if pForm.FindComponent(StrListComponente[0]) is TFocusEdit then
        begin
          vFocusEdit := pForm.FindComponent(StrListComponente[0]) as TFocusEdit;
          if vFocusEdit.CanFocus then
            vFocusEdit.SetFocus;
        end
        else
        if pForm.FindComponent(StrListComponente[0]) is TFocusCombobox then
        begin
          vFocusCombobox := pForm.FindComponent(StrListComponente[0]) as TFocusCombobox;
          if vFocusCombobox.CanFocus then
            vFocusCombobox.SetFocus;
        end
        else
        if pForm.FindComponent(StrListComponente[0]) is TFocusButtonedEdit then
        begin
          vFocusButtonedEdit := pForm.FindComponent(StrListComponente[0]) as TFocusButtonedEdit;
          if vFocusButtonedEdit.CanFocus then
            vFocusButtonedEdit.SetFocus;
        end;
        if pForm.FindComponent(StrListComponente[0]) is TFocusCheckListBox then
        begin
          vFocusCheckListBox := pForm.FindComponent(StrListComponente[0]) as TFocusCheckListBox;
          if vFocusCheckListBox.CanFocus then
            vFocusCheckListBox.SetFocus;
        end;

        result := true;
      end;
    finally
      StrListComponente.Free;
      vListaCompo.Free;
    end;
  except
    on E:Exception do
    begin
      Erro(Nm_Unit,'CampoInvalido',E.Message,True,True,E);
      if Assigned(StrListComponente) then
        StrListComponente.Free;
    end;
  end;
end;

function GetCampoOrderBy(pDbGrid:TDBGrid; pListView:TListView):string;
var
  i,j:integer;
begin
  result := '';
  try
    for i:= 0 to pListView.Items.Count -1 do
      for j:= 0 to pDbGrid.Columns.Count -1 do
        begin
          if pListView.Items[i].Caption = pDbGrid.Columns[j].Title.Caption then
          begin
            result := result + pDbGrid.Columns[j].FieldName+' '+pListView.Items[i].SubItems[0]+',';
            break;
          end;
        end;

    if result <> '' then
      result := Copy(result,1,Length(result)-1);
  except
    on E:Exception do
      Erro(Nm_Unit,'GetCampoOrderBy',E.Message,False,False,E);
  end;
end;

procedure OnClickLvSetado(Sender:TOBject);
var
  pt: TPoint;
  item : TLIstItem;
  hittestinfo: TLVHitTestInfo;
  pOrdenacao_setada_lv:TListView;
begin
  try
    pOrdenacao_setada_lv := TListView(Sender);
    pt                   := pOrdenacao_setada_lv.ScreenToClient(mouse.cursorpos );
    item                 := pOrdenacao_setada_lv.GetItemAt( pt.x, pt.y );
    if not assigned(item) then
      begin
        FillChar( hittestinfo, sizeof( hittestinfo ), 0 );
        hittestinfo.pt := pt;
        if pOrdenacao_setada_lv.perform( LVM_SUBITEMHITTEST, 0, lparam(@hittestinfo)) <> -1   Then
          begin
            if pOrdenacao_setada_lv.items[hittestinfo.iItem].Subitems[hittestinfo.iSubItem-1] = 'DESC' then
              pOrdenacao_setada_lv.items[hittestinfo.iItem].Subitems[hittestinfo.iSubItem-1] := 'ASC'
            else
              pOrdenacao_setada_lv.items[hittestinfo.iItem].Subitems[hittestinfo.iSubItem-1] := 'DESC';
          end;
      end;
  except
    on E:Exception do
      Erro(Nm_Unit,'DefAscDesc',E.Message,False,False,E);
  end;
end;

procedure OnDblClickLvSetado(Sender:TOBject);
var
  ListItem: TListItem;
  lv_ordenacao_setada : TListView;
begin
  try
    lv_ordenacao_setada := TListView(Sender);
    if (lv_ordenacao_setada.SelCount > 0) then
    begin
      lv_ordenacao_setada.selected.delete;
      lv_ordenacao_setada.Visible := lv_ordenacao_setada.Items.Count > 0;
    end;
  except

  end;
end;

procedure OnGridTitleClick(Column: TColumn;lv_ordenacao_setada:TListView);
Var
  ListItem: TListItem;
  i:integer;
  vTitleCaption : string;
  vFieldName: string;
begin
  vTitleCaption := Column.Title.Caption;
  vFieldName    := Column.FieldName;
  for i := 0 to lv_ordenacao_setada.Items.Count -1 do
    if lv_ordenacao_setada.Items[i].Caption = vTitleCaption then
      Exit;

  with lv_ordenacao_setada do
  begin
    ListItem := Items.Add;
    ListItem.Caption := vTitleCaption;

    if LowerCase(copy(vFieldName,1,2)) = 'dt' then
      ListItem.SubItems.Add('DESC')
    else
      ListItem.SubItems.Add('ASC');

    lv_ordenacao_setada.Visible := true;
  end;
end;

function MoveListViewItem(listView: TListView; ItemFrom, ItemTo: Word): Boolean;
var
  Origem, Destino: TListItem;
begin
  Result := False;
  listview.Items.BeginUpdate;
  try
    Origem := listview.Items[ItemFrom];
    Destino := listview.Items.Insert(ItemTo);
    Destino.Assign(Origem);
    Origem.Free;
    Result := True;
  finally
    listview.Items.EndUpdate;
  end;
end;

function DateTimeToStrNull(const DateTime: TDateTime): string;
var
  vStr:String;
begin
  vStr := DateTimeToStr(DateTime, FormatSettings);
  if vStr = '30/12/1899' then
    vStr := '';
  result := vStr;
end;

function  DateTimeToStrNull(pString:string):string;overload;
begin
  result := pString;
  if pString = '30/12/1899' then
    result := 'null';
end;

function DateTimeToStrH(const DateTime: TDateTime): string;
begin
  Result := DateTimeToStr(DateTime, FormatSettings);
  if pos(':',Result) = 0 then
    result := Result + ' 00:00:00';
end;

procedure Erro(pTela,pMetodo,pMsgErro:String;pExibirErro:boolean;pGravarErro:boolean;E:Exception);
  function DeterminaExcecao(E:Exception;var pTipoIconError:TTipoMensagem):TExceptionRec;
  begin

    pMsgErro := AnsiToUtf8(pMsgErro);
    Result.EClasse  := E.ClassName;
    Result.EMessage := AnsiToUtf8(E.Message);
    Result.EUnitName:= E.UnitName;
    if E is EOleException then
    begin
      Result.ECode := EOleException(E).ErrorCode;
    end;
    if E is EAccessViolation then
    begin
      pTipoIconError := mError;
    end;
  end;
const
  vTam=12;
var
  vStrListErro:TStringList;
  vTipoIconError:TTipoMensagem;
  vMesAno,
  vArquivo:string;
  vUserErrorMsg:string;
  bExcecaoGerada:Boolean;
begin
  vTipoIconError  := mExclamation;
  bExcecaoGerada := (E <> Nil) and (Assigned(E));

  vStrListErro := TStringList.Create;
  vStrListErro.Clear;

  if not DirectoryExists(g_VarDiretorioExecutavel+'Logs') then
    CreateDir(g_VarDiretorioExecutavel+'Logs');

  vMesAno := FormatDateTime('YYYY',now)+'_'+FormatDateTime('MM',now);
  vArquivo := g_VarDiretorioExecutavel+'Logs\LogErros'+vMesAno+'.txt';

  if FileExists(vArquivo) then
    vStrListErro.LoadFromFile(vArquivo);

  vStrListErro.Add(RPad('Data/Hora:',vTam,' ')+'['+DateTimeToStr(now)+']');
  vStrListErro.Add(RPad('Classe:'   ,vTam,' ')+'['+UpperCase(ptela)+']');
  vStrListErro.Add(RPad('Método:'   ,vTam,' ')+'['+pMetodo+']');

  if (bExcecaoGerada) then
  begin
    with DeterminaExcecao(E,vTipoIconError) do
    begin
      vStrListErro.Add(RPad('E.ErrorCode:',vTam,' ')+'['+IntToStr(ECode)+']');
      vStrListErro.Add(RPad('E.UnitName:' ,vTam,' ')+'['+EUnitName+']');
      vStrListErro.Add(RPad('E.ClassName:',vTam,' ')+'['+EClasse+']');
      vStrListErro.Add(RPad('E.Message:'  ,vTam,' ')+'['+EMessage+']');

      if EMensagemTratada <> '' then
      begin
        vStrListErro.Add(Rpad('Msg Tratada:',vTam,' ')+'['+EMensagemTratada+']');
        vUserErrorMsg := EMensagemTratada;
      end;
    end
  end
  else
  begin
    vStrListErro.Add(RPad('Erro:',vTam,' ')+'['+pMsgErro+']');
  end;

  if (pGravarErro) or (bExcecaoGerada) then
  begin
    vStrListErro.Add('___________________________________________________');
    vStrListErro.SaveToFile(vArquivo);
  end;

  if (pExibirErro) then
  begin
    if (vUserErrorMsg = '') then
    begin
      vUserErrorMsg := pMsgErro;
    end;

    MessageBox('Tela:  '  +#9+pTela+   #13+#10+
               'Método:'  +#9+pMetodo+ #13+#10+
               'Erro:  '  +#9+vUserErrorMsg+#13+#10,
               vTipoIconError,bmOK);
  end;

  vStrListErro.Free;
end;

function RPad(value:string; tamanho:integer; caractere:char): string;
var
  i : integer;
begin
  Result := value;
  if(Length(value) > tamanho)then
    exit;
  for i := 1 to (tamanho - Length(value)) do
    Result := Result + caractere;
end;

function NvlStr(pTexto1,pTexto2:string):string;
begin
  result := pTexto1;
  if pTexto1 = '' then
    result := pTexto2;
end;

function NvlValidarInteger(pN1Correto:string;pNRetorno:integer):string;
begin
  result := IntToStr(StrToIntDef(pN1Correto,pNRetorno));
end;

function IntToNull(pNumero:string):string;
begin
  result := pNumero;
  if Trim(pNumero) = '0' then
    result := 'null';
end;

function  IntToVazio(pValue:integer):string;
begin
  if (pValue = 0) then
    result := ''
  else
    result := IntToStr(pValue);
end;

function Bool_To_S_N(Value:boolean):char;
begin
  if Value then
    result := 'S'
  else
    result := 'N';
end;

function BoolToStr(Value:boolean):string;
begin
  if Value then
    result := 'true'
  else
    result := 'false';
end;

function  ListaComponentes( pForm:TForm;
                            pCodigoGrupoTela:integer;
                            pAttr:string;
                            pAttrValue:Variant):TList<TObject>;
var
  i:integer;
  fe_edit:TFocusEdit;
  fb_edit:TFocusButtonedEdit;
  fc_box: TFocusCombobox;
  cl_box: TFocusCheckListBox;
  vValue:Variant;
begin
  try
    result := TList<TObject>.Create;

    for i:=0 to pform.ComponentCount -1 do
    begin
      vValue := Null;

      if (pAttr <> '') then
      case AnsiIndexStr(lowercase(pForm.Components[i].classname),
                                            ['tfocusedit',
                                             'tfocusbuttonededit',
                                             'tfocuscombobox',
                                             'tfocuschecklistbox']) of
        0,1,2,3:
          begin
            if pCodigoGrupoTela = GetPropValue(pForm.Components[i],'codigogrupotela') then
              vValue := GetPropValue(pForm.Components[i],pAttr);
          end;
      end;

      if (vValue = pAttrValue) or (pAttr = '') then
      begin
        if pForm.Components[i] is TFocusEdit then
        begin
          fe_edit := pForm.Components[i] as TFocusEdit;
          if fe_edit.CodigoGrupoTela = pCodigoGrupoTela then
            result.Add(fe_edit);
        end
        else
        if pForm.Components[i] is TFocusButtonedEdit then
        begin
          fb_edit := pForm.Components[i] as TFocusButtonedEdit;
          if fb_edit.CodigoGrupoTela = pCodigoGrupoTela then
            result.Add(fb_edit);
        end
        else
        if pForm.Components[i] is TFocusCombobox then
        begin
          fc_box := pForm.Components[i] as TFocusCombobox;
          if fc_box.CodigoGrupoTela = pCodigoGrupoTela then
            result.Add(fc_box);
        end
        else
        if pForm.Components[i] is TFocusCheckListBox then
        begin
          cl_box := pForm.Components[i] as TFocusCheckListBox;
          if cl_box.CodigoGrupoTela = pCodigoGrupoTela then
            result.Add(cl_box);
        end;
      end;
    end;
  except
    on E:Exception do
      Erro(Nm_Unit,'ListaComponentes',e.Message,True,True,E);
  end;
end;

procedure SetPropertyAttributes(pComponentes:TList<TObject>;pAtributo:string;pValor:Variant);
var
  i:integer;
begin
  try
    for i := 0 to pComponentes.Count - 1 do
      SetPropertyObject(pComponentes[i],pAtributo,pValor);
  except
    on E:Exception do
      Erro(Nm_Unit,'SetPropertyFormAttributes',e.Message,True,True,E);
  end;
end;

procedure SetPropertyObject(pComponente:TObject;pAtributo:string;pValor:variant);
begin
  try
    SetPropValue(pComponente,pAtributo,VarToStr(pValor));
  except
    on E:Exception do
      Erro(Nm_Unit,'SetPropertyObject',e.Message,True,True,E);
  end;
end;

procedure LimparCampos(pForm:TForm;pCodigoGrupoTela:integer);
var
  i:integer;
  vListaComp:TList<TObject>;
begin
  try
    try
      vListaComp := ListaComponentes(pForm,pCodigoGrupoTela,'',Null);
      for i:=0 to vListaComp.Count -1 do
        ExecMethod(vListaComp[i],'limpar');
    finally
      vListaComp.Free;
    end;
  except
    on E:Exception do
      Erro(Nm_Unit,'LimparCampos',e.Message,True,True,E);
  end;
end;

function  NomeDoMes(pDate:TDate):string;
begin
  case StrToInt(formatDateTime('MM',pDate)) of
    1: result := 'Janeiro';
    2: result := 'Fevereiro';
    3: result := 'Março';
    4: result := 'Abril';
    5: result := 'Maio';
    6: result := 'Junho';
    7: result := 'Julho';
    8: result := 'Agosto';
    9: result := 'Setembro';
    10:result := 'Outubro';
    11:result := 'Novembro';
    12:result := 'Dezembro';
  end;
end;

function NomeDoDia(pDate : TDateTime):string;
begin
  case Dia_Semana(pDate) of
    0:result := 'Domingo';
    1:result := 'Segunda-Feira';
    2:result := 'Terça-Feira';
    3:result := 'Quarta-Feira';
    4:result := 'Quinta-Feira';
    5:result := 'Sexta-Feira';
    6:result := 'Sábado';
  end;
end;

function  Dia_Semana(pDate:TDateTime):integer;
begin
  result := DayOfWeek(pDate)-1;
end;

function GridIsNull(pdbGrid:TdbGrid):boolean;
begin
  result := True;
  if  (pdbGrid.DataSource <> nil) and
      (Assigned(pdbGrid.DataSource.DataSet))
  then
  begin
    try
      result :=     (pdbGrid.DataSource.DataSet.IsEmpty)        or
                    (pdbGrid.DataSource.DataSet.FieldCount < 1) or
                    (pdbGrid.DataSource.DataSet.State in [dsInactive]);
    except
      result := True;
    end;
  end
end;

procedure SetarParametroRegiao;
begin
  Application.HintHidePause := 100000;
  FormatSettings.DateSeparator   := '/';
  FormatSettings.LongDateFormat  := 'dd/mm/yyyy hh:nn:ss';
  FormatSettings.ShortDateFormat := 'dd/mm/yyyy';
  FormatSettings.CurrencyString  := 'R$';
  FormatSettings.CurrencyDecimals:= 2;
end;

procedure FileSearch(const PathName, FileName : string; const InDir : boolean;var pStrList:TStringList);
var Rec  : TSearchRec;
    Path : string;
begin
  pStrList := TStringList.Create;
  try
    Path := IncludeTrailingPathDelimiter(PathName);
    if FindFirst(Path + FileName, faAnyFile - faDirectory, Rec) = 0 then
    try
      repeat
        pStrList.Add(Path + Rec.Name);
      until FindNext(Rec) <> 0;
    finally
      FindClose(Rec.FindHandle);
    end;

//    If not InDir then
//      Exit;
//
//    if FindFirst(Path + '*.*', faDirectory, Rec) = 0 then
//     try
//       repeat
//        if ((Rec.Attr and faDirectory) <> 0)  and (Rec.Name<>'.') and (Rec.Name<>'..') then
//         begin
//           FileSearch(Path + Rec.Name, FileName, True,pStrList);
//         end;
//       until FindNext(Rec) <> 0;
//     finally
//       FindClose(Rec.FindHandle);
//     end;
  except
    on E:Exception do
    Erro(Nm_Unit,'FileSearch',E.Message,true,true,E);
  end;
end;

function GetWindowsDrive: Char;
var
  S: string;
begin
  SetLength(S, MAX_PATH);
  if GetWindowsDirectory(PChar(S), MAX_PATH) > 0 then
    Result := string(S)[1]
  else
    Result := #0;
end;

procedure ExecutarComandoParametrizado(diretorio_executavel_p,comando_p :string);
begin
  try
    ShellExecute(Application.Handle,'open',pChar(diretorio_executavel_p),pChar(comando_p),nil,SW_SHOWNORMAL);
  except
    on E:Exception do
      Erro(Nm_Unit,'ExecutarComandoParametrizado',E.Message,True,true,E);
  end;
end;

function GetTempDir: string;
begin
  Result := GetEnvironmentVariable('TEMP');
end;

procedure InstalarFonte;
var
  vStrList:TStringList;
  i:integer;
begin
  try
//    if Screen.Fonts.IndexOf('ds-digital') = -1 then //entao fonte nao instalada
    begin
      try
        FileSearch(g_VarDiretorioExecutavel+'dll','*.ttf',false,vStrList);
        for i:=0 to vStrList.Count -1 do
        begin
          try
            CopyFile(PChar(vStrList[i]),PChar(GetWindowsDrive+':\windows\fonts\'+ExtractFileName(vStrList[i])),false);
            AddFontResource(PChar(vStrList[i]));
            SendMessage(HWND_BROADCAST,WM_FONTCHANGE,0,0);
          except
          end;
        end;
      finally
        vStrList.Free;
      end;
    end;
  except
    on E:Exception do
      Erro(Nm_Unit,'AddFontResource','Erro ao checar existencia e/ou instalar fonte',false,True,E);
  end;
end;

function Encrypt(pStr:String):string;
const
  vTexto = 'abcdefghijlmnopqrstuvxzABCDEFGHIJLMNOPQRSTUVXZkywKYW0123456789';
  vCript = '!@#$%&*()_"=.+-*/[]^~:<>º?®¿ªÑñúóíƒ×Ø£øÜÖÿùûòöôÆæÉÅÄ´ìîïèëêçåä';
var
  i:integer;
  vResult:string;
  vProcurar:string;
  vRetorno:string;
begin
  for i:=1 to Length(pStr) do
  begin
    vProcurar := Copy(pStr,i,1);
    vRetorno  := Copy(vCript,pos(vProcurar,vTexto),1);
    vResult   := vResult + vRetorno;
  end;
  result := vResult;
end;

function Decrypt(pStr:String):string;
const
  vTexto = 'abcdefghijlmnopqrstuvxzABCDEFGHIJLMNOPQRSTUVXZkywKYW0123456789';
  vCript = '!@#$%&*()_"=.+-*/[]^~:<>º?®¿ªÑñúóíƒ×Ø£øÜÖÿùûòöôÆæÉÅÄ´ìîïèëêçåä';
var
  i:integer;
  vResult:string;
  vProcurar:string;
  vRetorno:string;
begin
  for i:=1 to Length(pStr) do
  begin
    vProcurar := Copy(pStr,i,1);
    vRetorno  := Copy(vTexto,pos(vProcurar,vCript),1);
    vResult   := vResult + vRetorno;
  end;
  result := vResult;
end;

function ValidCrypt(pStr:string):boolean;
const
  vTexto = 'abcdefghijlmnopqrstuvxzABCDEFGHIJLMNOPQRSTUVXZkywKYW0123456789';
var
  i:integer;
begin
  result := true;
  for i:=1 to Length(pStr) do
    if pos(Copy(pStr,i,1),vTexto) = 0 then
    begin
      result := false;
      break;
    end;
end;

function  Retorna_Index_StrList(pProcura:string;pStrList:TStrings):integer;
var
  i:integer;
begin
  result := 0;
  for i := 0 to pStrList.Count -1 do
  if AnsiContainsText(LowerCase(pStrList[i]),LowerCase(pProcura)) then
  begin
    result := i;
    exit;
  end;
end;

function PasswordInputBox(var PassResult:string):boolean; {Se cancelou, false, se erro, true}
var
  Form: TForm;
  Prompt1,
  Prompt2: TLabel;
  Edit1,
  Edit2: TFocusButtonedEdit;
  DialogUnits: TPoint;
  ButtonTop, ButtonWidth, ButtonHeight: Integer;
  Value1,
  Value2: string;
  I: Integer;
  Buffer: array[0..51] of Char;
begin
  PassResult := '';
  Result := false;
  Form := TForm.Create(Application);
  with Form do
  try
    Canvas.Font := Font;
    for I := 0 to 25 do Buffer[I] := Chr(I + Ord('A'));
    for I := 0 to 25 do Buffer[I + 26] := Chr(I + Ord('a'));
    GetTextExtentPoint(Canvas.Handle, Buffer, 52, TSize(DialogUnits));
    DialogUnits.X := DialogUnits.X div 52;
    BorderStyle   := bsDialog;
    Caption       := 'Alteração de senha de conexão';;
    ClientWidth   := MulDiv(180, DialogUnits.X, 4);
    ClientHeight  := MulDiv(90, DialogUnits.Y, 8);
    Position      := poScreenCenter;

    Prompt1       := TLabel.Create(Form);
    with Prompt1 do
    begin
      Parent    := Form;
      AutoSize  := True;
      Left      := MulDiv(8, DialogUnits.X, 4);
      Top       := MulDiv(8, DialogUnits.Y, 8);
      Caption   := 'Informe a nova senha';
    end;
    Prompt2       := TLabel.Create(Form);
    with Prompt2 do
    begin
      Parent    := Form;
      AutoSize  := True;
      Left      := MulDiv(8, DialogUnits.X, 4);
      Top       := MulDiv(35, DialogUnits.Y, 8);
      Caption   := 'Repita a senha';
    end;

    Edit1 := TFocusButtonedEdit.Create(Form);
    with Edit1 do
    begin
      Parent       := Form;
      Clear;
      Left         := Prompt1.Left;
      Top          := MulDiv(19, DialogUnits.Y, 8);
      Width        := MulDiv(164, DialogUnits.X, 4);
      Height       := 25;
      MaxLength    := 255;
      PasswordChar := '*';
      SelectAll;
    end;

    Edit2 := TFocusButtonedEdit.Create(Form);
    with Edit2 do
    begin
      Parent       := Form;
      Clear;
      Left         := Prompt1.Left;
      Top          := MulDiv(45, DialogUnits.Y, 8);
      Width        := MulDiv(164, DialogUnits.X, 4);
      Height       := 25;
      MaxLength    := 255;
      PasswordChar := '*';
      SelectAll;
    end;

    ButtonTop     := MulDiv(74, DialogUnits.Y, 8);
    ButtonWidth   := MulDiv(50, DialogUnits.X, 4);
    ButtonHeight  := MulDiv(14, DialogUnits.Y, 8);

    with TBitBtn.Create(Form) do
    begin
      Parent      := Form;
      Caption     := 'Confirmar';
      Images      := uDataModule.Banco_dm.img_List;
      ImageIndex  := 4;
      ModalResult := mrOk;
      Default     := True;
      SetBounds(MulDiv(38, DialogUnits.X, 4),ButtonTop, ButtonWidth,ButtonHeight);
    end;

    with TBitBtn.Create(Form) do
    begin
      Parent      := Form;
      Caption     := 'Cancelar';
      Images      := uDataModule.Banco_dm.img_List;
      ImageIndex  := 5;
      ModalResult := mrCancel;
      Cancel      := True;
      SetBounds(MulDiv(92, DialogUnits.X, 4),ButtonTop, ButtonWidth,ButtonHeight);
    end;

    if ShowModal = mrOk then
    begin
      Value1 := Edit1.Text;
      Value2 := Edit2.Text;

      if ((Value1 = '') or (Value2 = '') or (Value1 <> Value2)) then
      begin
        Erro(Nm_Unit,'PasswordInputBox','Senhas não conferem ou estão vazias',True,false,Nil);
        result := false;
      end
      else
      if Value1 = Value2 then
      begin
        Result     := true;
        PassResult := Value1;
      end;
    end
    else
      Result := false;
  finally
    Form.Free;
  end;
end;

function  ContemStrList(pStrList:TStringList;pTexto:string):Boolean;
var
  i:integer;
begin
  result := false;
  for i:=0 to pStrList.Count-1 do
  begin
    if pStrList[i] = pTexto then
    begin
      result := True;
      Exit;
    end;
  end;
end;

function ObterDataHoraInternet:boolean;
const
  cServers: array[0..6] of string = (
      'time.windows.com',
      'time.nist.gov',
      'time-nw.nist.gov',
      'nist1-nj.ustiming.org',
      'nist1-ny.ustiming.org',
      'pool.ntp.org',
      'nist1-la.ustiming.org');
var
  SNTPClient: TIdSNTP;
  i:integer;
begin
  try
    result := False;
    if ConectadoInternet then
    begin
      SNTPClient := TIdSNTP.Create(Application);
      try
        i:= SizeOf(cServers);
        for i:=0 to 6 do
        begin
          try
            Sleep(200);
            SNTPClient.Host := cServers[i];
            if SNTPClient.SyncTime then
            begin
              result := True;
              Break;
            end;
            SNTPClient.SyncTime;
          except
          end;
        end;
      finally
        SNTPClient.Free;
      end;
    end;
  except
  end;
end;

function LocalIP: string;
type
  TaPInAddr = array[0..10] of PInAddr;
  PaPInAddr = ^TaPInAddr;
var
  phe: PHostEnt;
  pptr: PaPInAddr;
  Buffer: array[0..63] of AnsiChar;
  I: Integer;
  GInitData: TWSAData;
begin
  try
    WSAStartup($101, GInitData);
    Result := '';
    GetHostName(Buffer, SizeOf(Buffer));
    phe := GetHostByName(buffer);
    if phe = nil then Exit;
    pPtr := PaPInAddr(phe^.h_addr_list);
    I := 0;
    while pPtr^[I] <> nil do
    begin
      Result := inet_ntoa(pptr^[I]^);
      Inc(I);
    end;
    WSACleanup;
  except
    Result := 'Erro';
  end;
end;

procedure LimparDiretorio(pDiretorio,pExtensao:string);
var
  i:integer;
  vStrList:TStringList;
begin
  pDiretorio := IncludeTrailingPathDelimiter(pDiretorio);
  FileSearch(pDiretorio,'*'+pExtensao,true,vStrList);
  for i:=0 to vStrList.Count -1 do
    DeleteFile(pChar(vStrList[i]));
end;

//function GetExternalIP:string;
//var
//  vHttp:TIdHTTP;
//begin
//  try
//    vHttp := TIdHTTP.Create(Application);
//    result := vHttp.Get('http://automation.whatismyip.com/n09230945.asp');
//    vHttp.Free;
//  except
//    Result := 'Sem Internet';
//    if Assigned(vHttp) then
//      vHttp.Free;
//  end;
//end;

{retorna o nome pelo ip}
function IAddrToHostName(const IP: string): string;
var
  i: Integer;
  p: PHostEnt;
begin
  try
    Result := '';
    i      := inet_addr(PAnsichar(IP));
    if i <> u_long(INADDR_NONE) then
    begin
      p := GetHostByAddr(@i, SizeOf(Integer), PF_INET);
      if p <> nil then Result := p^.h_name;
    end
    else
      Result := 'Invalid IP address';
  except
    on E:Exception do
      Erro(Nm_Unit,'IAddrToHostName',E.Message,True,True,E);
  end;
end;

function GetODBCDriversList: TStrings;
// This function returns a list of currently installed ODBC drivers
// Example: combobox1.Assign(GetODBCDriversList); // ;)
var
  strListPadrao: TStringlist;
  strListRestrito: TStringList;
  aRegistry   : TRegistry;
  i:integer;
Begin
  strListPadrao:= Tstringlist.Create;
  strListRestrito := TStringList.Create;
  aRegistry:= TRegistry.Create;
  Result:= Tstringlist.Create;

  with aRegistry do
  Begin
    rootkey:= HKEY_LOCAL_MACHINE;
    OpenKey('Software\ODBC\ODBCINST.INI\ODBC Drivers',False);
    GetValueNames(strListPadrao);
  End;
  aRegistry.Free;
  strListPadrao.Sort;
  for i:=0 to strListPadrao.Count -1 do
    if AnsiContainsStr(AnsiLowerCase(strListPadrao[i]),'postgres') then
    begin
      strListRestrito.Add(strListPadrao[i]);
    end;
  result.AddStrings(strListRestrito);
  strListRestrito.Free;
  strListPadrao.Free;
End;

function ExecAndWait(const Filename, Params: string; WindowState: word): boolean;
{$IFDEF WIN32}
var
  SUInfo: TStartupInfoW;
  ProcInfo: TProcessInformation;
  CmdLine: string;
begin
  { Enclose filename in quotes to take care of long filenames with spaces. }
  CmdLine := '"' + Filename + '" ' + Params;

  FillChar(SUInfo, SizeOf(SUInfo), #0);

  SUInfo.lpTitle := PWideChar(CmdLine);
  SUInfo.cb := SizeOf(SUInfo);
  SUInfo.dwFlags := STARTF_USESHOWWINDOW;
  SUInfo.wShowWindow := WindowState;


  Result := CreateProcessW(NIL, PWideChar(CmdLine), NIL, NIL, FALSE,
     CREATE_NEW_CONSOLE or NORMAL_PRIORITY_CLASS, NIL,
     PWideChar(ExtractFilePath(Filename)), SUInfo, ProcInfo);
  { Wait for it to finish. }
  if Result then
  begin
     WaitForSingleObject(ProcInfo.hProcess, INFINITE);
     { Clean up the handles. }
     CloseHandle(ProcInfo.hProcess);
     CloseHandle(ProcInfo.hThread);
  end;

{$ELSE}

var
  InstanceID : THandle;
  Buff: array[0..255] of char;
begin
  StrPCopy(Buff, Filename + ' ' + Params);
  InstanceID := WinExec(Buff, WindowState);

  if InstanceID < 32 then { a value less than 32 indicates an Exec error }
    Result := FALSE
  else
  begin
    Result := TRUE;
    repeat
      Application.ProcessMessages;
    until Application.Terminated or (GetModuleUsage(InstanceID) = 0);
  end;
{$ENDIF}
end;

function ExisteImpressora:boolean;
begin
  try
    result := Printer.Printers.Count > 0;
    if not result then
      Erro(Nm_Unit,'bt_VisualizarClick','Não existe impressora instalada',true,false,Nil);
  except
    Result := false;
  end;
end;

procedure Gravar_Valor_Registro(RootKey: HKEY; Key, Value: string; RegDataType: TRegDataType; Data: variant; Oper:String);
var
  Reg: TRegistry;
  s: string;
begin
  Reg := TRegistry.Create(KEY_WRITE);
  try
    Reg.RootKey := RootKey;
    if Reg.OpenKey(Key, True) then
    begin
    if Oper = 'ADD' then
      begin
        try
          if RegDataType = rdUnknown then
            RegDataType := Reg.GetDataType(Value);
          if RegDataType = rdString then
            Reg.WriteString(Value, Data)
          else
          if RegDataType = rdExpandString then
            Reg.WriteExpandString(Value, Data)
          else
          if RegDataType = rdInteger then
            Reg.WriteInteger(Value, Data)
          else
          if RegDataType = rdBinary then
            begin
              s := Data;
              Reg.WriteBinaryData(Value, PChar(s)^, Length(s));
            end
          else
            raise Exception.Create(SysErrorMessage(ERROR_CANTWRITE));
        except
          Reg.CloseKey;
          raise;
        end;
        Reg.CloseKey;
      end
    else
      if oper = 'DEL' then
        if RegDataType = rdString then
          Reg.DeleteValue(Value);
    end
    else
      raise Exception.Create(SysErrorMessage(GetLastError));
  finally
    Reg.Free;
  end;
end;

function Obter_Valor_Registro(RootKey: HKEY; Key, Value: string): variant;
var
  Reg: TRegistry;
  RegDataType: TRegDataType;
  DataSize, Len: integer;
  s: string;
label cantread;
begin
  Reg := nil;
  try
    Reg := TRegistry.Create(KEY_QUERY_VALUE);
    Reg.RootKey := RootKey;
    if Reg.OpenKeyReadOnly(Key) then
    begin
      try
        RegDataType := Reg.GetDataType(Value);
        if (RegDataType = rdString) or (RegDataType = rdExpandString) then
          Result := Reg.ReadString(Value)
        else
        if RegDataType = rdInteger then
          Result := Reg.ReadInteger(Value)
        else
        if RegDataType = rdBinary then
        begin
          DataSize := Reg.GetDataSize(Value);
          if DataSize = -1 then goto cantread;
          SetLength(s, DataSize);
          Len := Reg.ReadBinaryData(Value, PChar(s)^, DataSize);
          if Len <> DataSize then goto cantread;
          Result := s;
        end
        else
          cantread:
      except
        s := ''; // Deallocates memory if allocated
        Reg.CloseKey;
        raise;
      end;
      Reg.CloseKey;
    end;
  except
    Reg.Free;
    raise;
  end;
  Reg.Free;
end;

function  DateTimeToStrTime(pDateTime:String):string;
begin
  if Pos(':',pDateTime) > 0 then
  begin
    //pDateTime  := Copy(pDateTime,11,length(pDateTime));
    //result := Copy(pDateTime,1,6);
    result := FormatDateTime('hh:mm:ss',StrToDateTime(pDateTime));
  end
  else
    result := '00:00';
end;

function  MessageBox(pTexto:string;
                     pTipoMsg:TTipoMensagem;
                     pTipoBotaoMensagem:TTipoBotaoMensagem;
                     pTipoDefaultButton:TTipoDefaultButton = db1):integer;
var
  Flags:longint;
  vTitulo:string;
begin
  Flags := 0;
  case pTipoMsg of
    mError:
      begin
        Flags := Flags + MB_ICONERROR;
        vTitulo := 'Erro';
      end;
    mConfirmation:
      begin
        Flags := Flags + MB_ICONQUESTION;
        vTitulo := 'Confirmação';
      end;
    mExclamation:
      begin
        Flags := Flags + MB_ICONEXCLAMATION;
        vTitulo := 'Atenção';
      end;
    mInformation:
      begin
        Flags := Flags + MB_ICONINFORMATION;
        vTitulo := 'Informação';
      end;
  end;
  case pTipoDefaultButton of
    db1:        Flags := Flags + MB_DEFBUTTON1;
    db2:        Flags := Flags + MB_DEFBUTTON2;
  end;

  case pTipoBotaoMensagem of
    bmOK:       Flags := Flags + MB_OK;
    bmOK_CANCEL:Flags := Flags + MB_OKCANCEL;
    bmYES_NO:   Flags := Flags + MB_YESNO;
    bmIGNORE:   Flags := Flags + MB_RETRYCANCEL;
  end;
  result := Application.MessageBox(pChar(pTexto),pChar(vTitulo),Flags);
end;


procedure ExecMethod(pObject: TObject; MethodName: string) ;
var
   Routine: TMethod;
   Exec: TExec;
begin
   Routine.Data := Pointer(pObject) ;
   Routine.Code := pObject.MethodAddress(MethodName);
   if NOT Assigned(Routine.Code) then
     Exit;
   Exec := TExec(Routine) ;
   Exec;
end;

procedure RestartApplication;
var
  FullProgPath: PChar;
  AppName:String;
  Handle:THandle;
begin
  AppName := PChar(Application.ExeName) ;
  ShellExecute(Handle,'open',pChar(AppName), nil, nil, SW_SHOWNORMAL) ;
  Encerrar;
end;

function IndexContainsArray(pText:string;pArrayText:array of string):integer;
var
  i:integer;
begin
  for i := low(pArrayText) to High(pArrayText) do
  begin
    if pos(AnsiLowerCase(pArrayText[i]),AnsiLowerCase(pText)) > 0 then
    begin
      result := i;
      exit;
    end;
  end;
end;

procedure Encerrar;
var
  hProc:THandle;
begin
  Application.ProcessMessages;
  hProc := OpenProcess(PROCESS_TERMINATE, False, GetCurrentProcessId);
  TerminateProcess(hProc, 0);
end;

procedure ExecutarManutencaoBanco;
begin
  if Banco_dm.BancoAttributes.SuperUser then
  begin
      ExecutarSQL('select reset_sequence('+QuotedStr('')+')',false);
    //ExecutarSQL('reindex database "'+Banco_dm.BancoAttributes.Database+'"');
  end;
  ExecutarSQL('vacuum'); {Executa manutenção}
  ExecutarSQL('vacuum analyze');
end;

procedure Unzip(CaminhoArquivo:String);
var
  v_Archiver : TZipForge;
begin
  // Create an instance of the TZipForge class
  v_Archiver := TZipForge.Create(nil);
  try
    with v_Archiver do
    begin
      // The name of the ZIP file to unzip
      FileName := CaminhoArquivo;
      // Open an existing archive
      OpenArchive(fmOpenRead);
      // Set base (default) directory for all archive operations
      BaseDir := 'C:\Temp';
      // Extract all files from the archive to C:\Temp folder
      ExtractFiles('*.*');
      CloseArchive();
    end;
  except
    on E: Exception do
    begin
      Writeln('Exception: ', E.Message);
      // Wait for the key to be pressed
      Readln;
    end;
  end;
  v_Archiver := nil;
  v_Archiver.Free;
end;

procedure Zip(pZipFileName,pAddFileName:string;pMostrarErro:boolean);
var
  archiver : TZipForge;
  i:integer;
begin
  i:=0;
  try
    archiver := TZipForge.Create(nil);
    with archiver do
    begin
      if FileExists(pAddFileName) then
      begin
        FileName := pZipFileName;{Set the name of the archive file we want to create ex: 'C:\test.zip'}
        OpenArchive(fmCreate);{Because we create a new archive we set Mode to fmCreate}
        AddFiles(pAddFileName); {Add file C:\test.txt the archive; wildcards can be used as well}
        CloseArchive();
        while ((not FileExists(pZipFileName)) and (i < 10)) do
        begin
          sleep(500);
          Application.ProcessMessages;
        end;
        if not FileExists(pZipFileName) then
          Erro(Nm_Unit,'Zip','Arquivo "'+pZipFileName+'" não pôde ser criado',pMostrarErro,True,Nil);
      end
      else
        Erro(Nm_Unit,'Zip','Arquivo de origem "'+pAddFileName+'" não existe',pMostrarErro,True,Nil);
    end;
  except
    on E: Exception do
    begin
      Erro(Nm_Unit,'Zip',E.Message,pMostrarErro,True,E);
    end;
  end;
end;

function ValidaEmail(email: String): boolean;
const
  InvalidChar = 'àâêôûãõáéíóúçüñýÀÂÊÔÛÃÕÁÉÍÓÚÇÜÑÝ*;:⁄\|#$%&*§!()][{}<>˜ˆ´ªº+¹²³';
var
  I: Integer;
  C: Integer;
begin
  // Não existe email com menos de 8 caracteres.
  if Length(Email) < 8 then
  begin
    Result := False;
    Exit;
  end;

  // Verificando se há somente um @
  if ((Pos( '@', Email) = 0) or
  (PosEx( '@', Email, Pos('@', Email) + 1) > 0))
  then
  begin
    Result := False;
    Exit;
  end;

  // Verificando se no m�nimo há um ponto
  if (Pos('.', Email) = 0) then
  begin
    Result := False;
    Exit;
  end;

  // Não pode começar ou terminar com @ ou ponto
  if (Email[1] in ['@', '.']) or
     (Email[Length(Email)] in ['@', '.'])
  then
  begin
    Result := False;
    Exit;
  end;

  // O @ e o ponto não podem estar juntos
  if  (Email[Pos( '@', Email) + 1] = '.') or
      (Email[Pos( '@', Email) - 1] = '.')
  then
  begin
    Result := False;
    Exit;
  end;

  // Testa se tem algum caracter inválido.
  for I := 1 to Length(Email) do
  begin
    for C := 0 to Length(InvalidChar) do
      if (Email[I] = InvalidChar[C]) then
      begin
        Result := False;
        Exit;
      end;
  end;

  // Se não encontrou problemas, retorna verdadeiro
  Result := True;
end;

function GetParentDirectory(path : string) : string;
begin
   result := ExpandFileName(path + '\..');
end;

function ConectadoInternet:boolean;
const
  cServers: array[0..2] of string=('http://www.google.com/',
                                   'http://www.microsoft.com/',
                                   'http://www.globo.com/');
var
  i:integer;
begin
  result := false;
  try
    for i:=0 to 2 do
    begin
      if InternetCheckConnection(PWidechar(CServers[i]), 1, 0) then
      begin
        result := true;
        Break;
      end;
    end;
  except
    result := false;
  end;
end;

function TimeToSeconds(const sTime : String): Int64;
begin
  result:=(HourOf(StrToTime(sTime)) * 3600) + (MinuteOf(StrToTime(sTime)) * 60)+SecondOf(StrToTime(sTime));
end;

function  DateDiffSec(pDt_Inicial,pDt_Final:TDateTime):integer;
var
  vRetorno:integer;
begin
  vRetorno := Round((pDt_Inicial - pDt_Final));
  if vRetorno < 0 then
    result := Round((pDt_Final - pDt_Inicial)*86400) {Retorna a diferenca em segundos}
  else
    result := Round((pDt_Inicial - pDt_Final)*86400);
end;


function GetFileModDate(filename : string) : TDateTime;
var
  F : TSearchRec;
begin
  FindFirst(filename,faAnyFile,F);
  //Result := F.Time;
  //if you wanted a TDateTime, change the return type and use this line:
  Result := FileDateToDatetime(F.Time);
  FindClose(F.FindHandle);
end;

Function GetRouterIP: string;
var
ndx: integer;
http1:TIdHTTP;
begin
  http1 := TIdHTTP.Create(Application);
  Try
    result:=uppercase(Http1.Get('http://www.whatismyip.com'));
    if result='' then result:='GET failed' else
    begin
      ndx:=pos('HOST',result);
      if ndx=0 then
        result:='host not found'
      else
      begin
        delete(result,1,ndx+4);
        ndx:=pos('VALUE=',result);
        if ndx>0 then delete(result,1,ndx+6);
        ndx:=pos('"',result);
        if ndx>0 then result:=copy(result,1,ndx);
      end;
    end;
  except
    http1.Free;
  End;
end;


end.
