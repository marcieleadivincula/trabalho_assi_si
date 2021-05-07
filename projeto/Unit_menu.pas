unit Unit_menu;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Unit_horas, Unit_Cad_funcionario,
  Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TForm_Login = class(TForm)
    Panel_login: TPanel;
    Label1: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Label2: TLabel;
    Panel1: TPanel;
    Image1: TImage;
    procedure Lancamentohoras1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_Login: TForm_Login;

implementation

{$R *.dfm}

procedure TForm_Login.Lancamentohoras1Click(Sender: TObject);
begin
    if (Form_cad_funcion = nil) then
      Form_cad_funcion := TForm_cad_funcion.Create(self);
      Form_cad_funcion.ShowModal;
      FreeAndNil(Form_cad_funcion);
end;

end.
