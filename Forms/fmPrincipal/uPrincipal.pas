unit uPrincipal;

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
  Menus,
  ComCtrls,
  ExtDlgs,
  ExtCtrls,
  Buttons,
  xpman,
  uDataModule, AppEvnts;
type
  Tfm_Principal = class(TForm)
    img_Principal:TImage;
    sb_Padrao: TStatusBar;
    pm_Principal: TPopupMenu;
    mi_Alterar_Plano_Fundo: TMenuItem;
    mi_Plano: TMenuItem;
    mi_Nao_utilizar_imagem: TMenuItem;
    mi_Cor_Fonte: TMenuItem;
    cd_Dialog: TColorDialog;
    fo_Dialog: TOpenPictureDialog;
    mc_Calendario: TMonthCalendar;
    men_Padrao: TMainMenu;
    mi_Arquivo: TMenuItem;
    mi_Cadastro_e_Consulta: TMenuItem;
    mi_Cadastro_Funcionario: TMenuItem;
    mi_Cadastro_Horario: TMenuItem;
    mi_Sistema: TMenuItem;
    mi_Gerenciamento: TMenuItem;
    mi_Cadastro_Usuario: TMenuItem;
    mi_Manutencao: TMenuItem;
    mi_Janelas: TMenuItem;
    mi_Cadastro_Turno: TMenuItem;
    mi_Cadastro_Feriado: TMenuItem;
    mi_Alterar_Senha: TMenuItem;
    mi_Ajuda: TMenuItem;
    Atalhos1: TMenuItem;
    CTRLSHIFTUMostraaultimaedioocorridanoregistro1: TMenuItem;
    CTRLSSalvaumRegistro1: TMenuItem;
    CTRLNNovoRegistro1: TMenuItem;
    AtualizaumaConsulta1: TMenuItem;
    XPManifest1: TXPManifest;
    procedure FormCreate(Sender: TObject);
    procedure mi_Cadastro_FuncionarioClick(Sender: TObject);
    procedure mi_Cadastro_UsuarioClick(Sender: TObject);
    procedure mi_ManutencaoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure mi_Cadastro_HorarioClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure sb_PadraoDrawPanel(StatusBar: TStatusBar;
      Panel: TStatusPanel; const Rect: TRect);
    procedure mi_Alterar_Plano_FundoClick(Sender: TObject);
    procedure mi_Cadastro_TurnoClick(Sender: TObject);
    procedure mi_Cadastro_FeriadoClick(Sender: TObject);
    procedure mi_Nao_utilizar_imagemClick(Sender: TObject);
    procedure mi_Cor_FonteClick(Sender: TObject);
    procedure mi_Alterar_SenhaClick(Sender: TObject);  private
    { Private declarations }
  public
    procedure AtualizarUsuario;
    { Public declarations }
  end;

var
  fm_Principal: Tfm_Principal;

implementation

uses  uUtils,
      uCadastro_Funcionario,
      uCadastro_Usuario,
      uConfiguracoes,
      uCadTurno,
      uGerenciaHorario,
      ULogin,
      uFeriado,
      DB;

{$R *.dfm}

procedure Tfm_Principal.mi_Alterar_Plano_FundoClick(Sender: TObject);
begin
  if fo_Dialog.Execute then
  begin
    img_Principal.Picture.LoadFromFile(fo_Dialog.FileName);
    GravaArquivoIni('Config', 'Definicoes', 'Plano_Fundo', fo_Dialog.FileName);
  end;
end;

procedure Tfm_Principal.mi_Cadastro_FuncionarioClick(Sender: TObject);
begin
  CriaForm(Tfm_Cadastro_Funcionario);
end;

procedure Tfm_Principal.mi_Cadastro_UsuarioClick(Sender: TObject);
begin
  CriaForm(Tfm_Cadastro_Usuario);
end;

procedure Tfm_Principal.mi_Cor_FonteClick(Sender: TObject);
begin
  if cd_Dialog.Execute then
  begin
    GravaArquivoIni('Config', 'Definicoes', 'Cor_Fonte_Fundo', ColorToString(cd_Dialog.Color));
  end;
end;

procedure Tfm_Principal.mi_ManutencaoClick(Sender: TObject);
begin
  CriaForm(Tfm_Configuracoes);
end;

