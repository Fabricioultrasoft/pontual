unit uManipulacaoDados;

interface

uses
  uUtils,
  uDataModule,
  AdoDB,
  Classes,
  SySUtils,
  Forms,
  Windows,
  rtti,
  TypInfo,
  Dialogs,
  Variants,
  StrUtils,


  DB;

const
  cDataType : array[0..7] of string = ('boolean'  ,{0}
                                       'tdatetime',{1}
                                       'tdate'    ,{2}
                                       'ttime'    ,{3}
                                       'string'   ,{4}
                                       'integer'  ,{5}
                                       'cardinal' ,{6}
                                       'byte');    {7}

type
  TManipConsulta = class(TObject)
  Query: TADOQuery;
  published
  private
    function GetTabela: string; virtual;
  published
    constructor Create;
    destructor Free;
  public
    function Gravar: boolean; virtual;
    procedure Select(pNr_Sequencia: cardinal); virtual;
    function Deletar(pNr_Sequencia: cardinal): boolean;
    function Anterior(pNr_Sequencia: cardinal): cardinal;
    function Proximo(pNr_Sequencia: cardinal): cardinal;
    function Ultimo: cardinal;
    function Primeiro: cardinal;
  end;

  TFuncionario = class(TManipConsulta)
  const
    Nm_Tabela = 'funcionario';
  private
    FNr_Sequencia: cardinal;
    FNm_Funcionario: string;
    FNm_Usuario_Criacao: string;
    FNm_Usuario_Atualizacao: string;
    FDt_Atualizacao: TDateTime;
    FDt_Criacao: TDateTime;
    FNr_Seq_Cidade: cardinal;
    FIe_Inativo: string;
    FNr_Seq_Turno: cardinal;
    FDs_endereco: string;
    FNr_Tel_Residencial: string;
    FNr_Tel_Celular: string;
    procedure SetNr_Sequencia(const Value: cardinal);
    procedure SetNm_Funcionario(const Value: string);
    procedure SetNm_Usuario_Criacao(const Value: string);
    procedure SetNm_Usuario_Atualizacao(const Value: string);
    procedure SetDt_Atualizacao(const Value: TDateTime);
    procedure SetDt_Criacao(const Value: TDateTime);
    procedure SetNr_Seq_Cidade(const Value: cardinal);
    procedure SetIe_Inativo(const Value: string);
    procedure SetNr_Seq_Turno(const Value: cardinal);
    procedure SetDs_endereco(const Value: string);
    procedure SetNr_Tel_Residencial(const Value: string);
    procedure SetNr_Tel_Celular(const Value: string);
  public
    function GetTabela: string; override;
    constructor Create;
    destructor Free;
  published
    property Nr_Sequencia: cardinal Read FNr_Sequencia Write SetNr_Sequencia
      default 0;
    property Nm_Funcionario: string Read FNm_Funcionario
      Write SetNm_Funcionario;
    property Nm_Usuario_Criacao: string Read FNm_Usuario_Criacao
      Write SetNm_Usuario_Criacao;
    property Nm_Usuario_Atualizacao: string Read FNm_Usuario_Atualizacao
      Write SetNm_Usuario_Atualizacao;
    property Dt_Criacao: TDateTime Read FDt_Criacao Write SetDt_Criacao;
    property Dt_Atualizacao: TDateTime Read FDt_Atualizacao
      Write SetDt_Atualizacao;
    property Nr_Seq_Cidade: cardinal Read FNr_Seq_Cidade Write SetNr_Seq_Cidade;
    property Nr_Seq_Turno: cardinal Read FNr_Seq_Turno Write SetNr_Seq_Turno;
    property Ie_Inativo: string Read FIe_Inativo Write SetIe_Inativo;
    property Ds_endereco: string Read FDs_endereco Write SetDs_endereco;
    property Nr_Tel_Residencial: string Read FNr_Tel_Residencial
      Write SetNr_Tel_Residencial;
    property Nr_Tel_Celular: string Read FNr_Tel_Celular
      Write SetNr_Tel_Celular;
  end;

  TFuncionario_Ponto = class(TManipConsulta)
  const
    Nm_Tabela = 'funcionario_ponto';
  private
    FNr_Sequencia: cardinal;
    FDt_Atualizacao: TDateTime;
    Fdt_batida: TDateTime;
    Fnr_seq_funcionario: cardinal;
    FNm_Usuario_Criacao: string;
    FNm_Usuario_Atualizacao: string;
    FDt_Criacao: TDateTime;
    Fie_desconsiderar_forcar_entrada_turno: boolean;
    procedure SetDt_Atualizacao(const Value: TDateTime);
    procedure SetDt_batida(const Value: TDateTime);
    procedure SetDt_Criacao(const Value: TDateTime);
    procedure SetNm_Usuario_Atualizacao(const Value: string);
    procedure SetNm_Usuario_Criacao(const Value: string);
    procedure SetNr_seq_funcionario(const Value: cardinal);
    procedure SetNr_Sequencia(const Value: cardinal);
    procedure Setie_desconsiderar_forcar_entrada_turno(const Value: boolean);
  public
    function GetTabela: string; override;
    constructor Create;
    destructor Free;
  published
    property Nr_Sequencia: cardinal Read FNr_Sequencia Write SetNr_Sequencia
      default 0;
    property nr_seq_funcionario: cardinal Read Fnr_seq_funcionario
      Write SetNr_seq_funcionario;
    property dt_batida: TDateTime Read Fdt_batida Write SetDt_batida;
    property Nm_Usuario_Criacao: string Read FNm_Usuario_Criacao
      Write SetNm_Usuario_Criacao;
    property Dt_Criacao: TDateTime Read FDt_Criacao Write SetDt_Criacao;
    property Nm_Usuario_Atualizacao: string Read FNm_Usuario_Atualizacao
      Write SetNm_Usuario_Atualizacao;
    property Dt_Atualizacao: TDateTime Read FDt_Atualizacao
      Write SetDt_Atualizacao;
    property ie_desconsiderar_forcar_entrada_turno: boolean
      Read Fie_desconsiderar_forcar_entrada_turno
      Write Setie_desconsiderar_forcar_entrada_turno;
  end;

  TTurno = class(TManipConsulta)
  const
    Nm_Tabela = 'turno';
  private
    FNr_Sequencia: cardinal;
    FDs_Turno: string;
    FIe_quarta_feira: boolean;
    FHr_Final: string;
    FHr_Inicial: string;
    FIe_sexta_feira: boolean;
    FIe_quinta_feira: boolean;
    Fqt_tempo_desconto_dia: string;
    FIe_segunda_feira: boolean;
    FIe_terca_feira: boolean;
    FIe_sabado: boolean;
    FIe_domingo: boolean;
    FDt_Atualizacao: TDateTime;
    FNm_Usuario_Criacao: string;
    FNm_Usuario_Atualizacao: string;
    FDt_Criacao: TDateTime;
    Fqt_tempo_desconto_intervalo: string;
    procedure SetNr_Sequencia(const Value: cardinal);
    procedure SetDs_Turno(const Value: string);
    procedure SetHr_Final(const Value: string);
    procedure SetHr_Inicial(const Value: string);
    procedure SetIe_quarta_feira(const Value: boolean);
    procedure SetIe_quinta_feira(const Value: boolean);
    procedure SetIe_segunda_feira(const Value: boolean);
    procedure SetIe_sexta_feira(const Value: boolean);
    procedure SetIe_terca_feira(const Value: boolean);
    procedure SetIe_domingo(const Value: boolean);
    procedure SetIe_sabado(const Value: boolean);
    procedure SetDt_Atualizacao(const Value: TDateTime);
    procedure SetDt_Criacao(const Value: TDateTime);
    procedure SetNm_Usuario_Atualizacao(const Value: string);
    procedure SetNm_Usuario_Criacao(const Value: string);
    procedure Setqt_tempo_desconto_dia(const Value: string);
    procedure Setqt_tempo_desconto_intervalo(const Value: string);
  public
    function GetTabela: string; override;
    constructor Create;
    destructor Free;
  published
    property Nr_Sequencia: cardinal Read FNr_Sequencia Write SetNr_Sequencia default 0;
    property Ds_Turno: string read FDs_Turno write SetDs_Turno;
    property Qt_tempo_desconto_dia: string read Fqt_tempo_desconto_dia write Setqt_tempo_desconto_dia;
    property Hr_Inicial: string read FHr_Inicial write SetHr_Inicial;
    property Hr_Final: string read FHr_Final write SetHr_Final;
    property Ie_segunda_feira: boolean read FIe_segunda_feira write SetIe_segunda_feira;
    property Ie_terca_feira: boolean read FIe_terca_feira write SetIe_terca_feira;
    property Ie_quarta_feira: boolean read FIe_quarta_feira write SetIe_quarta_feira;
    property Ie_quinta_feira: boolean read FIe_quinta_feira write SetIe_quinta_feira;
    property Ie_sexta_feira: boolean read FIe_sexta_feira write SetIe_sexta_feira;
    property Ie_sabado: boolean read FIe_sabado write SetIe_sabado;
    property Ie_domingo: boolean read FIe_domingo write SetIe_domingo;
    property Nm_Usuario_Criacao: string Read FNm_Usuario_Criacao Write SetNm_Usuario_Criacao;
    property Dt_Criacao: TDateTime Read FDt_Criacao Write SetDt_Criacao;
    property Nm_Usuario_Atualizacao: string Read FNm_Usuario_Atualizacao Write SetNm_Usuario_Atualizacao;
    property Dt_Atualizacao: TDateTime Read FDt_Atualizacao Write SetDt_Atualizacao;
    property qt_tempo_desconto_intervalo: string read Fqt_tempo_desconto_intervalo write Setqt_tempo_desconto_intervalo;
  end;

  TUsuario = class(TManipConsulta)
  const
    Nm_Tabela = 'vw_usuario';
  private
    FNr_Sequencia: cardinal;
    FNm_Usuario: string;
    Fie_super_user: string;
    Fie_permite_criar_usuario: string;
    Fie_permite_logar: string;
    procedure SetNr_Sequencia(const Value: cardinal);
    procedure SetNm_Usuario(const Value: string);
    procedure Setie_permite_criar_usuario(const Value: string);
    procedure Setie_permite_logar(const Value: string);
    procedure Setie_super_user(const Value: string);
  public
    function GetTabela: string; override;
    constructor Create;
    destructor Free;
  published
    property Nr_Sequencia: cardinal Read FNr_Sequencia Write SetNr_Sequencia default 0;
    property Nm_Usuario: string Read FNm_Usuario Write SetNm_Usuario;
    property ie_permite_criar_usuario: string Read Fie_permite_criar_usuario Write Setie_permite_criar_usuario;
  end;

  TFeriado = class(TManipConsulta)
  const
    Nm_Tabela = 'feriado';
  private
    FNr_Sequencia: cardinal;
    FDs_Deriado: string;
    FNm_Usuario_Criacao: string;
    FNm_Usuario_Atualizacao: string;
    FDt_Atualizacao: TDateTime;
    FDt_Criacao: TDateTime;
    Fnr_dia: Byte;
    Fnr_mes: Byte;
    Fnr_ano: cardinal;
    procedure SetNr_Sequencia(const Value: cardinal);
    procedure SetDs_Deriado(const Value: string);
    procedure SetNm_Usuario_Criacao(const Value: string);
    procedure SetNm_Usuario_Atualizacao(const Value: string);
    procedure SetDt_Atualizacao(const Value: TDateTime);
    procedure SetDt_Criacao(const Value: TDateTime);
    procedure Setnr_dia(const Value: Byte);
    procedure Setnr_mes(const Value: Byte);
    procedure Setnr_ano(const Value: cardinal);
  public
    function GetTabela: string; override;
    constructor Create;
    destructor Free;
  published
    property Nr_Sequencia: cardinal read FNr_Sequencia write SetNr_Sequencia default 0;
    property ds_feriado: string read FDs_Deriado write SetDs_Deriado;
    property Nm_Usuario_Criacao: string read FNm_Usuario_Criacao write SetNm_Usuario_Criacao;
    property Nm_Usuario_Atualizacao: string read FNm_Usuario_Atualizacao write SetNm_Usuario_Atualizacao;
    property Dt_Criacao: TDateTime read FDt_Criacao write SetDt_Criacao;
    property Dt_Atualizacao: TDateTime read FDt_Atualizacao write SetDt_Atualizacao;
    property nr_dia: Byte read Fnr_dia write Setnr_dia;
    property nr_mes: Byte read Fnr_mes write Setnr_mes;
    property nr_ano: cardinal read Fnr_ano write Setnr_ano;
  end;

