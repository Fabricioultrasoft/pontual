unit uMensagem;

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
  ExtCtrls,
  StdCtrls;

type TCorMsg = (CmAprovado,CmReprovado,CmAtencao);

type
  Tfm_Mensagem = class(TForm)
    ctg_Mensagem: TCategoryPanelGroup;
    cp_Titulo:    TCategoryPanel;
    mm_Mensagem:  TMemo;
    procedure     FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    procedure AddMsg(pErro:string;p_Funcionario,p_Cod_Erro:integer);
    { Public declarations }
  end;

var
  fm_Mensagem: Tfm_Mensagem;

implementation

{$R *.dfm}

{ Tfm_Mensagem }

procedure Tfm_Mensagem.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure Tfm_Mensagem.AddMsg(pErro:string;p_Funcionario,p_Cod_Erro:integer);
procedure SetCor(Cor:TCorMsg);
  var
    vCor:TColor;
  begin
    case Cor of
      CmAprovado: vCor := clLime ;
      CmReprovado:vCor := clRed ;
      CmAtencao:  vCor := $0000D5D5;
    end;

    mm_Mensagem.Font.Color         := vCor;
    ctg_Mensagem.Color             := vCor;
    ctg_Mensagem.GradientBaseColor := vCor;
    Application.ProcessMessages;
  end;

begin
  if (p_Cod_Erro in [1,2]) then
  begin
    mm_Mensagem.Lines.Add(pErro);
    cp_Titulo.Caption := 'Atenção!';
    SetCor(CmAtencao);
    Exit;//Cai fora
  end;

  if (p_Funcionario > 0) then
  begin
    SetCor(CmAprovado);
    mm_Mensagem.Lines.Add('Ponto confirmado às ['+DateTimeToStr(Now)+']');
    cp_Titulo.Caption := 'Reconhecido';
  end
  else
  begin
    SetCor(CmReprovado);
    mm_Mensagem.Lines.Add('Tente novamente...');
    cp_Titulo.Caption := 'Não Reconhecido';
  end;
  Application.ProcessMessages;
end;



end.
