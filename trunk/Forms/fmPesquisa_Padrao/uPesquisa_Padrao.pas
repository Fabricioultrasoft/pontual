unit uPesquisa_Padrao;

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
  Focus,
  DBGrids,
  ExtCtrls,
  uDataModule,
  Buttons,
  StrUtils,
  uUtils,
  DB,
  Grids,
  ADODB;

type
  Tfm_Pesquisa_Padrao = class(TForm)
    GroupBox1: TGroupBox;
    lb_Nome_Campo: TLabel;
    Label1: TLabel;
    cb_campo: TFocusCombobox;
    ed_Campo_Pesquisa: TFocusButtonedEdit;
    gb_Grid: TGroupBox;
    dbg_Pesquisa: TDBGrid;
    GroupBox3: TGroupBox;
    bt_Cancelar: TButton;
    bt_Confirmar: TButton;
    qy_padrao: TADOQuery;
    ds_padrao: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cb_campoClick(Sender: TObject);
    procedure dbg_PesquisaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbg_PesquisaDblClick(Sender: TObject);
    procedure qy_PadraoAfterOpen(DataSet: TDataSet);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure ed_Campo_PesquisaChange(Sender: TObject);
    procedure bt_ConfirmarClick(Sender: TObject);
    procedure bt_CancelarClick(Sender: TObject);
  private
    procedure PopularComboboxCampos;
    procedure ExecutarSQL;
    { Private declarations }
  public
    function AbrirConsulta(pTabela,pEntrada,pCampoBanco:string;pMultiSelect:boolean=false):string;
    { Public declarations }
  end;

type
  TConsulta=class
  private
    qy_Consulta:          TADOQuery;
    FTabela:              string;
    FStrListTipoCampo:    TStringList;
    FStrListNomeCampo:    TStringList;
    FOperador:            string;
    vTipoCampoSelecionado:string;
    vNomeCampoSelecionado:string;
    vValorFiltro:         string;
    v_CampoBanco:         string;
    FDescricaoCampo: string;
    FPrimeira_Execucao: boolean;
    procedure SetTabela(const Value: string);
    procedure SetStrListTipoCampo(const Value: TStringList);
    procedure SetStrListNomeCampo(const Value: TStringList);
    procedure SetOperador(const Value: string);
    procedure SetDescricaoCampo(const Value: string);
    procedure SetPrimeira_Execucao(const Value: boolean);
  public
    constructor Create;
    destructor Free;
    function GetOperador:string;
    function GetDescricaoCampo:string;
    property Tabela:          string      read FTabela            write SetTabela;
    property StrListTipoCampo:TStringList read FStrListTipoCampo  write SetStrListTipoCampo;
    property StrListNomeCampo:TStringList read FStrListNomeCampo  write SetStrListNomeCampo;
    property Operador:string              read FOperador          write SetOperador;
    property DescricaoCampo:string        read FDescricaoCampo    write SetDescricaoCampo;
    property Primeira_Execucao:boolean    read FPrimeira_Execucao write SetPrimeira_Execucao;
  end;

var
  fm_Pesquisa_Padrao: Tfm_Pesquisa_Padrao;

implementation

uses
  uUtilsDatabase;

var
  Consulta:TConsulta;

{$R *.dfm}

procedure Tfm_Pesquisa_Padrao.FormCreate(Sender: TObject);
begin
  qy_Padrao.Connection := Banco_dm.Conexao_banco_aco;
  PopularComboboxCampos;
end;


function Tfm_Pesquisa_Padrao.AbrirConsulta(pTabela,pEntrada,pCampoBanco:string;pMultiSelect:boolean):string;
var
  i:integer;
  vResult:string;