implementation

{ ========================================= TManipConsulta ================================== }

constructor TManipConsulta.Create;
begin
  try
    if not Assigned(Query) then
    begin
      Query := TADOQuery.Create(Nil);
      Query.Connection := Banco_dm.Conexao_banco_aco;
    end;
  except
    on E: Exception do
      Erro(Self.ClassName, 'Create', E.Message, true, true, E);
  end;
end;

destructor TManipConsulta.Free;
begin
  try
    if Assigned(Query) then
    begin
      FreeAndNil(Query);
    end;
  except
    on E: Exception do
      Erro(Self.ClassName, 'Free', E.Message, true, true, E);
  end;
end;

function TManipConsulta.Deletar(pNr_Sequencia: cardinal): boolean;
begin
  result := false;
  try
    if pNr_Sequencia = 0 then
    begin
      uUtils.MessageBox('Não foi informado um registro a ser excluído',mExclamation,bmOk);
      result := false;
      exit;
    end;

    Query.SQL.Clear;
    Query.Close;
    Query.SQL.Add('delete from ' + GetTabela + ' where nr_sequencia = ' + IntToStr(pNr_Sequencia));
    Query.ExecSQL;

    result := Query.RowsAffected > 0;

    if not result then
      uUtils.Messagebox('Exclusão não processsada',mExclamation,bmOk);
  except
    on E: Exception do
    begin
      Erro(Self.ClassName,'Deletar',E.Message, true, true, E);
    end;
  end;
