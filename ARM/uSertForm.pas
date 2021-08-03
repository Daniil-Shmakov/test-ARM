unit uSertForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TAddCertForm = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Edit1: TEdit;
    Memo1: TMemo;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Panel3: TPanel;
    OKButton: TButton;
    CancelButton: TButton;
    procedure OKButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AddCertForm: TAddCertForm;

implementation

{$R *.dfm}

procedure TAddCertForm.OKButtonClick(Sender: TObject);
begin
    ModalResult := mrOK;
end;

end.
