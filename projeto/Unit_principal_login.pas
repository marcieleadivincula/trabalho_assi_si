unit Unit_principal_login;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.UI.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Phys, FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef,FireDAC.VCLUI.Wait, Unit_dados, Datasnap.DBClient,
  Unit_principal, Unit_Cad_funcionario;

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
//var
//   qrSelect:qSQL;
begin
    if (dm.qSQL.Active) then
        dm.qSQL.Close;

    dm.qSQL.SQL.Clear;
    dm.qSQL.SQL.Add('SELECT * FROM login WHERE usuario = :user and senha = :senha');
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