end;

function TManipConsulta.GetTabela: string;
begin

end;

function TManipConsulta.Gravar: boolean;
  procedure DefineValores(pPropInfo: pPropInfo; var pvData: string;var pvValorAtributo: Variant);
  begin
    case AnsiIndexStr(LowerCase(pPropInfo.PropType^.Name),cDataType) of
      0:
        begin
          pvValorAtributo := GetPropValue(Self, pPropInfo.Name);
        end;
      1, 2:
        begin
          pvData := DateTimeToStrNull(DateTimeToStr(VarToDateTime(VarToStr(GetPropValue(Self,pPropInfo.Name)))));
          if pvData = 'null' then
            pvValorAtributo := pvData
          else
            pvValorAtributo := QuotedStr(pvData);
        end;
      3, 4:
        begin
          pvValorAtributo := QuotedStr(VarToStr(GetPropValue(Self, pPropInfo.Name)));
          if Length(VarToStr(pvValorAtributo)) < 3 then
            pvValorAtributo := 'null';
        end;
      5 .. 7:
        begin
          pvValorAtributo := IntToNull(VarToStr(GetPropValue(Self, pPropInfo.Name)))
        end;
    end;
  end;

var
  PropertyList: PPropList;
  PropInfo: pPropInfo;
  vCount: integer;
  i: integer;
  vValorAtributo: Variant;
  bInserindo: boolean;
  vVirgula, vData: string;
  bEncontrouSequencia: boolean;