begin
  vResult := '(';
  try
    Consulta              := TConsulta.Create;
    Consulta.Tabela       := pTabela;
    Consulta.v_CampoBanco := pCampoBanco;
    Consulta.Primeira_Execucao := true;
    Consulta.qy_Consulta.Connection := Banco_dm.Conexao_banco_aco;

    //fm_Pesquisa_Padrao := Tfm_Pesquisa_Padrao.Create(Application);
    fm_Pesquisa_Padrao := Self;
    Application.CreateForm(Tfm_Pesquisa_Padrao,fm_Pesquisa_Padrao);

    fm_Pesquisa_Padrao.ExecutarSQL;

    if (not pMultiSelect) then
      fm_Pesquisa_Padrao.dbg_Pesquisa.Options := fm_Pesquisa_Padrao.dbg_Pesquisa.Options - [dgMultiSelect];

    fm_Pesquisa_Padrao.ShowModal;

    if fm_Pesquisa_Padrao.ModalResult = mrOk then
    begin
      if fm_Pesquisa_Padrao.dbg_Pesquisa.SelectedRows.Count > 0 then
      begin
        if (not pMultiSelect) then
        begin
          result := fm_Pesquisa_Padrao.qy_Padrao.FieldByName('nr_sequencia').AsString;
          Exit;
        end;

        with fm_Pesquisa_Padrao.dbg_Pesquisa.DataSource.DataSet do
        begin
          for i:=0 to fm_Pesquisa_Padrao.dbg_Pesquisa.SelectedRows.Count -1 do
          begin
            GotoBookmark(Pointer(fm_Pesquisa_Padrao.dbg_Pesquisa.SelectedRows.Items[i]));
            vResult:= vResult+fm_Pesquisa_Padrao.qy_Padrao.FieldByName('nr_sequencia').AsString+',';
          end;
          vResult := Copy(vResult,0,Length(vResult)-1);
          vResult := vResult+')';
        end;
      end
      else
      if pMultiSelect then
        vResult := '('+fm_Pesquisa_Padrao.qy_Padrao.FieldByName('NR_SEQUENCIA').AsString+')'
      else
        vResult := fm_Pesquisa_Padrao.qy_Padrao.FieldByName('NR_SEQUENCIA').AsString;
    end
    else
      vResult := pEntrada;

    result := vResult;
  except
    on E:Exception do
      Erro(Self.ClassName,'AbrirConsulta',E.Message,true,True,E);
  end;
end;

procedure Tfm_Pesquisa_Padrao.bt_CancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure Tfm_Pesquisa_Padrao.bt_ConfirmarClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure Tfm_Pesquisa_Padrao.cb_campoClick(Sender: TObject);
begin
  try
    case AnsiIndexStr(Consulta.StrListTipoCampo[cb_campo.ItemIndex],['bigint','integer','varchar']) of
      0,1: Consulta.vTipoCampoSelecionado := 'integer';
      2:Consulta.vTipoCampoSelecionado := 'varchar';
    end;

    Consulta.vNomeCampoSelecionado := Consulta.StrListNomeCampo[cb_campo.ItemIndex];

    Case AnsiIndexStr(AnsiLowerCase(Consulta.vTipoCampoSelecionado),['integer','varchar']) of
      0:Consulta.SetOperador('Like');
      1:Consulta.SetOperador('Like');
    end;
  except
    on E:Exception do
      Erro(Self.ClassName,'cb_campoClick',E.Message,true,True,E);
  end;
end;

procedure Tfm_Pesquisa_Padrao.dbg_PesquisaDblClick(Sender: TObject);
begin
  if bt_Confirmar.Enabled then
    bt_Confirmar.OnClick(Nil);
end;

procedure Tfm_Pesquisa_Padrao.dbg_PesquisaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Key = VK_DELETE) then
    Key := 0;
end;

procedure Tfm_Pesquisa_Padrao.ed_Campo_PesquisaChange(Sender: TObject);
begin
  qy_Padrao.Close;
  case AnsiIndexStr(AnsiLowerCase(Consulta.vTipoCampoSelecionado),['integer','varchar']) of
    0:
      begin
        ed_Campo_Pesquisa.NumbersOnly := True;
        Consulta.vValorFiltro := QuotedStr(NvlValidarInteger(ed_Campo_Pesquisa.Text,0)+'%');
      end;
    1:
      begin
        ed_Campo_Pesquisa.NumbersOnly := false;
        Consulta.vValorFiltro := QuotedStr('%'+AnsiReplaceStr(AnsiLowerCase(ed_Campo_Pesquisa.Text),' ','%')+'%');
      end;
  end;
  ExecutarSQL;
end;

