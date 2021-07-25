program Project1;

uses
  Forms,
  DBLayer in 'DBLayer.pas',
  uMainForm in 'uMainForm.pas' {MainForm},
  uOperatorForm in 'uOperatorForm.pas' {OperatorForm},
  uFindForm in 'uFindForm.pas' {PersonFindForm},
  u—ertForm in 'u—ertForm.pas' {AddCertForm},
  uErrorMessages in 'uErrorMessages.pas',
  uStatistForm in 'uStatistForm.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