begin

  result := false; { RESULT = SE CONSEGUIU ATUALIZAR/INSERIR... }
  bInserindo := false;
  PropInfo := nil;
  bEncontrouSequencia := false;
  try
    try
      vCount := GetPropList(Self, PropertyList);

      Query.SQL.Clear;
      Query.Close;

      { Montando cabeçalho da query de acordo com tipo de processo (INSERT,UPDATE) }
      for i := 0 to vCount - 1 do
      begin
        PropInfo := pPropInfo(PropertyList[i]);
        if LowerCase(PropInfo.Name) = 'nr_sequencia' then
        begin
          bInserindo := VarToStr(GetPropValue(Self, PropInfo.Name)) = '0';
          { INSERT }
          if bInserindo then
            Query.SQL.Add('insert into ' + GetTabela + ' (')
          else
            Query.SQL.Add('update ' + GetTabela + ' set');
          break;
        end;
      end;

      if bInserindo then
      begin
        for i := 0 to vCount - 1 do
        begin
          PropInfo := pPropInfo(PropertyList[i]);
          if LowerCase(PropInfo.Name) <> 'nr_sequencia' then
          begin
            if i < vCount - 1 then
              vVirgula := ','
            else
              vVirgula := ')';
            Query.SQL.Add(PropInfo.Name + vVirgula); { NOME DO CAMPO }
          end;
        end;

        Query.SQL.Add('values ('); { FECHA DECLARAÇÃO DOS CAMPOS }

        for i := 0 to vCount - 1 do
        begin
          PropInfo := pPropInfo(PropertyList[i]);
          if LowerCase(PropInfo.Name) <> 'nr_sequencia' then
          begin
            DefineValores(PropInfo, vData, vValorAtributo);
            if i < vCount - 1 then
              vVirgula := ','
            else
              vVirgula := ')';

            Query.SQL.Add(vValorAtributo + vVirgula);
          end;
        end;
      end
      else
      begin
        for i := 0 to vCount - 1 do
        begin
          PropInfo := PropertyList[i];
          if LowerCase(PropInfo.Name) <> 'nr_sequencia' then
          begin
            DefineValores(PropInfo, vData, vValorAtributo);
            if i < vCount - 1 then
              vVirgula := ','
            else
              vVirgula := '';
            Query.SQL.Add(PropInfo.Name + '=' + vValorAtributo + vVirgula);
          end;
        end;
        for i := 0 to vCount - 1 do
        begin
          PropInfo := PropertyList[i];
          if LowerCase(PropInfo.Name) = 'nr_sequencia' then
          begin
            bEncontrouSequencia := true;
            Query.SQL.Add('where nr_sequencia = ' + VarToStr(GetPropValue(Self,PropInfo.Name)));
            break;
          end;

          if not bEncontrouSequencia then
          begin
            uUtils.MessageBox('Sistema não pôde concluir essa transação para evitar danos às informações, chame o administrador',mExclamation,bmOK);
            FreeMem(PropertyList);
            exit;
          end;
        end;
      end;

      Query.ExecSQL;

      if Query.RowsAffected = 0 then
        uUtils.MessageBox('Código inexistente',mExclamation,bmOK)
      else
        result := true;
    finally
      FreeMem(PropertyList);
      vValorAtributo := 0;
    end;
  except
    on E: Exception do
      Erro(Self.ClassName, 'Gravar', E.Message, true, true, E);
  end;
