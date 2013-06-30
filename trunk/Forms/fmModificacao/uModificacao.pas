unit uModificacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, Focus;

type
  TfmModificacao = class(TForm)
    ed_dt_data_atualizacao: TFocusEdit;
    Label5: TLabel;
    Label6: TLabel;
    ed_nm_usuario_atualizacao: TFocusEdit;
    ed_dt_data_criacao: TFocusEdit;
    Label4: TLabel;
    Label3: TLabel;
    ed_nm_usuario_criacao: TFocusEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    procedure Exibir(pUsuarioCriacao,pDataCriacao,pUsuarioAtualizacao,pDataAtualizacao:string);
    { Public declarations }
  end;

var
  fmModificacao: TfmModificacao;

implementation

{$R *.dfm}

procedure TfmModificacao.Exibir(pUsuarioCriacao, pDataCriacao,pUsuarioAtualizacao, pDataAtualizacao: string);
begin
  if pUsuarioCriacao <> '' then
  begin
    fmModificacao.ed_nm_usuario_criacao.Text    := pUsuarioCriacao;
    fmModificacao.ed_dt_data_criacao.Text       := pDataCriacao;
    fmModificacao.ed_nm_usuario_atualizacao.Text:= pUsuarioAtualizacao;
    fmModificacao.ed_dt_data_atualizacao.Text   := pDataAtualizacao;
    fmModificacao.ShowModal;
  end
  else
    fmModificacao.Free;
end;

procedure TfmModificacao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;


procedure TfmModificacao.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
    Close;
end;

end.
