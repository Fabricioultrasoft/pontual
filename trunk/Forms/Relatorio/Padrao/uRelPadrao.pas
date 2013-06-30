unit uRelPadrao;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  Qrctrls,
  quickrpt,
  ExtCtrls,
  QRPrntr;
type
  Tfm_Rel_Padrao = class(TForm)
    Qr_Report: TQuickRep;
    QRDBText1: TQRDBText;
    bnd_Title: TQRBand;
    bnd_Title_Titulo: TQRLabel;
    bnd_Caption: TQRChildBand;
    QRBand1: TQRBand;
    bnd_Footer_Lb_Data: TQRLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fm_Rel_Padrao: Tfm_Rel_Padrao;

implementation

{$R *.DFM}

procedure Tfm_Rel_Padrao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure Tfm_Rel_Padrao.FormCreate(Sender: TObject);
begin
  //lb_Relatorio.Caption := Sender.ClassName;
  bnd_Footer_Lb_Data.Caption := 'Impressão: '+DateTimeToStr(now);
end;

end.
