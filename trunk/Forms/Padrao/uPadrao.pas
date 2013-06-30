unit uPadrao;

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
  Menus,
  ComCtrls,
  StrUtils,
  TypInfo,
  uManipulacaoDados,
  Generics.Collections;

type
  Tfm_Padrao = class(TForm)
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
  private
    const
    Forms : array[0..4] of string = ( 'tfm_cadastro_funcionario',
                                      'tfm_gerencia_horario',
                                      'tfm_cad_turno',
                                      'tfm_cadastro_feriado',
                                      'tfm_configuracoes') ;
    { Private declarations }
  public
    vFuncionario:       TFuncionario;
    vFuncionario_Ponto: TFuncionario_Ponto;
    vTurno:             TTurno;
    vFeriado:           TFeriado;
    vListaCompObr:TList<TObject>;
    procedure MostrarForm(Sender:TObject);
    function  JanelasAbertas(pMenu:TMainMenu):boolean;
    procedure RemoveItems;
    { Public declarations }
  end;

var
  fm_Padrao: Tfm_Padrao;

implementation

uses
  uUtils,
  uCadastro_Funcionario,
  uPrincipal,
  uModificacao,
  uGerenciaHorario,
  uCadTurno,
  uFeriado,
  uConfiguracoes;

{$R *.dfm}


procedure Tfm_Padrao.FormCreate(Sender: TObject);
begin
  try
    case AnsiIndexStr(AnsiLowerCase(Sender.ClassName),Forms) of
      0:begin
          fm_Cadastro_Funcionario := Sender as Tfm_Cadastro_Funcionario;
          vFuncionario           := TFuncionario.Create;
        end;
      1:begin
          fm_Gerencia_Horario    := Sender as Tfm_Gerencia_Horario;
          vFuncionario_Ponto     := TFuncionario_Ponto.Create;
        end;
      2:begin
          fm_Cad_Turno           := Sender as Tfm_Cad_Turno;
          vTurno                 := TTurno.Create;
        end;
      3:begin
          fm_Cadastro_Feriado    := Sender as Tfm_Cadastro_Feriado;
          vFeriado               := TFeriado.Create;
        end;
      4:begin
          fm_Configuracoes       := Sender as Tfm_Configuracoes;
        end;
    end;
    vListaCompObr := ListaComponentes(Sender as TForm,0,'obrigatorio',true);
    Application.Title := Self.Caption;
    if Assigned(fm_Principal) then
      JanelasAbertas(fm_Principal.men_Padrao);
  Except
    on E:Exception do
      Erro(Self.ClassName,'FormCreate',E.Message,true,true,E);
  end;
end;

procedure Tfm_Padrao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  try
    vListaCompObr.Free;
    case AnsiIndexStr(AnsiLowerCase(Sender.ClassName),Forms) of
      0:begin
          vFuncionario.Free;
        end;
      1:begin
          vFuncionario_Ponto.Free;
        end;
      2:begin
          vTurno.Free;
        end;
      3:begin
          vFeriado.Free;
        end;
    end;
    Action:=caFree;
    if Assigned(fm_Principal) then
    begin
      Self.Hint := 'Fechar';
      JanelasAbertas(fm_Principal.men_Padrao);
      RemoveItems;
    end;
  Except
    on E:Exception do
      Erro(Self.ClassName,'FormClose',E.Message,true,true,E);
  end;
end;