procedure Tfm_Pesquisa_Padrao.FormActivate(Sender: TObject);
begin
  ed_Campo_Pesquisa.SetFocus;
end;

procedure Tfm_Pesquisa_Padrao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Consulta.Free;
  Action := Cafree;
end;

procedure Tfm_Pesquisa_Padrao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then {esc}
    ModalResult := mrCancel
  else
  if (Key = VK_RETURN) and (bt_Confirmar.Enabled) then
    ModalResult := mrOk;
end;

procedure Tfm_Pesquisa_Padrao.PopularComboboxCampos;
var
  i:integer;
  vNomeColuna:string;
  vDescricaoColuna:string;
begin
  try
    cb_campo.Items.Clear;
    cb_campo.Clear;
    {Obter todos os campos da tabela em questão}
    Consulta.qy_Consulta.Close;
    Consulta.qy_Consulta.SQL.Clear;
    Consulta.qy_Consulta.SQL.Add('select 	   a.attname as column,                                             ');
    Consulta.qy_Consulta.SQL.Add('           case                                                             ');
    Consulta.qy_Consulta.SQL.Add('           when substring(format_type(a.atttypid, a.atttypmod) from 1 for 17) = '+QuotedStr('character varying')+' then '+QuotedStr('varchar'));
    Consulta.qy_Consulta.SQL.Add('           when substring(format_type(a.atttypid, a.atttypmod) from 1 for 9)  = '+QuotedStr('timestamp')        +' then '+QuotedStr('timestamp'));
    Consulta.qy_Consulta.SQL.Add('           else'                                                             );
    Consulta.qy_Consulta.SQL.Add('           format_type(a.atttypid, a.atttypmod) end AS datatype'             );
    Consulta.qy_Consulta.SQL.Add('from 		   pg_attribute a'                                                   );
    Consulta.qy_Consulta.SQL.Add('inner join pg_class     c	on (c.oid = a.attrelid)'                           );
    Consulta.qy_Consulta.SQL.Add('inner join pg_namespace n on (n.oid = c.relnamespace)'                       );
    Consulta.qy_Consulta.SQL.Add('where 		  a.attnum > 0'                                                    );
    Consulta.qy_Consulta.SQL.Add('and 		    lower(c.relname) = '+QuotedStr(consulta.tabela)                  );
    Consulta.qy_Consulta.SQL.Add('and 		    not a.attisdropped'                                              );
    Consulta.qy_Consulta.SQL.Add('and 		    pg_table_is_visible(c.oid)'                                      );
    //Consulta.qy_Consulta.SQL.Add('and			    lower(substring(a.attname from 1 for 3)) <> '+QuotedStr('dt_')   );
    //Consulta.qy_Consulta.SQL.Add('and			    lower(a.attname) <> '+QuotedStr('nr_sequencia')                  );
    Consulta.qy_Consulta.SQL.Add('and			    lower(substring(a.attname from 1 for 7)) <> '+QuotedStr('nr_seq_'));
    if Consulta.v_CampoBanco <> '' then
      Consulta.qy_Consulta.SQL.Add('and lower(a.attname) = '+QuotedStr(AnsiLowerCase(Consulta.v_CampoBanco)));

    Consulta.qy_Consulta.Open;
    Consulta.qy_Consulta.First;

    while not Consulta.qy_Consulta.Eof do
    begin
      {Popular o combobox de pesquisa}
      vNomeColuna       := UpperCase(Consulta.qy_Consulta.FieldByName('COLUMN').AsString);
      vDescricaoColuna  := UpperCase(AnsiReplaceStr(Copy(vNomeColuna,4,Length(vNomeColuna)),'_',' '));

      case AnsiIndexStr(Copy(vNomeColuna,1,3),['DT_','NM_','NR_','DS_']) of
        0:vDescricaoColuna:='Data '     +vDescricaoColuna;
        1:vDescricaoColuna:='Nome '     +vDescricaoColuna;
        2:vDescricaoColuna:='Número '   +vDescricaoColuna;
        3:vDescricaoColuna:='Descrição '+vDescricaoColuna;
      end;
      Consulta.SetDescricaoCampo(vDescricaoColuna);
      cb_campo.Items.Add(Consulta.GetDescricaoCampo);
      Consulta.StrListTipoCampo.Add(Consulta.qy_Consulta.FieldByName('DATATYPE').AsString);
      Consulta.StrListNomeCampo.Add(Consulta.qy_Consulta.FieldByName('COLUMN').AsString);
      Consulta.qy_Consulta.Next;
    end;

    cb_campo.ItemIndex := 0;
    cb_campoClick(Self);
  except
    on E:Exception do
      Erro(Self.ClassName,'PopularComboboxCampos',E.Message,True,True,E);
  end;
