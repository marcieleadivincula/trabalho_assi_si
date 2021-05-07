program Project1;

uses
  Vcl.Forms,
  Unit_principal_login in 'Unit_principal_login.pas' {Form_Login},
  Unit_dados in 'Unit_dados.pas' {DataModule1: TDataModule},
  Unit_Cad_funcionario in 'Unit_Cad_funcionario.pas' {Form_cad_funcion},
  Unit_principal in 'Unit_principal.pas' {Form_principalmenu},
  Unit_Resultados in 'Unit_Resultados.pas' {Form_resultados};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm_Login, Form_Login);
  Application.CreateForm(TForm_principalmenu, Form_principalmenu);
  Application.CreateForm(TForm_cad_funcion, Form_cad_funcion);
  Application.CreateForm(TDataModule1, dm);
  Application.CreateForm(TForm_resultados, Form_resultados);
  Application.Run;
end.
