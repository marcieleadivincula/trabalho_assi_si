unit Obj_funcionario;

interface

uses
     FireDAC.Comp.Client, System.SysUtils, Unit_dados, Vcl.Dialogs;
type

  TObj_funcionario = class
      private
            codigo : integer;
            nome:string;
            situacao:string;
            valorhora : real;
            observacao: string;
            horas: real;
            Periodo: TDateTime;
            total:real;

      public
            procedure setCodigo(codigo:integer);
            function  getCodigo:integer;
            procedure setNome(nome:String);
            function getNome:String;
            procedure setSituacao(situacao:String);
            function getSituacao:String;
            procedure setValorhora(valorhora:real);
            function getValorhora:real;
            procedure setObservacao(observacao:String);
            function  getObservacao:String;
            procedure sethoras(horas:real);
            function  gethoras:real;
            procedure setPeriodo(periodo:real);
            function  getPeriodo:real;
            procedure setTotal(total:real);
            function  getTotal:real;

            procedure insert;
            procedure update;
            function delete:boolean;
            procedure select;
            function ultimoCodInserido : integer;

  end;

implementation


procedure TObj_funcionario.insert;
var
    qrinsert : TFDQuery;
begin
     qrInsert := TFDQuery.Create(nil);
     qrInsert.Connection := dm.fdConexao;
     qrInsert.SQL.Clear;
     qrInsert.SQL.Add('insert into Cadfuncionario values (0,:nome,:situacao,:valor_hora, :observacao, :horas, :periodo, :total)');
     qrInsert.Params[0].AsString := self.getNome;
     qrInsert.Params[1].AsString := self.getSituacao;
     qrInsert.Params[2].AsFloat := self.getValorhora;
     qrInsert.Params[3].AsString := self.getObservacao;
     qrInsert.Params[4].AsFloat := self.gethoras;
     qrInsert.Params[5].AsFloat := self.getPeriodo;
     qrInsert.Params[6].AsFloat := self.getTotal;


     try
        qrInsert.ExecSQL;
     except
        on e:Exception do
          ShowMessage('Erro de inserção: ' + e.ToString);

     end;

     qrInsert.Free;

end;

procedure TObj_funcionario.select;
var
   qrSelect:TFDQuery;
begin

     qrSelect := TFDQuery.Create(nil);
     qrSelect.Connection := dm.fdConexao;
     qrSelect.SQL.Clear;
     qrSelect.SQL.Add('select * from cadfuncionario ');
     qrSelect.SQL.Add('where (codigo = :codigo)');
     qrSelect.Params[0].AsInteger := self.getCodigo;

     try
        qrSelect.Open;

        if (not qrSelect.IsEmpty) then
          begin
               self.setNome(qrSelect.Fields[1].AsString);
               self.setSituacao(qrSelect.Fields[2].AsString);
               self.setValorhora(qrSelect.Fields[3].AsFloat);
               self.setObservacao(qrSelect.Fields[4].AsString);
               self.sethoras(qrSelect.Fields[5].AsFloat);
               self.setPeriodo(qrSelect.Fields[6].AsFloat);
               self.setTotal(qrSelect.Fields[7].AsFloat);

          end;
     except
           on e:Exception do
              ShowMessage('Erro de exclusão de dados: ' + e.ToString);
     end;

     qrSelect.Free;
end;

function TObj_funcionario.ultimoCodInserido: integer;
var
   qrSelect:TFDQuery;
begin
     result := 0;
     qrSelect := TFDQuery.Create(nil);
     qrSelect.Connection := dm.fdConexao;
     qrSelect.SQL.Clear;
     qrSelect.SQL.Add('select max(ID) from cadfuncionario;');

     try
        qrSelect.Open;

        if (not qrSelect.IsEmpty) then
          begin
               result := qrSelect.Fields[0].AsInteger;
          end;
     except
           on e:Exception do
              ShowMessage('Erro de retorno de código: ' + e.ToString);
     end;

     qrSelect.Free;

end;

procedure TObj_funcionario.update;
var
qrUpdate : TFDQuery;
begin
     qrUpdate := TFDQuery.Create(nil);
     qrUpdate.Connection := dm.fdConexao;
     qrUpdate.SQL.Clear;
     qrUpdate.SQL.Add('update Cadfuncionario  set nome = :nome, situacao = :situacao, valor_hora = :valorhora, observacao = :observacao, horas = :horas, periodo = :periodo, total = :total ');
     qrUpdate.SQL.Add('where (ID = :codigo)');
     qrUpdate.Params[0].AsString := self.getNome;
     qrUpdate.Params[1].AsString := self.getsituacao;
     qrUpdate.Params[2].AsFloat := self.getValorhora;
     qrUpdate.Params[3].AsString := self.getObservacao;
     qrUpdate.Params[4].AsFloat := self.gethoras;
     qrUpdate.Params[5].AsFloat := self.getPeriodo;
     qrUpdate.Params[6].AsFloat := self.getTotal;
     qrUpdate.Params[7].AsInteger := self.getCodigo;



     try
        qrUpdate.ExecSQL;
     except
           on e:Exception do
              ShowMessage('Erro de alteração de dados: ' + e.ToString);
     end;

     qrUpdate.Free;

end;


function TObj_funcionario.delete;
var
   qrDelete:TFDQuery;
begin
     qrDelete := TFDQuery.Create(nil);
     qrDelete.Connection := dm.fdConexao;
     qrDelete.SQL.Clear;
     qrDelete.SQL.Add('delete from cadfuncionario ');
     qrDelete.SQL.Add('where (codigo = :codigo)');
     qrDelete.Params[0].AsInteger := self.getCodigo;

     try
        qrDelete.ExecSQL;
         result := true;
     except
           on e:Exception do
             begin
                  result := false;
                  ShowMessage('Erro de exclusão de dados: ' + e.ToString);
             end;
     end;

     qrDelete.Free;
end;

function TObj_funcionario.getCodigo: integer;
begin
    result := self.codigo;
end;

function TObj_funcionario.gethoras: real;
begin
  result := self.horas;
end;

function TObj_funcionario.getNome: String;
begin
    result := self.nome;
end;

function TObj_funcionario.getObservacao: String;
begin
    result := self.observacao;
end;

function TObj_funcionario.getPeriodo: real;
begin
    result := self.Periodo;
end;

function TObj_funcionario.getSituacao: String;
begin
     result := self.situacao;
end;

function TObj_funcionario.getTotal: real;
begin
  result := self.total;
end;

function TObj_funcionario.getValorhora: real;
begin
    result := self.valorhora;
end;


procedure TObj_funcionario.setCodigo(codigo: integer);
begin
    self.codigo := codigo;
end;

procedure TObj_funcionario.sethoras(horas: real);
begin
    self.horas := horas;
end;

procedure TObj_funcionario.setNome(nome: String);
begin
     self.nome := nome;
end;

procedure TObj_funcionario.setObservacao(observacao: String);
begin
    self.observacao := observacao;
end;

procedure TObj_funcionario.setPeriodo(periodo: real);
begin
    self.Periodo := periodo;
end;

procedure TObj_funcionario.setSituacao(situacao: String);
begin
    self.situacao := situacao;
end;

procedure TObj_funcionario.setTotal(total: real);
begin
   self.total := total;
end;

procedure TObj_funcionario.setValorhora(valorhora: real);
begin
      self.valorhora := valorhora;
end;

end.
