unit uArmChoice;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ExtCtrls;

type TChoice = (cOper, cStat);

type
  TArmChoice = class(TForm)
    Panel1: TPanel;
    ArmOper: TSpeedButton;
    ArmStat: TSpeedButton;
    procedure ArmStatClick(Sender: TObject);
    procedure ArmOperClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Choice: TChoice;
  end;

var
  ArmChoice: TArmChoice;

implementation

{$R *.dfm}

procedure TArmChoice.ArmOperClick(Sender: TObject);
begin
    Choice := cOper;
    ModalResult := mrOK;
end;

procedure TArmChoice.ArmStatClick(Sender: TObject);
begin
    Choice := cStat;
    ModalResult := mrOK;
end;

end.
