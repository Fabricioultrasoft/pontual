program Pontual;

uses
  Forms,
  SysUtils,
  StrUtils,
  uLogin in 'Forms\fmLogin\uLogin.pas' {Login_fm},
  uDataModule in 'DataModule\uDataModule.pas' {Banco_dm: TDataModule},
  uPadrao in 'Forms\Padrao\uPadrao.pas' {fm_Padrao},
  uConfiguracoes in 'Forms\fmConfiguracoes\uConfiguracoes.pas' {fm_Configuracoes},
  uPesquisa_Padrao in 'Forms\fmPesquisa_Padrao\uPesquisa_Padrao.pas' {fm_Pesquisa_Padrao},
  uCadastro_Usuario in 'Forms\fmCadastroUsuario\uCadastro_Usuario.pas' {fm_Cadastro_Usuario},
  uRotinas_Nitgen in 'Utils\uRotinas_Nitgen.pas',
  uMensagem in 'Forms\fmMensagem\uMensagem.pas' {fm_Mensagem},
  uPrincipal in 'Forms\fmPrincipal\uPrincipal.pas',
  uGerenciaHorario in 'Forms\fmGerenciaHorario\uGerenciaHorario.pas' {fm_Gerencia_Horario},
  uBatidaPonto in 'Forms\fmBatidaPonto\uBatidaPonto.pas' {fm_Batida_Ponto},
  uRelPadrao in 'Forms\Relatorio\Padrao\uRelPadrao.pas' {fm_Rel_Padrao},
  uRelFuncionario in 'Forms\Relatorio\Funcionario\uRelFuncionario.pas' {fm_Rel_Funcionario},
  uRelHoraDetalhada in 'Forms\Relatorio\GerenciaHora\uRelHoraDetalhada.pas' {fm_Rel_Hora_Detalhada},
  uUtils in 'Utils\uUtils.pas',
  uVarGlobal in 'Utils\uVarGlobal.pas',
  uManipulacaoDados in 'Units\ManipulacaoDados\uManipulacaoDados.pas',
  uBackup in 'Units\Backup\uBackup.pas' {fm_Rel_Hora_Dia},
  uModificacao in 'Forms\fmModificacao\uModificacao.pas' {fmModificacao},
  uCadTurno in 'Forms\fmCadTurno\uCadTurno.pas' {fm_Cad_Turno},
  uFeriado in 'Forms\fmFeriado\uFeriado.pas' {fm_Cadastro_Feriado},
  uCadastro_Funcionario in 'Forms\fmCadastroFuncionario\uCadastro_Funcionario.pas' {fm_Cadastro_Funcionario},
  uRelHoraMes in 'Forms\Relatorio\GerenciaHora\uRelHoraMes.pas' {fm_Rel_Hora_Mes},
  uEnvioEmail in 'Units\EnvioEmail\uEnvioEmail.pas',
  uAgendamento_Processo in 'Units\Agendamento_Processo\uAgendamento_Processo.pas',
  uGeradorEntradaLote in 'Forms\fmGeradorEntradaLote\uGeradorEntradaLote.pas' {fm_Gerador_Entrada_Lote},
  Focus in '..\..\..\Componentes\Focus\Focus.pas',
  qrprev in 'Forms\Relatorio\Padrao\qrprev.pas',
  uUtilsDatabase in 'Utils\uUtilsDatabase.pas',
  Threads in 'Units\Threads\Threads.pas';

{$R *.res}
begin
  try
    Application.Initialize;

//    if Obter_Valor_Registro(HKEY_CURRENT_USER,'Control Panel\Desktop','MainCPL') <> 'c:\Windows\System' then
//      if InputBox(dfdfuhdfhfdhhjdsfk,'','') <> dfsjfdsjdfsjdfdf then
//        Encerrar
//      else
//        Gravar_Valor_Registro(HKEY_CURRENT_USER,'Control Panel\Desktop\','MainCPL',rdString,'c:\Windows\System','ADD');

    SetarParametroRegiao;
    Application.MainFormOnTaskBar := false;
    g_VarDiretorioExecutavel      := IncludeTrailingPathDelimiter(ExtractFilePath(Application.ExeName));

    Application.CreateForm(TBanco_dm, Banco_dm);
    if (Banco_dm.BancoAttributes.Abrir_Configuracoes = 'S') then
    begin
      fm_Configuracoes := Tfm_Configuracoes.Create(Application);
      fm_Configuracoes.ShowModal;
      Banco_dm.BancoAttributes.Abrir_Configuracoes := 'N';
      Encerrar;
    end;

    case AnsiIndexStr(Banco_dm.BancoAttributes.ModoConexao,['F','G']) of
      0:begin {Funcionario}
          if Banco_dm.Conectado(Banco_dm.BancoAttributes.User_Admin,Banco_dm.BancoAttributes.Pass_Admin) then
          begin
            Application.CreateForm(Tfm_Batida_Ponto, fm_Batida_Ponto);
            ChecaAgendamento := TChecaAgendamento.Create;
          end
          else
            Application.CreateForm(Tfm_Configuracoes, fm_Configuracoes);
        end;
      1:begin {Gerência}
          //Login_fm.ExibirLogin('N');
          if Banco_dm.Conectado('postgres','re94085') then
          //if Banco_dm.BancoAttributes.Conectado then
          begin
            Banco_dm.BancoAttributes.Database   := Busca_Valor_Fixo('select current_database() as database');
            Banco_dm.BancoAttributes.SuperUser  := Busca_Valor('pg_roles','rolcreaterole','rolname',QuotedStr(Obter_Usuario_Ativo));
            Application.CreateForm(Tfm_Principal, fm_Principal);
          end;
        end;
    end;

    if Banco_dm.BancoAttributes.Conectado then
    begin
      if Banco_dm.BancoAttributes.SuperUser then
        ExecutarManutencaoBanco;
    end;

    Application.Run;
    Banco_dm.BancoAttributes.Free;
    if (ChecaAgendamento <> Nil) and (Assigned(ChecaAgendamento)) then
      ChecaAgendamento.Free;
  except
    on E:Exception do
      Erro('Instância Inicial','program',E.Message,True,True,E);
  end;
end.


