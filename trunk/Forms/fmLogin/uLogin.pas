unit uLogin;

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
  Buttons,

  ComCtrls,


  uUtils,
  Focus,
  ExtCtrls, PngImageList, ImgList, PngBitBtn;

type
  TLogin_fm = class(TForm)
    LabelUsuario_lb: TLabel;
    LabelSenha_lb: TLabel;
    ed_Nm_Usuario: TFocusButtonedEdit;
    ed_ds_senha: TFocusButtonedEdit;
    img_List: TPngImageList;
    bt_Cancelar: TPngBitBtn;
    Entrar_bt: TPngBitBtn;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private
    procedure StayOnTop;
    { Private declarations }
  public
    procedure ExibirLogin(pTipo:string);
    { Public declarations }
  end;

var
  Login_fm:TLogin_fm;

implementation

uses
  uDataModule,
  uUtilsDatabase;

{$R *.dfm}

procedure TLogin_fm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 13 then
    Entrar_bt.Click;
end;

procedure TLogin_fm.FormShow(Sender: TObject);
begin
  ShowWindow(Application.Handle, SW_NORMAL);
end;

procedure TLogin_fm.StayOnTop;
begin
  SetWindowPos(  Handle,  HWND_TOPMOST,  0,   0,   0,   0,   SWP_NOACTIVATE or SWP_NOMOVE or SWP_NOSIZE);
end;

procedure TLogin_fm.ExibirLogin(pTipo:string);
var
  vLogado:boolean;
  vCase:integer;
  vRetry:boolean;
  vPass:string;
  AlteracaoSenha:boolean;
{ 'B' > Bloqueado -> Somente o usuario que bloqueou pode desbloquear
  'A' > Alteração de Senha -> Exibirá form para mudança de senha
  'N' > Normal    -> Login normal, independente do usuario
  'S' > Senha     -> Exibe requisição de senha
}
begin
  try
    try
      Login_fm := TLogin_fm.Create(Application);
      AlteracaoSenha := (pTipo='S');
      if AlteracaoSenha then
      begin
        Login_fm.Caption := 'Informe sua senha atual ';
        Login_fm.ed_nm_usuario.Enabled := False;
        Login_fm.ed_nm_usuario.Text    := Banco_dm.BancoAttributes.User_ID;
      end;

      Login_fm.ShowModal;

      if Login_fm.ModalResult = mrOk then
      begin
        vLogado := Banco_dm.Conectado(Login_fm.ed_Nm_Usuario.Text,Login_fm.ed_ds_senha.Text);
        while(not vLogado) do
        begin
          Login_fm.ShowModal;
          if Login_fm.ModalResult <> mrOk then
          begin
            break;
          end;
          vLogado := Banco_dm.Conectado(Login_fm.ed_Nm_Usuario.Text,Login_fm.ed_ds_senha.Text);
        end;
      end
      else
      if not AlteracaoSenha then
        Encerrar;

      if (AlteracaoSenha) and (vLogado) then
      begin
        vRetry := not PasswordInputBox(vPass); //ALTERACAO DE SENHA
        while vRetry do
        begin
          vRetry := false;
          if MessageBox('Tentar novamente ?',mConfirmation,bmYES_NO) = IDYES then
          vRetry := not PasswordInputBox(vPass)
        end;

        if vPass <> '' then
        begin
          ExecutarSQL('alter user '+Banco_dm.BancoAttributes.User_ID+' with encrypted password '+QuotedStr(vPass));
          MessageBox('Senha atualizada com sucesso e lembre-se, se esquece-la, terá que requisitar ao administrador do sistema sua redefinição de senha.',mExclamation,bmOK);
        end;
      end;

      Banco_dm.BancoAttributes.Conectado := vLogado;

    except
      on E:Exception do
      begin
        Erro('uLogin','ExibirLogin',e.Message,True,True,E);
      end;
    end;
  finally
    if (vLogado) or (AlteracaoSenha) then
      Login_fm.Free
    else
      Encerrar;
  end;
end;

end.
