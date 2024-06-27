program regcode;

uses
  Forms,
  RegisterUnit in 'RegisterUnit.pas' {RegisterForm};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TRegisterForm, RegisterForm);
  Application.Run;
end.
