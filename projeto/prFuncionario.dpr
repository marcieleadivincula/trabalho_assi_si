program prFuncionario;

uses
  Vcl.Forms,
  Unit_principal_login in 'Unit_principal_login.pas' {Form_Login},
  Unit_dados in 'Unit_dados.pas' {dm_dados: TDataModule},
  Unit_Cad_funcionario in 'Unit_Cad_funcionario.pas' {Form_cad_funcion},
  Unit_principal in 'Unit_principal.pas' {Form_principalmenu},
  Unit_Resultados in 'Unit_Resultados.pas' {Form_resultados};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm_Login, Form_Login);
  //Application.CreateForm(Tdm_dados, dm_dados);
  //Application.CreateForm(Tdm, dm);
  Application.CreateForm(TForm_resultados, Form_resultados);
  Application.Run;
end.
