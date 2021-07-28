program ARM;

uses
  Forms,
  uMainForm in 'uMainForm.pas' {MainForm},
  uBaseForm in 'uBaseForm.pas' {BaseForm},
  uFindForm in 'uFindForm.pas' {PersonFindForm},
  u—ertForm in 'u—ertForm.pas' {AddCertForm},
  uResources in 'uResources.pas',
  uOperatorForm in 'uOperatorForm.pas' {OperatorForm},
  uStatistForm in 'uStatistForm.pas' {StatistForm},
  uConnectForm in 'uConnectForm.pas' {ConnectForm},
  uArmChoice in 'uArmChoice.pas' {ArmChoice};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'ARM';
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