end;

procedure Tfm_Pesquisa_Padrao.ExecutarSQL;
begin
  try
    qy_Padrao.Close;
    if Consulta.vNomeCampoSelecionado <> '' then
    begin
      qy_Padrao.SQL.Clear;
      qy_Padrao.SQL.Add('select * from '+Consulta.Tabela);
      qy_Padrao.SQL.Add('where  1=1');

      if not Consulta.Primeira_Execucao then
      case AnsiIndexStr(Consulta.vTipoCampoSelecionado,['integer','varchar']) of
        0:qy_Padrao.SQL.Add('and Cast('+Consulta.vNomeCampoSelecionado+' as varchar) '+Consulta.GetOperador+' '+Consulta.vValorFiltro);
        1:qy_Padrao.SQL.Add('and lower(remove_acento('+Consulta.vNomeCampoSelecionado+')) '+Consulta.GetOperador+' '+Consulta.vValorFiltro);
      end;
      qy_Padrao.SQL.Add('order by '+Consulta.vNomeCampoSelecionado);
      qy_Padrao.Open;
      AutoSizeDbGridCol(dbg_Pesquisa);
    end
    else
      qy_Padrao.Close;
    Consulta.Primeira_Execucao := false;
  except
    on E:Exception do
      Erro(Self.ClassName,'PopularComboboxCampos',E.Message,True,True,E);
  end;
end;

procedure Tfm_Pesquisa_Padrao.qy_PadraoAfterOpen(DataSet: TDataSet);
begin
  try
    bt_Confirmar.Enabled := (not qy_Padrao.IsEmpty) and (qy_Padrao.RecordCount > 0);
  except
    on E:Exception do
      Erro(Self.ClassName,'qy_PadraoAfterOpen',E.Message,True,True,E);
  end;
end;

{ TConsulta }

constructor TConsulta.Create;
begin
  try
    if not Assigned(qy_Consulta) then
    begin
      qy_Consulta := InstanciarQuery;
    end;

    if not Assigned(StrListTipoCampo) then
      StrListTipoCampo := TStringList.Create;

    if not Assigned(StrListNomeCampo) then
      StrListNomeCampo := TStringList.Create;
  except
    on E:Exception do
      Erro(Self.ClassName,'Create',E.Message,True,True,E);
  end;
end;

destructor TConsulta.Free;
begin
  try
    if Assigned(qy_Consulta) then
    begin
      qy_Consulta.Free;
      qy_Consulta := Nil;
    end;

    if Assigned(StrListTipoCampo) then
      StrListTipoCampo.Free;

    if Assigned(StrListNomeCampo) then
      StrListNomeCampo.Free;
  except
    on E:Exception do
      Erro(Self.ClassName,'Free',E.Message,True,True,E);
  end;
end;

function TConsulta.GetDescricaoCampo: string;
begin
  result := FDescricaoCampo;
end;

procedure TConsulta.SetDescricaoCampo(const Value: string);
begin
  FDescricaoCampo := Value;
end;

function TConsulta.GetOperador: string;
begin
  result := FOperador;
end;

procedure TConsulta.SetOperador(const Value: string);
begin
  FOperador := Value;
end;

procedure TConsulta.SetPrimeira_Execucao(const Value: boolean);
begin
  FPrimeira_Execucao := Value;
end;

procedure TConsulta.SetStrListNomeCampo(const Value: TStringList);
begin
  FStrListNomeCampo := Value;
end;

procedure TConsulta.SetStrListTipoCampo(const Value: TStringList);
begin
  FStrListTipoCampo := Value;
end;

procedure TConsulta.SetTabela(const Value: string);
begin
  FTabela := Value;
end;

end.
