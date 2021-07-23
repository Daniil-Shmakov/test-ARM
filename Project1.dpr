program Project1;

uses
  Forms,
  DBLayer in 'DBLayer.pas',
  uMainForm in 'uMainForm.pas' {MainForm},
  uStatistForm in 'uStatistForm.pas' {StatistForm},
  uOperatorForm in 'uOperatorForm.pas' {OperatorForm},
  uFindForm in 'uFindForm.pas' {PersonFindForm},
  uSertForm in 'uSertForm.pas' {AddCertForm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
