unit uMainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Menus, uOperatorForm, uStatistForm, ActnList;

type
  TMainForm = class(TForm)
    MainMenu1: TMainMenu;
    ActionList1: TActionList;
    ArmOperator: TAction;
    ArmStatist: TAction;
    N1: TMenuItem;
    N2: TMenuItem;
    procedure ArmOperatorExecute(Sender: TObject);
    procedure ArmStatistExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

procedure TMainForm.ArmOperatorExecute(Sender: TObject);
var form: TForm;
begin
    form := TOperatorForm.Create(Application);
    form.Show;
    form.Visible := true;
end;

procedure TMainForm.ArmStatistExecute(Sender: TObject);
var form: TForm;
begin
    form := TStatistForm.Create(self);
    form.Show;
    form.Visible := true;
end;

end.
