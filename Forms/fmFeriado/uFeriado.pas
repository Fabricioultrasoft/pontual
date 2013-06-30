unit uFeriado;

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
  ExtCtrls,
  Focus,
  Grids,
  DBGrids,
  ComCtrls,
  DB,
  ADODB,
  uManipulacaoDados, Mask, Menus;

type
  Tfm_Cadastro_Feriado = class(Tfm_Padrao)
    pc_Principal: TPageControl;
    ts_Consulta: TTabSheet;
    ts_Cadastro: TTabSheet;
    gb_Codigo_Sequencial: TGroupBox;
    Label11: TLabel;
    ed_nr_sequencia: TFocusButtonedEdit;
    gb_Dados: TGroupBox;
    Label1: TLabel;
    ed_ds_feriado: TFocusEdit;
    Label2: TLabel;
    pm_Feriado: TPopupMenu;
    mi_Consultar: TMenuItem;
    cb_Nr_mes_feriado: TFocusCombobox;
    Label3: TLabel;
    Label4: TLabel;
    cb_Nr_dia_feriado: TFocusCombobox;
    ed_Nr_ano_feriado: TFocusButtonedEdit;
    Label5: TLabel;
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
    qy_Lista_Feriado: TADOQuery;
    ds_Lista_Feriado: TDataSource;
    GroupBox1: TGroupBox;
    dbg_Feriado: TDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure bt_PrimeiroClick(Sender: TObject);
    procedure bt_NovoClick(Sender: TObject);
    procedure bt_ConsultarClick(Sender: TObject);
    procedure bt_SalvarClick(Sender: TObject);
    procedure bt_CancelarClick(Sender: TObject);
    procedure bt_ExcluirClick(Sender: TObject);
    procedure mi_ConsultarClick(Sender: TObject);
    procedure bt_AnteriorClick(Sender: TObject);
    procedure bt_ProximoClick(Sender: TObject);
    procedure dbg_FeriadoDblClick(Sender: TObject);
    procedure cb_Nr_mes_feriadoClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ed_nr_sequenciaChange(Sender: TObject);
  private
    procedure ExecutarConsulta(pOrderBy:string);
    procedure Carregar(pNr_Sequencia:integer);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fm_Cadastro_Feriado: Tfm_Cadastro_Feriado;

implementation

uses
  uUtils,
  uDataModule;

{$R *.dfm}

procedure Tfm_Cadastro_Feriado.FormCreate(Sender: TObject);
begin
  inherited;
  qy_Lista_Feriado.Connection := Banco_dm.Conexao_banco_aco;
end;

procedure Tfm_Cadastro_Feriado.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure Tfm_Cadastro_Feriado.bt_AnteriorClick(Sender: TObject);
begin
  inherited;
  if ed_Nr_Sequencia.Text = '' then
    Carregar(vFeriado.Primeiro)
  else
    Carregar(vFeriado.Anterior(StrToIntDef(ed_Nr_Sequencia.Text,0)));
end;

procedure Tfm_Cadastro_Feriado.bt_CancelarClick(Sender: TObject);
begin
  inherited;
  Carregar(StrToIntDef(ed_Nr_Sequencia.Text,0));
end;

procedure Tfm_Cadastro_Feriado.bt_ConsultarClick(Sender: TObject);
begin
  inherited;
  ExecutarConsulta('');
  AutoSizeDbGridCol(dbg_Feriado);
end;

procedure Tfm_Cadastro_Feriado.bt_ExcluirClick(Sender: TObject);
begin
  inherited;
  if MessageBox('Confirmar a exclusão do feriado "'+ed_ds_feriado.Text+'" ?',mConfirmation,bmYES_NO) = IDYES then
    if vFeriado.Deletar(StrToIntDef(ed_Nr_Sequencia.Text,0)) then
      LimparCampos(Self,0);
end;

procedure Tfm_Cadastro_Feriado.bt_NovoClick(Sender: TObject);
begin
  try
    SetPropertyAttributes(vListaCompObr,'obrigatorio',false);
    LimparCampos(Self,0);
    cb_Nr_mes_feriado.SetFocus;
    cb_Nr_mes_feriado.DroppedDown := true;
    bt_Salvar.Enabled := true;
    SetPropertyAttributes(vListaCompObr,'obrigatorio',true);
  except
    on E:Exception do
      Erro(Self.ClassName,'bt_NovoClick',E.Message,True,True,E);
  end;
end;

procedure Tfm_Cadastro_Feriado.bt_PrimeiroClick(Sender: TObject);
begin
  inherited;
  Carregar(vFeriado.Primeiro);
end;

