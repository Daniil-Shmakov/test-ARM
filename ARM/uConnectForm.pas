unit uConnectForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ExtCtrls, StdCtrls;

type
  TConnectForm = class(TForm)
    Login: TLabeledEdit;
    Password: TLabeledEdit;
    DataSource: TLabeledEdit;
    Panel1: TPanel;
    OKButton: TSpeedButton;
    CancelButton: TSpeedButton;
    procedure OKButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ConnectForm: TConnectForm;

implementation

{$R *.dfm}

procedure TConnectForm.OKButtonClick(Sender: TObject);
begin
    ModalResult := mrOK;
end;

end.