end;

procedure TManipConsulta.Select(pNr_Sequencia: cardinal);
var
  vCount: integer;
  i: integer;
  PropertyList: PPropList;
  PropInfo: pPropInfo;
  vValor: Variant;
begin
  try
    Try
      { ROTINA QUE CARREGA OS DADOS DO BANCO E POPULA AS PROPERTIES DA CLASSE }
      vCount := GetPropList(Self, PropertyList);
      Query.SQL.Clear;
      Query.Close;
      Query.SQL.Add('SELECT * FROM  ' + GetTabela);
      Query.SQL.Add('WHERE  NR_SEQUENCIA = ' + IntToStr(pNr_Sequencia));
      Query.Open;
      Query.First;

      for i := 0 to vCount - 1 do
      begin
        PropInfo := PropertyList[i];
        vValor := Query.FieldByName(PropInfo.Name).Value;

        case AnsiIndexStr(LowerCase(PropInfo.PropType^.Name),cDataType) of
//    cDataType : array[0..7] of string = ('boolean'  ,{0}
//                                         'tdatetime',{1}
//                                         'tdate'    ,{2}
//                                         'ttime'    ,{3}//
//                                         'string'   ,{4}//
//                                         'integer'  ,{5}
//                                         'cardinal' ,{6}
//                                         'byte');    {7}
          //['','','', '', '', '']) of
          0:
            begin
              vValor := Query.FieldByName(PropInfo.Name).Value = '1';
            end;
          1,2,5,6,7:
            begin
              if VarToStr(vValor) = '' then
                vValor := '0';
            end;
        end;

        SetPropValue(Self, PropInfo.Name, vValor);
      end;
    Finally
      FreeMem(PropertyList);
      vValor := 0;
    End;
  except
    on E: Exception do
      Erro(Self.ClassName, 'Select', E.Message, true, true, E);
  end;
