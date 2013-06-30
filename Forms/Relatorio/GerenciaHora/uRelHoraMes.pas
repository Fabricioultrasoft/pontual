unit uRelHoraMes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uRelPadrao, QuickRpt, QRCtrls, ExtCtrls, DB, ADODB, uDataModule;

type
  Tfm_Rel_Hora_Mes = class(Tfm_Rel_Padrao)
    QRLabel1: TQRLabel;
    QRLabel4: TQRLabel;
    bnd_Detalhe: TQRBand;
    nm_funcionario: TQRDBText;
    nr_seq_funcionario: TQRDBText;
    ChildBand1: TQRChildBand;
    QRLabel2: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel3: TQRLabel;
    QRSubDetail1: TQRSubDetail;
    QRDBText2: TQRDBText;
    dt_saida: TQRDBText;
    ds_dia_semana: TQRDBText;
    qt_tempo: TQRDBText;
    qy_funcionario: TADOQuery;
    ds_funcionario: TDataSource;
    qy_horario: TADOQuery;
    ds_horario: TDataSource;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure bnd_DetalheAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
  private
    { Private declarations }
  public
    procedure Preview(pDt_Inicial,pDt_Final:TDate;pTipoCalculo:integer);
    { Public declarations }
  end;

var
  fm_Rel_Hora_Mes: Tfm_Rel_Hora_Mes;

implementation

uses
  uUtils;

{$R *.dfm}

{ Tfm_Rel_Hora_Mes }

procedure Tfm_Rel_Hora_Mes.FormCreate(Sender: TObject);
begin
  inherited;
  qy_funcionario.Connection := Banco_dm.Conexao_banco_aco;
  qy_Horario.Connection := Banco_dm.Conexao_banco_aco;
end;

procedure Tfm_Rel_Hora_Mes.Preview(pDt_Inicial,pDt_Final:TDate;pTipoCalculo:integer);
begin
  case pTipoCalculo of
    0:bnd_Title_Titulo.Caption := bnd_Title_Titulo.Caption+DateToStr(pDt_Inicial)+' até '+DateToStr(pDt_Final);
    1:bnd_Title_Titulo.Caption := bnd_Title_Titulo.Caption+' (Horas Normais) - '+DateToStr(pDt_Inicial)+' até '+DateToStr(pDt_Final);
    2:bnd_Title_Titulo.Caption := bnd_Title_Titulo.Caption+' (Horas Extras) - '+DateToStr(pDt_Inicial)+' até '+DateToStr(pDt_Final);
  end;
  qy_Horario.Active := True;
  qy_funcionario.Close;
  qy_funcionario.Parameters.ParamByName('nm_usuario').Value := Banco_dm.BancoAttributes.User_ID;
  qy_funcionario.Open;
  Qr_Report.Preview;
end;

procedure Tfm_Rel_Hora_Mes.bnd_DetalheAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  inherited;
  try
    qy_Horario.Close;
    qy_Horario.Parameters.ParamByName('nm_usuario').Value         := Banco_dm.BancoAttributes.User_ID;
    qy_Horario.Parameters.ParamByName('nr_seq_funcionario').Value := qy_funcionario.FieldByName('nr_seq_funcionario').AsInteger;
    qy_Horario.Open;
  except
    on E:Exception do
      Erro(Self.ClassName,'bnd_DetalheAfterPrint',E.Message,true,true,E);
  end;
end;

procedure Tfm_Rel_Hora_Mes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  action := caFree;
end;

end.
