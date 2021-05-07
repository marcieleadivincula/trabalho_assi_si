unit Unit_Resultados;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.Buttons, Vcl.StdCtrls, Vcl.ExtCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.UI.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Phys, FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef,
  FireDAC.VCLUI.Wait, Unit_dados, Datasnap.DBClient;

type
  TForm_resultados = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Ed_nome: TEdit;
    SpeedButton1: TSpeedButton;
    Panel3: TPanel;
    DBGrid1: TDBGrid;
    FuncionarioConnection: TFDConnection;
    CadfuncionarioTable: TFDQuery;
    DataSource1: TDataSource;
    Ed_periodo1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Ed_periodo2: TEdit;
    SpeedButton2: TSpeedButton;
    Label3: TLabel;
    Ed_totalGasto: TEdit;
    procedure SpeedButton1Click(Sender: TObject);
    function getBusca(nome:String):boolean;
    procedure SpeedButton2Click(Sender: TObject);
    function total(data1, data2:integer):integer;

  private

  public

  end;

var
  Form_resultados: TForm_resultados;

implementation

{$R *.dfm}

{ TForm1 }

procedure TForm_resultados.SpeedButton1Click(Sender: TObject);
begin
    getBusca(Ed_nome.Text);
end;

procedure TForm_resultados.SpeedButton2Click(Sender: TObject);
begin
    if (Ed_periodo1.Text = '') then
      begin
        ShowMessage('Digite o periodo inicial');
        Ed_periodo1.SetFocus;
        exit;
      end;

    if (Ed_periodo2.Text = '') then
      begin
        ShowMessage('Digite o periodo inicial');
        Ed_periodo2.SetFocus;
        exit;
      end;

    total(StrToInt(Ed_periodo1.Text),StrToInt(Ed_periodo2.Text));

end;

function TForm_resultados.total(data1, data2: integer): integer;
var
total:integer;
begin
   CadfuncionarioTable.Close;
   CadfuncionarioTable.SQL.Clear;
   CadfuncionarioTable.sql.Add('select sum(total) as soma from cadfuncionario where periodo between :data1 and :data2');
   CadfuncionarioTable.Params[0].AsInteger := data1;
   CadfuncionarioTable.Params[1].AsInteger := data2;
   CadfuncionarioTable.Open;

   total := CadfuncionarioTable.Fields[0].asInteger;
   result := total;
   Ed_totalGasto.text := IntToStr(total);

end;

function TForm_resultados.getBusca(nome: String): boolean;
begin
    result := false;

    CadfuncionarioTable.Close;
    CadfuncionarioTable.SQL.Clear;
    CadfuncionarioTable.sql.Add('select * from cadfuncionario where nome = :nome');
    CadfuncionarioTable.Params[0].asString:= nome;
    CadfuncionarioTable.Open;

    if (CadfuncionarioTable.RecordCount > 0) then
    begin
      DBGrid1.DataSource := DataSource1;
      result := true;
    end
    else
    begin
       ShowMessage('Usuário não encontrado!');
       Ed_nome.Clear;
       Ed_nome.SetFocus;
    end;




end;

end.