procedure Tfm_Padrao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  vIndex:integer;
begin
  try
    if ((Shift = [ssCtrl]) or (Shift = [ssShift]) or (Shift = [ssShift,ssCtrl])) and (Key = VK_DELETE) then
      Key := 0;

    if (ssShift in Shift) and (Key = VK_F7) then
      showmessage('Parametrização de tela '+Self.ClassName);

    if (ssCtrl in Shift) and (ssShift in Shift) and (Key = 85) then
    begin
      vIndex := AnsiIndexStr(AnsiLowerCase(Sender.ClassName),Forms);
      if vIndex in [0,1,2,3] then
      begin
        fmModificacao := TfmModificacao.Create(Application);
        case vIndex of
          0:fmModificacao.Exibir(vFuncionario.Nm_Usuario_Criacao,       DateTimeToStrNull(vFuncionario.Dt_Criacao),       vFuncionario.Nm_Usuario_Atualizacao,      DateTimeToStrNull(vFuncionario.Dt_Atualizacao));
          1:fmModificacao.Exibir(vFuncionario_Ponto.Nm_Usuario_Criacao, DateTimeToStrNull(vFuncionario_Ponto.Dt_Criacao), vFuncionario_Ponto.Nm_Usuario_Atualizacao,DateTimeToStrNull(vFuncionario_Ponto.Dt_Atualizacao));
          2:fmModificacao.Exibir(vTurno.Nm_Usuario_Criacao,             DateTimeToStrNull(vTurno.Dt_Criacao),             vTurno.Nm_Usuario_Atualizacao,            DateTimeToStrNull(vTurno.Dt_Atualizacao));
          3:fmModificacao.Exibir(vFeriado.Nm_Usuario_Criacao,           DateTimeToStrNull(vFeriado.Dt_Criacao),           vFeriado.Nm_Usuario_Atualizacao,          DateTimeToStrNull(vFeriado.Dt_Atualizacao));
        end;
      end;
    end;
  Except
    on E:Exception do
      Erro(Self.ClassName,'FormKeyDown',E.Message,true,true,E);
  end;
end;

function Tfm_Padrao.JanelasAbertas(pMenu:TMainMenu):boolean;
var
  i: integer;
  VarComponente: TForm;
  Item:TMenuItem;
begin
  try
    VarComponente := nil;
    result := false;
    TMenuItem(pMenu.Items.Find('Janelas')).Clear;
    for i := 0 to Application.ComponentCount - 1 do
      if Application.Components[i] is TForm then
      begin
        VarComponente := TForm(Application.Components[i]);
        if not (ContemItemMenu(pMenu,VarComponente.Name)) and (VarComponente.FormStyle <> fsMDIForm) then
        begin
          Item          := TMenuItem.Create(Application);
          Item.Caption  := VarComponente.Caption;
          Item.Hint     := VarComponente.ClassName;
          Item.OnClick  := MostrarForm;
          TMenuItem(pMenu.Items.Find('Janelas')).Add(Item);
          Item.Click;
          result := true;
        end;
      end;
  except
    on E:Exception do
      Erro(Nm_Unit,'JanelasAbertas',E.Message,true,true,E);
  end;
end;

procedure Tfm_Padrao.MostrarForm(Sender:TObject);
var
  mi:TMenuItem;
  vForm:TForm;
  i:integer;
begin
  try
    mi := TMenuItem(Sender);
    vForm := Retorna_Form(mi.Hint);
    if vForm <> nil then
    begin
      for i := 0 to mi.Parent.Count -1 do
        mi.Parent.Items[i].Checked := mi.Parent.Items[i] = mi;
      vForm.Show;
      vForm.WindowState := wsMaximized;

      fm_Principal.mc_Calendario.Visible:= False;
    end;
  except
    on E:Exception do
      Erro(Nm_Unit,'MostrarForm',E.Message,true,true,E);
  end;
end;

procedure Tfm_Padrao.RemoveItems;
var
  i:integer;
  Item:TMenuItem;
begin
  try
    Item:=TMenuItem(fm_Principal.men_Padrao.Items.Find('Janelas'));
    for i:=0 to Item.Count -1 do
    begin
      if Retorna_Form(Item[i].Hint) = nil then
        Item.Remove(item[i])
      else
      if TForm(Retorna_Form(Item[i].Hint)).Hint = 'Fechar' then
      begin
        Item.Remove(item[i]);
        break;
      end;
    end;
    if Item.Count = 0 then
    begin
      Application.Title := 'Pontual';
      fm_Principal.mc_Calendario.visible := true;
    end;
  except
    on E:Exception do
      Erro(Nm_Unit,'RemoveItems',E.Message,true,true,E);
  end;
end;

end.
