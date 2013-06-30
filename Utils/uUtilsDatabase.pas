unit uUtilsDatabase;

interface

uses
  StrUtils,
  SysUtils,
  ADODB,
  DBGrids,
  Classes,
  uRotinas_Nitgen,
  uDataModule;

{Funções de banco de dados}
function  Busca_Valor(pTabela,pCampoRetorno,pCampoFiltrar,pValor:string): Variant;
function  Busca_Valor_Fixo(pComando:string):string;
function  Busca_Valores(pComando:string): TStringList;
function  CarregarDigitaisLeitor(pNitgen:TNitgen;pFuncionario:integer;pConsistir:boolean):Boolean;
function  CurrValue(pSequencia:string):integer;
function  ExecutarSQL(pComando:string;p_ExibirErro:Boolean=true):boolean;
function  InstanciarQuery:TADOQuery;
function  Like(pTexto:string):string;
function  Obter_Usuario_Ativo:string;

implementation

uses
  uUtils,
  Variants;

function InstanciarQuery:TADOQuery;
begin
  result := nil;
  try
    result := TADOQuery.Create(Nil);
    result.Close;
    result.SQL.Clear;
    result.Connection := uDataModule.Banco_dm.Conexao_banco_aco;
    result := result;
  except
    on E:Exception do
      Erro(Nm_Unit,'InstanciarQuery',E.Message,True,true,E);
  end;
end;

function  Busca_Valor_Fixo(pComando:string):string;
var
  Temp_q: TADOQuery;
  i:integer;
  vCampoFiltrar,vValor:string;
begin
  try
    Result := '';
    Temp_q := InstanciarQuery;
    try
      begin
        Temp_q.SQL.Clear;
        Temp_q.SQL.Add(pComando);
        Temp_q.Open;
        Temp_q.First;
        if not Temp_q.IsEmpty then
          result := Temp_q.FieldByName(Temp_q.FieldDefList[0].Name).AsString;
      end;
    finally
      Temp_q.Free;
    end;

  Except
    on E:Exception do
      Erro(Nm_Unit,'Busca_Valor_Fixo',E.Message,True,true,E);
  end;
end;

function Obter_Usuario_Ativo;
var
  qy_Temp:TADOQuery;
begin
  Try
    qy_Temp := InstanciarQuery;
    Try
      qy_Temp.SQL.Add('SELECT CURRENT_USER AS user');
      qy_Temp.Open;
      result := qy_Temp.FieldByName('user').AsString;
    Finally
      qy_Temp.Free;
    End;
  Except
     on E:Exception do
      Erro(Nm_Unit,'Obter_Usuario_Ativo',E.Message,True,true,E);
  End;
end;

function Like(pTexto:string):string;
begin
  result := LowerCase(AnsiReplaceStr(QuotedStr('%'+pTexto+'%'),' ','%'));
end;

function Busca_Valor(pTabela,pCampoRetorno,pCampoFiltrar,pValor:string): Variant;
var
  Temp_q: TADOQuery;
  i:integer;
  vCampoFiltrar,vValor:string;
begin
  try
    Result := null;
    Temp_q := InstanciarQuery;
    try
      if pValor <> '' then
      begin
        Temp_q.SQL.Clear;
        Temp_q.SQL.Add('select '+pCampoRetorno+' from '+pTabela);
        Temp_q.SQL.Add('where 1=1');

        if pos(';',pCampoFiltrar) = 0 then
          Temp_q.SQL.Add('and '+pCampoFiltrar+' = '+pValor)
        else
        for i := 0 to StrToInt(Opcao(pCampoFiltrar,';',0,'C'))-1 do
        begin
          vCampoFiltrar := Opcao(pCampoFiltrar,';',i+1,'T');
          vValor        := Opcao(pValor,';',i+1,'T');
          if vCampoFiltrar <> '' then
            Temp_q.SQL.Add('and '+vCampoFiltrar+' = '+vValor);
        end;
        Temp_q.Open;
        Temp_q.First;
        if not Temp_q.IsEmpty then
          result := Temp_q.FieldByName(Temp_q.FieldDefList[0].Name).AsVariant;
      end;
    finally
      Temp_q.Free;
    end;

  Except
    on E:Exception do
      Erro(Nm_Unit,'Busca_Valor',E.Message,True,true,E);
  end;
