unit uRelFuncionario;

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
  uRelPadrao,
  QuickRpt,
  QRCtrls,
  ExtCtrls,
  uCadastro_Funcionario,
  DB,
  ADODB;

type
  Tfm_Rel_Funcionario = class(Tfm_Rel_Padrao)
    QRLabel1: TQRLabel;
    QRLabel3: TQRLabel;
    bnd_Detalhe: TQRBand;
    nr_sequencia: TQRDBText;
    nm_funcionario: TQRDBText;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    procedure Preview(qy:TADOQuery);
    { Public declarations }
  end;

var
  fm_Rel_Funcionario: Tfm_Rel_Funcionario;

implementation

{$R *.dfm}

procedure Tfm_Rel_Funcionario.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure Tfm_Rel_Funcionario.Preview;
begin
  Qr_Report.Preview;
end;

end.
