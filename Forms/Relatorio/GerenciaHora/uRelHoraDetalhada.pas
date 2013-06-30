unit uRelHoraDetalhada;

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
  DB,
  ADODB,
  uUtils,
  QRPrntr,
  ExtCtrls;

type
  Tfm_Rel_Hora_Detalhada = class(Tfm_Rel_Padrao)
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
    QRSubDetail2: TQRSubDetail;
    lb_Total: TQRLabel;
    dt_entrada: TQRDBText;
    dt_saida: TQRDBText;
    ds_dia_semana: TQRDBText;
    qt_tempo: TQRDBText;
    qy_funcionario: TADOQuery;
    qy_horario: TADOQuery;
    qy_total: TADOQuery;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bnd_DetalheAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRSubDetail1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    vDtZebrada:TDate;
    vContador:integer;
    { Private declarations }
  public
    procedure Preview(pDt_Inicial,pDt_Final:TDate;pTipoCalculo:integer);
    { Public declarations }
  end;

var
  fm_Rel_Hora_Detalhada: Tfm_Rel_Hora_Detalhada;

implementation

uses
  uDataModule;

{$R *.dfm}

{ Tfm_Rel_Hora_Detalhada }

procedure Tfm_Rel_Hora_Detalhada.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure Tfm_Rel_Hora_Detalhada.FormCreate(Sender: TObject);
begin
  inherited;
  qy_funcionario.Connection := Banco_dm.Conexao_banco_aco;
  qy_Horario.Connection := Banco_dm.Conexao_banco_aco;
  qy_Total.Connection   := Banco_dm.Conexao_banco_aco;
  vDtZebrada := 0;
  vContador := 1;
end;

procedure Tfm_Rel_Hora_Detalhada.Preview(pDt_Inicial,pDt_Final:TDate;pTipoCalculo:integer);
begin
  try
    case pTipoCalculo of
      0:bnd_Title_Titulo.Caption := bnd_Title_Titulo.Caption+DateToStr(pDt_Inicial)+' até '+DateToStr(pDt_Final);
      1:bnd_Title_Titulo.Caption := bnd_Title_Titulo.Caption+' (Horas Normais) - '+DateToStr(pDt_Inicial)+' até '+DateToStr(pDt_Final);
      2:bnd_Title_Titulo.Caption := bnd_Title_Titulo.Caption+' (Horas Extras) - '+DateToStr(pDt_Inicial)+' até '+DateToStr(pDt_Final);
    end;
    qy_Horario.Active := True;
    qy_funcionario.Close;
    qy_funcionario.Parameters.ParamByName('nm_usuario').Value   := Banco_dm.BancoAttributes.User_ID;
    qy_funcionario.Open;
    Qr_Report.Preview;
  except
    on E:Exception do
      Erro(Self.ClassName,'Preview',E.Message,true,true,E);
  end;
end;

procedure Tfm_Rel_Hora_Detalhada.QRSubDetail1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  vDtLocal:TDate;
begin
  inherited;
  try
    vDtLocal := StrToDate(DateToStr(dt_entrada.DataSet.FieldByName('dt_entrada').AsDateTime));
    if Odd(vContador) then
    begin
      if vDtLocal <> vDtZebrada then
      begin
        inc(vContador);
        QRSubDetail1.color:=clWhite
      end;
    end
    else
    begin
      if vDtLocal <> vDtZebrada then
      begin
        inc(vContador);
        QRSubDetail1.color:=clBtnFace;
      end;
    end;
    vDtZebrada := vDtLocal;
  except
    on E:Exception do
    begin
      Close;
    end;
  end;
end;

procedure Tfm_Rel_Hora_Detalhada.bnd_DetalheAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  try
    qy_Total.Close;
    qy_Total.Parameters.ParamByName('nm_usuario').Value         := Banco_dm.BancoAttributes.User_ID;
    qy_Total.Parameters.ParamByName('nr_seq_funcionario').Value := qy_funcionario.FieldByName('nr_seq_funcionario').AsInteger;
    qy_Total.Open;
    lb_Total.Caption := qy_Total.FieldByName('qt_total').AsString;
  except
    on E:Exception do
      Erro(Self.ClassName,'bnd_DetalheAfterPrint',E.Message,true,true,E);
  end;

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

end.
