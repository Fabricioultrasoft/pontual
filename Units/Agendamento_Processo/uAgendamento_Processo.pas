unit uAgendamento_Processo;

interface

uses
  Classes,
  uEnvioEmail,
  ExtCtrls,
  SysUtils;

type
  TChecaAgendamento = class
    Timer:TTimer;
    protected
    private
      ListaDestinatario:TStringList;
      FTimerInterval: integer;
    procedure SetTimerInterval(const Value: integer);
    public
      constructor Create;
      destructor Free;
      procedure ExecutarProcessos(Sender:TObject);
      procedure DefineIntervalo(pHora, pHoraAgendada: string);
    //published
      property TimerInterval: integer read FTimerInterval write SetTimerInterval;
  end;

var
  ChecaAgendamento:TChecaAgendamento;

implementation

uses
  uUtils,
  StrUtils,
  uBackup,
  uDataModule,
  DateUtils,
  Threads;


{ TChecaAgendamento }

constructor TChecaAgendamento.Create;
var
  i:integer;
  vStrEmail:string;
begin
  try
    Timer         := TTimer.Create(Nil);
    Timer.Enabled := false;
    Timer.OnTimer := ExecutarProcessos;

    ListaDestinatario := TStringList.Create;

    for i := 0 to StrToIntDef(opcao(Banco_dm.BancoAttributes.Email_Receb_Backup,';',0,'C'),0)-1 do
    begin
      vStrEmail := opcao(Banco_dm.BancoAttributes.Email_Receb_Backup,';',i+1,'T');
      if ValidaEmail(vStrEmail) then
        ListaDestinatario.Add(vStrEmail);
    end;
    if (ListaDestinatario.Count > 0)                    and
       (Banco_dm.BancoAttributes.Hora_Exec_Dump <> '')  and
       (Banco_dm.BancoAttributes.Hora_Exec_Dump <> ':') and
       (Banco_dm.BancoAttributes.Dias_Exec_Dump <> '')  and
       (Banco_dm.BancoAttributes.PathBackup <> '')      and
       (Banco_dm.BancoAttributes.pg_dump_exe <> '')
    then
    begin
      DefineIntervalo(TimeToStr(Time),Banco_dm.BancoAttributes.Hora_Exec_Dump);
      Timer.Interval := TimerInterval;
      Timer.Enabled := true;
    end;
  except
    On E:Exception do
      Erro(Self.ClassName,'Create',E.Message,false,true,E);
  end;
end;

procedure TChecaAgendamento.ExecutarProcessos(Sender:TObject);
var
  vExtracaoBD:TExtracaoBD;
begin
  try
    if  (Banco_dm.BancoAttributes.Dt_Ult_Envio_Backup < Date) and
        (pos(IntToStr(Dia_Semana(now)),Banco_dm.BancoAttributes.Dias_Exec_Dump) > 0) and
        (Time >= StrToTime(Banco_dm.BancoAttributes.Hora_Exec_Dump))
    then
    begin
      try
        vExtracaoBD := TExtracaoBD.Create;
        vExtracaoBD.Dir_Destino := Banco_dm.BancoAttributes.PathBackup;
        vExtracaoBD.Dir_Pg_Dump := Banco_dm.BancoAttributes.pg_dump_exe;
        vExtracaoBD.Usuario     := Banco_dm.BancoAttributes.User_Admin;
        vExtracaoBD.Senha       := Banco_dm.BancoAttributes.Pass_Admin;
        vExtracaoBD.IP_Servidor := Banco_dm.BancoAttributes.Server;
        vExtracaoBD.DataBase    := Banco_dm.BancoAttributes.Database;
        vExtracaoBD.Extrair(TECompleto,false);
        Zip(vExtracaoBD.GetNm_ArquivoDumpGerado+'.zipado',vExtracaoBD.GetNm_ArquivoDumpGerado,false);
        TThreadEnvio_Email.Create(ListaDestinatario,vExtracaoBD.GetNm_ArquivoDumpGerado+'.zipado');
      finally
        vExtracaoBD.Free;
      end;
    end;
  except
    on E:Exception do
      Erro(Self.ClassName,'ExecutarProcessos',E.Message,false,true,E);
  end;
end;

destructor TChecaAgendamento.Free;
begin
  ListaDestinatario.Free;
  Timer.Enabled := false;
  sleep(500);
  Timer.Free;
end;

procedure TChecaAgendamento.DefineIntervalo(pHora, pHoraAgendada: string);
var
  dt1,dt2:TDateTime;
begin
  try
    {Entao ja era pra ter executado}
    if (StrToTime(pHora) >= StrToTime(pHoraAgendada))         and
       (Banco_dm.BancoAttributes.Dt_Ult_Envio_Backup < Date)  and
       (pos(IntToStr(Dia_Semana(now)),Banco_dm.BancoAttributes.Dias_Exec_Dump) > 0)
    then
      TimerInterval := 1000
    else
    {Ainda nao chegou a hora, mas é o dia}
    if (StrToTime(pHora) < StrToTime(pHoraAgendada))         and
       (Banco_dm.BancoAttributes.Dt_Ult_Envio_Backup < Date)  and
       (pos(IntToStr(Dia_Semana(now)),Banco_dm.BancoAttributes.Dias_Exec_Dump) > 0)
    then
      TimerInterval := (TimeToSeconds(pHoraAgendada) - TimeToSeconds(pHora)*1000)
    else
    {Ja foi enviado backup no dia, entao calcular a diferença entre a data/hora atual e o proximo dia na hora agendada}
    if (Banco_dm.BancoAttributes.Dt_Ult_Envio_Backup >= Date) then
    begin
      dt1 := StrToDateTime(datetostr(date)+' '+TimeToStr(now));
      if StrToInt(FormatDateTime('yyyy',Banco_dm.BancoAttributes.Dt_Ult_Envio_Backup)) < 1900 then
        dt2 := StrToDateTime(DateToStr(Date-1)+' '+Banco_dm.BancoAttributes.Hora_Exec_Dump)
      else
        dt2 := StrToDateTime(DateToStr(Banco_dm.BancoAttributes.Dt_Ult_Envio_Backup+1)+' '+Banco_dm.BancoAttributes.Hora_Exec_Dump);
      TimerInterval := DateDiffSec(dt1,dt2)*1000;
    end;
  except
    on E:Exception do
      Erro(Self.ClassName,'DefineIntervalo',E.Message,false,true,E);
  end;
end;

procedure TChecaAgendamento.SetTimerInterval(const Value: integer);
begin
  FTimerInterval := Value;
end;

end.
