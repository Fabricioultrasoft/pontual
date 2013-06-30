unit Threads;

interface

uses
  Classes,
  uEnvioEmail;

type
  TThreadEnvio_Email = class(TThread)
    protected
      procedure Execute;override;
    private
      Email:TEnvioEmail;
    public
      constructor Create(pDestinatarios:TStringList;pAnexo:string);
      destructor Free;
    //published
  end;

type
  TProcessos = class(TThread)
    protected
    private
    public
      constructor Create;
  end;

implementation

uses
  uUtils,
  StrUtils,
  uBackup,
  uDataModule,
  DateUtils,
  uAgendamento_Processo,
  ExtCtrls,
  SysUtils;

{ TThreadEnvio_Email }

constructor TThreadEnvio_Email.Create(pDestinatarios:TStringList;pAnexo:string);
begin
  try
    ChecaAgendamento.Timer.Enabled := false; {pausa thread}
    inherited Create(True);
    //FreeOnTerminate := True;
    Priority := tpLowest;
    Email := TEnvioEmail.Create;
    Email.Destinatarios := pDestinatarios;
    Email.ArquivoAnexo := pAnexo;
    Resume;
  except
    on E:Exception do
      Erro(Self.ClassName,'Create',E.Message,false,true,E);
  end;
end;

procedure TThreadEnvio_Email.Execute;
begin
  inherited;
  try
    if Email.Enviar then
    begin
      //OnTerminate
      Banco_dm.BancoAttributes.Dt_Ult_Envio_Backup := now;
      Terminate;
      LimparDiretorio(Banco_dm.BancoAttributes.PathBackup,'.backup');
      ChecaAgendamento.DefineIntervalo(TimeToStr(time),Banco_dm.BancoAttributes.Hora_Exec_Dump);
      ChecaAgendamento.Timer.Interval := ChecaAgendamento.TimerInterval;
      ChecaAgendamento.Timer.Enabled  := true;
    end;
    //Email.Free;
  except
    on E:Exception do
      Erro(Self.ClassName,'Execute',E.Message,false,true,E);
  end;
end;

destructor TThreadEnvio_Email.Free;
begin
  Email.Free;
end;

{ TProcessos }

constructor TProcessos.Create;
begin
  ObterDataHoraInternet;
end;

end.