end;

function TManipConsulta.Primeiro: cardinal;
begin
  result := 0;
  try
    Query.SQL.Clear;
    Query.Close;
    Query.SQL.Add('select nr_sequencia min');
    Query.SQL.Add('from	  ' + GetTabela);
    Query.SQL.Add('order by nr_sequencia');
    Query.SQL.Add('limit 1');
    Query.Open;
    Query.First;
    if not Query.IsEmpty then
      result := Query.FieldByName('min').AsInteger;
  except
    on E: Exception do
      Erro(Self.ClassName, 'Primeiro', E.Message, true, true, E);
  end;
end;

function TManipConsulta.Anterior(pNr_Sequencia: cardinal): cardinal;
begin
  result := 0;
  try
    Query.SQL.Clear;
    Query.Close;
    Query.SQL.Add('select nr_sequencia anterior');
    Query.SQL.Add('from	  ' + GetTabela);
    Query.SQL.Add('where  nr_sequencia < ' + IntToStr(pNr_Sequencia));
    Query.SQL.Add('order by nr_sequencia desc');
    Query.SQL.Add('limit 1');
    Query.Open;
    Query.First;
    if (not Query.IsEmpty) and (Query.FieldByName('ANTERIOR').AsInteger
      > 0) then
      result := Query.FieldByName('ANTERIOR').AsInteger
    else
      result := Primeiro;
  except
    on E: Exception do
      Erro(Self.ClassName, 'Anterior', E.Message, true, true, E);
  end;
end;

function TManipConsulta.Proximo(pNr_Sequencia: cardinal): cardinal;
begin
  result := 0;
  try
    Query.SQL.Clear;
    Query.Close;
    Query.SQL.Add('select nr_sequencia proximo');
    Query.SQL.Add('from	  ' + GetTabela);
    Query.SQL.Add('where  nr_sequencia > ' + IntToStr(pNr_Sequencia));
    Query.SQL.Add('order by nr_sequencia ');
    Query.SQL.Add('Limit 1 ');
    Query.Open;
    Query.First;
    if (not Query.IsEmpty) and (Query.FieldByName('PROXIMO').AsInteger > 0) then
      result := Query.FieldByName('PROXIMO').AsInteger
    else
      result := Ultimo;
  except
    on E: Exception do
      Erro(Self.ClassName, 'Proximo', E.Message, true, true, E);
  end;
end;

function TManipConsulta.Ultimo: cardinal;
begin
  result := 0;
  try
    Query.SQL.Clear;
    Query.Close;
    Query.SQL.Add('select nr_sequencia max');
    Query.SQL.Add('from	  ' + GetTabela);
    Query.SQL.Add('order by nr_sequencia desc');
    Query.SQL.Add('limit 1');

    Query.Open;
    Query.First;
    if not Query.IsEmpty then
      result := Query.FieldByName('max').AsInteger;
  except
    on E: Exception do
      Erro(Self.ClassName, 'Ultimo', E.Message, true, true, E);
  end;
end;

