unit Unit_principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Unit_Resultados, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Unit_Cad_funcionario;

type
  TForm_principalmenu = class(TForm)
    menu: TMainMenu;
    Cadastrohoras1: TMenuItem;
    Lancamentohoras1: TMenuItem;
    Consultatotaldemodeobra1: TMenuItem;
    Consulta1: TMenuItem;
    procedure Lancamentohoras1Click(Sender: TObject);
    procedure Consulta1Click(Sender: TObject);


  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_principalmenu: TForm_principalmenu;

implementation

{$R *.dfm}

procedure TForm_principalmenu.Consulta1Click(Sender: TObject);
begin
    if (Form_resultados = nil) then
        Form_resultados := TForm_resultados.Create(self);

    Form_resultados.ShowModal;
    FreeAndNil(Form_resultados);
end;

procedure TForm_principalmenu.Lancamentohoras1Click(Sender: TObject);
begin
    if (Form_cad_funcion = nil) then
        Form_cad_funcion := TForm_cad_funcion.Create(self);

    Form_cad_funcion.ShowModal;
    FreeAndNil(Form_cad_funcion);
end;

end.