procedure Tfm_Principal.mi_Nao_utilizar_imagemClick(Sender: TObject);
begin
  GravaArquivoIni('Config', 'Definicoes', 'Plano_Fundo', '');
  img_Principal.Picture.Assign(Nil);
  img_Principal.Visible := false;
  img_Principal.Visible := true;
end;

procedure Tfm_Principal.mi_Cadastro_FeriadoClick(Sender: TObject);
begin
  CriaForm(Tfm_Cadastro_Feriado);
end;

procedure Tfm_Principal.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if MessageBox('Deseja encerrar o aplicativo ?',mConfirmation,bmYES_NO)= IDYES then
    Application.Terminate
  else
    abort;
end;

procedure Tfm_Principal.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  CanClose := not fm_Padrao.JanelasAbertas(men_Padrao);
  if  not CanClose then
    MessageBox('Para encerrar é preciso fechar as janelas ativas',mConfirmation,bmOK);
end;

procedure Tfm_Principal.FormCreate(Sender: TObject);
var
  vImagem:string;
  vCorFonte:string;
begin
  inherited;
  try
    mc_Calendario.Date      := Now;
    mi_Manutencao.Enabled := Banco_dm.BancoAttributes.SuperUser;
    mi_Manutencao.Visible := mi_Manutencao.Enabled;
    mi_Gerenciamento.Enabled:= mi_Manutencao.Enabled;
    mi_Gerenciamento.Visible:= mi_Manutencao.Enabled;

    vImagem  := Obter_Valor_Parametro('Config', 'Definicoes', 'Plano_Fundo');
    vCorFonte:= Obter_Valor_Parametro('Config','Definicoes','Cor_Fonte_Fundo');

    showmessage(GetRouterIP);

    if FileExists(vImagem) then
      img_Principal.Picture.LoadFromFile(vImagem);

    if vCorFonte <> '' then
    begin
      try
//        lb_Hora.Font.Color := StringToColor(vCorFonte);
//        lb_Dia.Font.Color  := StringToColor(vCorFonte);
      except
      end;
    end;
    AtualizarUsuario;
  except
    on E:Exception do
      Erro(Self.ClassName,'FormCreate',E.Message,true,true,E);

  end;
end;

procedure Tfm_Principal.mi_Cadastro_HorarioClick(Sender: TObject);
begin
  CriaForm(Tfm_Gerencia_Horario);
end;

procedure Tfm_Principal.mi_Cadastro_TurnoClick(Sender: TObject);
begin
  CriaForm(Tfm_Cad_Turno);
end;

procedure Tfm_Principal.sb_PadraoDrawPanel(StatusBar: TStatusBar;
  Panel: TStatusPanel; const Rect: TRect);
begin
  if Panel.Index = 0 then
    uDataModule.Banco_dm.img_List.Draw(sb_Padrao.Canvas,Rect.Left+5,Rect.Top+1,10)
  else
  if Panel.Index = 2 then
    uDataModule.Banco_dm.img_List.Draw(sb_Padrao.Canvas,Rect.Left+5,Rect.Top+1,22)
  else
  if Panel.Index = 4 then
    uDataModule.Banco_dm.img_List.Draw(sb_Padrao.Canvas,Rect.Left+5,Rect.Top+1,23)
end;

procedure Tfm_Principal.mi_Alterar_SenhaClick(Sender: TObject);
begin
  Login_fm.ExibirLogin('S');
end;

procedure Tfm_Principal.AtualizarUsuario;
var
  i:integer;
begin
  for i := 0 to sb_Padrao.Panels.Count -1 do
  begin
    case i of
      1:begin
          sb_Padrao.Panels[i].Text  := Banco_dm.BancoAttributes.User_ID;
        end;
      3:begin
          sb_Padrao.Panels[i].Text := LocalIP;
        end;
      5:begin
          sb_Padrao.Panels[i].Text := Banco_dm.BancoAttributes.Server;
        end;
      6:begin
          sb_Padrao.Panels[i].Text := 'Versão: '+DateTimeToStr(GetFileModDate(Application.ExeName));
        end;
    end;

    if TStatusPanel(sb_Padrao.Panels[i]).Style = psText then
      sb_Padrao.Panels[i].Width := Canvas.TextWidth(sb_Padrao.Panels[i].Text)+20;
  end;
end;

end.