{ ========================================= TFuncionario ================================== }

constructor TFuncionario.Create;
begin
  inherited Create;
end;

destructor TFuncionario.Free;
begin
  inherited;
end;

function TFuncionario.GetTabela: string;
begin
  result := Nm_Tabela;
end;

procedure TFuncionario.SetDs_endereco(const Value: string);
begin
  FDs_endereco := Value;
end;

procedure TFuncionario.SetDt_Atualizacao(const Value: TDateTime);
begin
  FDt_Atualizacao := Value;
end;

procedure TFuncionario.SetDt_Criacao(const Value: TDateTime);
begin
  FDt_Criacao := Value;
end;

procedure TFuncionario.SetIe_Inativo(const Value: string);
begin
  FIe_Inativo := Value;
end;

procedure TFuncionario.SetNm_Funcionario(const Value: string);
begin
  FNm_Funcionario := Value;
end;

procedure TFuncionario.SetNm_Usuario_Atualizacao(const Value: string);
begin
  FNm_Usuario_Atualizacao := Value;
end;

procedure TFuncionario.SetNm_Usuario_Criacao(const Value: string);
begin
  FNm_Usuario_Criacao := Value;
end;

procedure TFuncionario.SetNr_Sequencia(const Value: cardinal);
begin
  FNr_Sequencia := Value;
end;

procedure TFuncionario.SetNr_Seq_Cidade(const Value: cardinal);
begin
  FNr_Seq_Cidade := Value;
end;

procedure TFuncionario.SetNr_Seq_Turno(const Value: cardinal);
begin
  FNr_Seq_Turno := Value;
end;

procedure TFuncionario.SetNr_Tel_Celular(const Value: string);
begin
  FNr_Tel_Celular := Value;
end;

procedure TFuncionario.SetNr_Tel_Residencial(const Value: string);
begin
  FNr_Tel_Residencial := Value;
end;

{ TFuncionario_Ponto }

constructor TFuncionario_Ponto.Create;
begin
  inherited;
end;

destructor TFuncionario_Ponto.Free;
begin
  inherited;
end;

function TFuncionario_Ponto.GetTabela: string;
begin
  result := Nm_Tabela;
end;

procedure TFuncionario_Ponto.SetDt_Atualizacao(const Value: TDateTime);
begin
  FDt_Atualizacao := Value;
end;

procedure TFuncionario_Ponto.SetDt_batida(const Value: TDateTime);
begin
  Fdt_batida := Value;
end;

procedure TFuncionario_Ponto.SetDt_Criacao(const Value: TDateTime);
begin
  FDt_Criacao := Value;
end;

procedure TFuncionario_Ponto.Setie_desconsiderar_forcar_entrada_turno
  (const Value: boolean);
begin
  Fie_desconsiderar_forcar_entrada_turno := Value;
end;

procedure TFuncionario_Ponto.SetNm_Usuario_Atualizacao(const Value: string);
begin
  FNm_Usuario_Atualizacao := Value;
end;

procedure TFuncionario_Ponto.SetNm_Usuario_Criacao(const Value: string);
begin
  FNm_Usuario_Criacao := Value;
end;

procedure TFuncionario_Ponto.SetNr_Sequencia(const Value: cardinal);
begin
  FNr_Sequencia := Value;
end;

procedure TFuncionario_Ponto.SetNr_seq_funcionario(const Value: cardinal);
begin
  Fnr_seq_funcionario := Value;
end;

{ TUsuario }

constructor TUsuario.Create;
begin
  inherited Create;
end;

destructor TUsuario.Free;
begin
  inherited;
end;

function TUsuario.GetTabela: string;
begin
  result := Nm_Tabela;
end;

procedure TUsuario.Setie_permite_criar_usuario(const Value: string);
begin
  Fie_permite_criar_usuario := Value;
end;

procedure TUsuario.Setie_permite_logar(const Value: string);
begin
  Fie_permite_logar := Value;
end;

procedure TUsuario.Setie_super_user(const Value: string);
begin
  Fie_super_user := Value;
end;

