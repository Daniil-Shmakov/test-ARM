unit u—ertForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ImgList, ActnList, Buttons;

type
  TAddCertForm = class(TForm)
    NamePanel: TPanel;
    SearchPanel: TPanel;
    TitleEdit: TEdit;
    ContentsMemo: TMemo;
    CertTitleLabel: TLabel;
    CertContentsLabel: TLabel;
    NameLabel: TLabel;
    ButtonPanel: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    ActionList1: TActionList;
    OKAction: TAction;
    CancelAction: TAction;
    ImageList1: TImageList;
    PatientNameLabel: TLabel;
    procedure FormShow(Sender: TObject);
    procedure OKActionExecute(Sender: TObject);
    procedure CancelActionExecute(Sender: TObject);
    procedure TitleEditChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AddCertForm: TAddCertForm;

implementation

{$R *.dfm}



procedure TAddCertForm.CancelActionExecute(Sender: TObject);
begin
    ModalResult := mrCancel;
end;

procedure TAddCertForm.FormShow(Sender: TObject);
begin
    OKAction.Enabled := false;
    CancelAction.Enabled := true;
end;

procedure TAddCertForm.OKActionExecute(Sender: TObject);
begin
    ModalResult := mrOK;
end;

procedure TAddCertForm.TitleEditChange(Sender: TObject);
begin
        OKAction.Enabled := true;
end;


end.
