unit Unit_principal_login;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Unit_Cad_funcionario,
  Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons, Unit_dados, Unit_principal;

type
  TForm_Login = class(TForm)
    Panel_login: TPanel;
    Label1: TLabel;
    Edit_user: TEdit;
    Edit_senha: TEdit;
    Label2: TLabel;
    Panel1: TPanel;
    Image1: TImage;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
  private
    procedure VerificaLogin(user:string;senha:string);
  public
    { Public declarations }
  end;

var
  Form_Login: TForm_Login;

implementation

{$R *.dfm}



procedure TForm_Login.SpeedButton1Click(Sender: TObject);
begin
close;
end;

procedure TForm_Login.SpeedButton2Click(Sender: TObject);
begin
    VerificaLogin(Edit_user.Text, Edit_senha.Text);
end;

procedure TForm_Login.VerificaLogin(user, senha: string);
begin


        if (dm.qSQL.Active) then
        dm.qSQL.Close;

        dm.qSQL.SQL.clear;

        dm.qSQL.SQL.Add('SELECT * from login where usuario = :user and senha = :senha');


          dm.qSQL.Params[0].AsString := user;
          dm.qSQL.Params[1].AsString := senha;

          dm.qSQL.Open();

          if (dm.qSQL.RecordCount > 0) then
            begin
              Form_principalmenu.ShowModal;
              Edit_user.SetFocus;
              Edit_user.Clear;
              Edit_senha.Clear
            end
            else
            begin
               ShowMessage('Usuário ou senha invalidos!');
               Edit_user.SetFocus;
               Edit_user.Clear;
               Edit_senha.Clear
            end;

end;

end.
