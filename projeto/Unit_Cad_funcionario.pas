unit Unit_Cad_funcionario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Obj_funcionario, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons;

type
  TForm_cad_funcion = class(TForm)
    Panel_cabecalho: TPanel;
    Panel_dados_funcionario: TPanel;
    Label_cad: TLabel;
    Label1: TLabel;
    Ed_nome: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Ed_codigo: TEdit;
    Ed_valor: TEdit;
    Ed_obervacao: TEdit;
    Label_Observacao: TLabel;
    ComboBox_situacao: TComboBox;
    Panel1: TPanel;
    btSalvar: TBitBtn;
    btSair: TBitBtn;
    btExcluir: TBitBtn;
    btCancelar: TBitBtn;
    Label5: TLabel;
    Edit_horas_Trabalhadas: TEdit;
    Periodo: TLabel;
    Edit_periodo: TEdit;

    procedure limpartela (var Form);
    procedure FormActivate(Sender: TObject);
    procedure btSairClick(Sender: TObject);
    procedure btExcluirClick(Sender: TObject);
    procedure btSalvarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Ed_codigoChange(Sender: TObject);
    procedure Ed_codigoClick(Sender: TObject);

  private
    { Private declarations }
  public
    Funcionario : TObj_funcionario;
  end;

var
  Form_cad_funcion: TForm_cad_funcion;

implementation

{$R *.dfm}

{ TForm_cad_funcion }

procedure TForm_cad_funcion.btExcluirClick(Sender: TObject);
begin
    if (Application.MessageBox('Confirma a exclusão do registro?',
         'Confirmação', mb_yesNo + mb_defButton2 + MB_ICONQUESTION) = idNo) then
       exit;

     if (Funcionario.delete) then
       self.FormActivate(self);
end;

procedure TForm_cad_funcion.btSairClick(Sender: TObject);
begin
      close;
end;

procedure TForm_cad_funcion.btSalvarClick(Sender: TObject);
var
  calc : real;
begin
    if (Ed_nome.Text = '') then
      begin
        showmessage('Digite o nome do funcionário');
        exit;
      end;

    if (Ed_valor.Text = '') then
      begin
        showmessage('Digite o valor hora do funcionario');
        exit;
      end;

    if (Edit_horas_Trabalhadas.text = '') then
      begin
        showmessage('Digite as horas trabalhadas');
        exit;
      end;

      if (Edit_periodo.text = '') then
      begin
        showmessage('Digite o periodo');
        exit;
      end;


      Funcionario.setNome(Ed_nome.Text);
      Funcionario.setSituacao(ComboBox_situacao.Text);
      Funcionario.setValorhora(StrToFloat(Ed_valor.text));
      Funcionario.setObservacao(Ed_obervacao.Text);
      Funcionario.sethoras(StrToFloat(Edit_horas_Trabalhadas.text));
      Funcionario.setPeriodo(StrToFloat(Edit_periodo.text));
      calc :=  StrToFloat(Ed_valor.text) * StrToFloat(Edit_horas_Trabalhadas.text);
      Funcionario.setTotal(calc);
      Funcionario.insert;
      self.FormActivate(self);
end;

procedure TForm_cad_funcion.Ed_codigoChange(Sender: TObject);
var
cadatul : integer;
begin
    cadatul := 0;
    cadatul := Funcionario.ultimoCodInserido + 1;
    Ed_codigo.text := IntToStr(cadatul);

end;


procedure TForm_cad_funcion.Ed_codigoClick(Sender: TObject);
var
cadatul : integer;
begin
    cadatul := 0;
    cadatul := Funcionario.ultimoCodInserido + 1;
    Ed_codigo.text := IntToStr(cadatul);

end;

procedure TForm_cad_funcion.FormActivate(Sender: TObject);
begin
    limpartela(self);
    Ed_nome.SetFocus;
    ComboBox_situacao.ItemIndex := 0;
end;

procedure TForm_cad_funcion.FormCreate(Sender: TObject);
begin
    Funcionario := TObj_funcionario.Create;
end;

procedure TForm_cad_funcion.FormDestroy(Sender: TObject);
begin
    Funcionario.Free;
end;

procedure TForm_cad_funcion.limpartela(var Form);
var
  Temp:TCustomForm;
  i: integer;
begin
     Temp:=TCustomForm(form);
     for i := 0 to (Temp.ComponentCount - 1) do
         begin
              if (Temp.Components[i] is TEdit) then
                TEdit(Temp.Components[i]).Text := ''
              else
              if (Temp.Components[i] is TMemo) then
                TMemo(Temp.Components[i]).Text := ''
              else
              if (Temp.Components[i] is TComboBox) then
                TComboBox(Temp.Components[i]).ItemIndex := -1
              else
              if (Temp.Components[i] is TLabeledEdit) then
                TLabeledEdit(Temp.Components[i]).Clear;
         end;
end;

end.