end;

function Busca_Valores(pComando:string): TStringList;
var
  Temp_q: TADOQuery;
begin
   Result := TStringList.Create;
   Temp_q := InstanciarQuery;
   try
     try
       Temp_q.SQL.Clear;
       Temp_q.SQL.Add(pComando);
       Temp_q.Open;
       Temp_q.First;
       while not Temp_q.Eof do
       begin
         result.Add (Temp_q.FieldByName(Temp_q.FieldDefList[0].Name).AsString);
         Temp_q.Next;
       end;
     finally
       Temp_q.Free;
     end;
   Except
     on E:Exception do
       Erro(Nm_Unit,'Busca_Valores',E.Message,True,true,E);
   end;
end;

function ExecutarSQL(pComando:string;p_ExibirErro:Boolean=true):boolean;
var
  Temp_q: TADOQuery;
begin
  Result := false;
  try
    Temp_q := InstanciarQuery;
    try
      Temp_q.SQL.Clear;
      Temp_q.SQL.Add(pComando);
      Temp_q.ExecSQL;
      result := Temp_q.RowsAffected > 0;
    finally
      Temp_q.Free;
    end;
  Except
    on E:Exception do
      Erro(Nm_Unit,'ExecutarSQL',E.Message,p_ExibirErro,True,E);
  end;
end;

function CarregarDigitaisLeitor(pNitgen:TNitgen;pFuncionario:integer;pConsistir:boolean):Boolean;
var
  qyTemp:TADOQuery;
  vMsgErro:string;
begin
  {Esta procedure Insere na memoria do leitor todas as digitais cadastradas}
  try
    qyTemp := InstanciarQuery;
    try
      Result := True;

      {Limpa a memoria do leitor}
      pNitgen.objNSearch.ClearDB;

      qyTemp.SQL.Clear;

      qyTemp.SQL.Add('select  a.nr_seq_funcionario,');
      qyTemp.SQL.Add('        a.cd_biometria');
      qyTemp.SQL.Add('from 	  funcionario_biometria a,');
      qyTemp.SQL.Add('        funcionario b');
      qyTemp.SQL.Add('where   a.nr_seq_funcionario = b.nr_sequencia');
      qyTemp.SQL.Add('and     b.ie_inativo         <> ''S''');

      if pFuncionario <> 0 then
        qyTemp.SQL.Add('and a.nr_seq_funcionario = '+IntToStr(pFuncionario));

      qyTemp.Open;

      if qyTemp.RecordCount = 0 then
      begin
        Result := false;
        Erro(Nm_Unit,'CarregarDigitaisLeitor','Não existe nenhuma digital cadastrada',pConsistir,false,Nil);
        Exit;
      end;

      qyTemp.First;

      while not qyTemp.Eof do
      begin
        {Carrega na memoria do leitor as digitais}
        pNitgen.Popular_FIR_Leitor(qyTemp.FieldByName('NR_SEQ_FUNCIONARIO').AsInteger,
                                     qyTemp.FieldByName('CD_BIOMETRIA').AsWideString,vMsgErro);
        if vMsgErro <> '' then
          Erro(Nm_Unit,'CarregarDigitaisLeitor',vMsgErro,pConsistir,true,Nil);

        qyTemp.Next;
      end;
    finally
      qyTemp.Free;
    end;
  except
    on E:Exception do
    begin
      Erro(Nm_Unit,'CarregarDigitaisLeitor',E.Message,false,true,E);
      Result := false;
    end;
  end;
end;

function  CurrValue(pSequencia:string):integer;
var
  Qy_Temp:TADOQuery;
begin
  result := 0;
  try
    Qy_Temp := InstanciarQuery;
    try
      Qy_Temp.SQL.Clear;
      Qy_Temp.SQL.Add('SELECT currval('+QuotedStr(pSequencia)+')');
      Qy_Temp.Open;
      result := Qy_Temp.FieldByName('currval').AsInteger;
    finally
      Qy_Temp.Free;
    end;
  Except
    on E:Exception do
      Erro(Nm_Unit,'CurrValue',E.Message,True,True,E);
  end;
end;

end.