procedure Tfm_Cadastro_Feriado.bt_ProximoClick(Sender: TObject);
begin
  inherited;
  if ed_Nr_Sequencia.Text = '' then
    Carregar(vFeriado.Ultimo)
  else
    Carregar(vFeriado.Proximo(StrToIntDef(ed_Nr_Sequencia.Text,0)));
end;

procedure Tfm_Cadastro_Feriado.bt_SalvarClick(Sender: TObject);
var
  bUpdating:boolean;
begin
  try
    if Campo_Invalido(Self,0) then
      Exit;

    bUpdating := ed_Nr_Sequencia.Text <> '';

    if bUpdating then
    begin
      vFeriado.nm_usuario_atualizacao := Banco_dm.BancoAttributes.User_ID;
      vFeriado.Dt_Atualizacao         := now;
    end
    else
    begin
      vFeriado.Nm_Usuario_Criacao     := Banco_dm.BancoAttributes.User_ID;
      vFeriado.Dt_Criacao             := now;
    end;

    vFeriado.Nr_Sequencia            := StrToIntDef(ed_Nr_Sequencia.Text,0);
    vFeriado.nr_dia                  := (cb_Nr_dia_feriado.ItemIndex)+1;
    vFeriado.nr_mes                  := (cb_Nr_mes_feriado.ItemIndex)+1;
    vFeriado.nr_ano                  := StrToIntDef(ed_Nr_ano_feriado.Text,0);
    vFeriado.ds_feriado              := ed_ds_feriado.Text;

    if vFeriado.Gravar then
    begin
      if bUpdating then
        Carregar(StrToInt(ed_Nr_Sequencia.Text))
      else
        Carregar(vFeriado.Ultimo);
    end;
  except
    on E:Exception do
      Erro(Self.ClassName,'bt_SalvarClick',E.Message,True,True,E);
  end;
end;

procedure Tfm_Cadastro_Feriado.Carregar(pNr_Sequencia: integer);
var
  bAtivar:boolean;
begin
  try
    SetPropertyAttributes(vListaCompObr,'color',clWindow);
    vFeriado.Select(pNr_Sequencia);
    bAtivar := vFeriado.Nr_Sequencia > 0;
    if bAtivar then
    begin
      ed_Nr_Sequencia.Text            := InttoStr(vFeriado.Nr_Sequencia);
    end;


    ed_ds_feriado.Text          := vFeriado.ds_feriado;
    cb_Nr_mes_feriado.ItemIndex := (vFeriado.nr_mes)-1;
    cb_Nr_dia_feriado.ItemIndex := (vFeriado.nr_dia)-1;
    ed_Nr_ano_feriado.Text      := IntToVazio(vFeriado.nr_ano);

    bt_Excluir.Enabled                := bAtivar;
    bt_Salvar.Enabled                 := bAtivar;
    bt_Cancelar.Enabled               := bAtivar;

  except
    on E:Exception do
      Erro(Self.ClassName,'Carregar',E.Message,True,True,E);
  end;
end;

procedure Tfm_Cadastro_Feriado.cb_Nr_mes_feriadoClick(Sender: TObject);
begin
  inherited;
  cb_Nr_dia_feriado.DroppedDown := true;
end;

procedure Tfm_Cadastro_Feriado.dbg_FeriadoDblClick(Sender: TObject);
begin
  inherited;
  if (not qy_Lista_Feriado.IsEmpty) then
  begin
    Carregar(qy_Lista_Feriado.FieldByName('NR_SEQUENCIA').AsInteger);
    pc_Principal.ActivePage := ts_Cadastro;
  end;
end;

procedure Tfm_Cadastro_Feriado.ed_nr_sequenciaChange(Sender: TObject);
begin
  inherited;
  Carregar(StrToIntDef(ed_Nr_Sequencia.Text,0));
end;

procedure Tfm_Cadastro_Feriado.ExecutarConsulta(pOrderBy: string);
begin
  qy_Lista_Feriado.Close;
  qy_Lista_Feriado.SQL.Clear;
  qy_Lista_Feriado.SQL.Add('select 	cast(trim(to_char(a.nr_dia,''00''))||''/''||trim(to_char(a.nr_mes,''00''))as varchar(255)) dia_mes,');
  qy_Lista_Feriado.SQL.Add('        a.* from feriado a');

  if pOrderBy <> '' then
    qy_Lista_Feriado.SQL.Add('order by '+pOrderBy)
  else
    qy_Lista_Feriado.SQL.Add('order by ds_feriado');

  qy_Lista_Feriado.Open;
end;

procedure Tfm_Cadastro_Feriado.mi_ConsultarClick(Sender: TObject);
begin
  inherited;
   bt_Consultar.OnClick(Nil);
end;

end.