procedure TUsuario.SetNm_Usuario(const Value: string);
begin
  FNm_Usuario := Value;
end;

procedure TUsuario.SetNr_Sequencia(const Value: cardinal);
begin
  FNr_Sequencia := Value;
end;

{ TTurno }

constructor TTurno.Create;
begin
  inherited;
end;

destructor TTurno.Free;
begin
  inherited;
end;

function TTurno.GetTabela: string;
begin
  result := Nm_Tabela;
end;

procedure TTurno.SetDs_Turno(const Value: string);
begin
  FDs_Turno := Value;
end;

procedure TTurno.SetDt_Atualizacao(const Value: TDateTime);
begin
  FDt_Atualizacao := Value;
end;

procedure TTurno.SetDt_Criacao(const Value: TDateTime);
begin
  FDt_Criacao := Value;
end;

procedure TTurno.SetHr_Final(const Value: string);
begin
  FHr_Final := Value;
end;

procedure TTurno.SetHr_Inicial(const Value: string);
begin
  FHr_Inicial := Value;
end;

procedure TTurno.SetIe_domingo(const Value: boolean);
begin
  FIe_domingo := Value;
end;

procedure TTurno.SetIe_quarta_feira(const Value: boolean);
begin
  FIe_quarta_feira := Value;
end;

procedure TTurno.SetIe_quinta_feira(const Value: boolean);
begin
  FIe_quinta_feira := Value;
end;

procedure TTurno.SetIe_sabado(const Value: boolean);
begin
  FIe_sabado := Value;
end;

procedure TTurno.SetIe_segunda_feira(const Value: boolean);
begin
  FIe_segunda_feira := Value;
end;

procedure TTurno.SetIe_sexta_feira(const Value: boolean);
begin
  FIe_sexta_feira := Value;
end;

procedure TTurno.SetIe_terca_feira(const Value: boolean);
begin
  FIe_terca_feira := Value;
end;

procedure TTurno.SetNm_Usuario_Atualizacao(const Value: string);
begin
  FNm_Usuario_Atualizacao := Value;
end;

procedure TTurno.SetNm_Usuario_Criacao(const Value: string);
begin
  FNm_Usuario_Criacao := Value;
end;

procedure TTurno.SetNr_Sequencia(const Value: cardinal);
begin
  FNr_Sequencia := Value;
end;

procedure TTurno.Setqt_tempo_desconto_dia(const Value: string);
begin
  Fqt_tempo_desconto_dia := Value;
end;

procedure TTurno.Setqt_tempo_desconto_intervalo(const Value: string);
begin
  Fqt_tempo_desconto_intervalo := Value;
end;

{ TFeriado }

constructor TFeriado.Create;
begin
  inherited;
end;

destructor TFeriado.Free;
begin
  inherited;
end;

function TFeriado.GetTabela: string;
begin
  result := Nm_Tabela;
end;

procedure TFeriado.SetDs_Deriado(const Value: string);
begin
  FDs_Deriado := Value;
end;

procedure TFeriado.SetDt_Atualizacao(const Value: TDateTime);
begin
  FDt_Atualizacao := Value;
end;

procedure TFeriado.SetDt_Criacao(const Value: TDateTime);
begin
  FDt_Criacao := Value;
end;

procedure TFeriado.SetNm_Usuario_Atualizacao(const Value: string);
begin
  FNm_Usuario_Atualizacao := Value;
end;

procedure TFeriado.SetNm_Usuario_Criacao(const Value: string);
begin
  FNm_Usuario_Criacao := Value;
end;

procedure TFeriado.Setnr_dia(const Value: Byte);
begin
  Fnr_dia := Value;
end;

procedure TFeriado.Setnr_mes(const Value: Byte);
begin
  Fnr_mes := Value;
end;

procedure TFeriado.Setnr_ano(const Value: cardinal);
begin
  Fnr_ano := Value;
end;

procedure TFeriado.SetNr_Sequencia(const Value: cardinal);
begin
  FNr_Sequencia := Value;
end;

end.
