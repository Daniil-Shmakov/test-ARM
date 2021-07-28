unit uBaseForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, StdCtrls, ComCtrls, ActnList, ExtCtrls,
  uСertForm, uFindForm, ImgList, Buttons, uResources;

type
  TBaseForm = class(TForm)
    ArmOperatopPanel: TPanel;
    PersonsGrid: TDBGrid;
    ButtonPanel: TPanel;
    ActionList: TActionList;
    AddPerson: TAction;
    FindPerson: TAction;
    AddSertificate: TAction;
    Accept: TAction;
    FindPanel: TPanel;
    PersonsDataSource: TDataSource;
    PersonsQuery: TADOQuery;
    CertQuery: TADOQuery;
    CertDataSource: TDataSource;
    SertPanel: TPanel;
    EditPanel: TPanel;
    CertificatesGrid: TDBGrid;
    CertCaptionPanel: TPanel;
    Refresh: TAction;
    Cancel: TAction;
    SpeedButton1: TSpeedButton;
    ImageList1: TImageList;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton7: TSpeedButton;
    ViewCertificate: TAction;
    SpeedButton2: TSpeedButton;
    ARMspecificPanel: TPanel;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    Connection: TADOConnection;
    procedure FormShow(Sender: TObject); virtual;
    procedure AddPersonExecute(Sender: TObject); virtual;
    procedure FindPersonExecute(Sender: TObject); virtual;
    procedure AddSertificateExecute(Sender: TObject); virtual;
    procedure PersonsQueryAfterScroll(DataSet: TDataSet); virtual;
    procedure RefreshExecute(Sender: TObject); virtual;
    procedure FormResize(Sender: TObject); virtual;
    procedure ViewCertificateExecute(Sender: TObject); virtual;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure AcceptExecute(Sender: TObject); virtual;
    procedure CancelExecute(Sender: TObject); virtual;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  protected
    FindForm: TForm;
    procedure AddCertToDatabase(title, text: string);
   // функционал зависит от потомка
    procedure StateAdding; virtual; abstract;
    procedure StateViewing; virtual; abstract;
  public
    { Public declarations }
  published
  // to set connection settings from mainform
      procedure SetConnectionString(ConnString: string); virtual; abstract;

  end;
//
//var
//  BaseForm: TBaseForm;

implementation

{$R *.dfm}

// preparing to add person to database
procedure TBaseForm.AddPersonExecute(Sender: TObject);
begin
    StateAdding;
end;

// Adds Certificate to selected person
procedure TBaseForm.AddSertificateExecute(Sender: TObject);
var F: TForm;
    Title, Text: string;
begin
    F := TAddCertForm.Create(self);
    TAddCertForm(F).PatientNameLabel.Caption :=
        PersonsDataSource.DataSet.FieldByName('Name').AsString;
    if F.ShowModal = mrOK then
    begin
        Title := TAddCertForm(F).TitleEdit.Text;
        Text := TAddCertForm(F).ContentsMemo.Lines.Text;
        AddCertToDatabase(Title, Text);
        RefreshExecute(self);
    end;
end;

procedure TBaseForm.AcceptExecute(Sender: TObject);
begin
     raise Exception.Create('Method not implemented');
end;

procedure TBaseForm.CancelExecute(Sender: TObject);
begin
    raise Exception.Create('Method not implemented');

end;

procedure TBaseForm.AddCertToDatabase(title, text: string);
const InsertSQL = 'Insert into Certificates (Certificate_name, Certificate_text, ' +
                  'creationdate, person_ID) ' +
                  'values (:name, :text, :CDate, :Person_ID)';
var Query: TAdoQuery;
begin
    Query := TADOQuery.Create(nil);
    Query.ParamCheck := true;
    Query.SQL.Add(InsertSQL);
    Query.Connection := Connection;
    Query.Parameters.ParseSQL(Query.SQL.Text, true);
    try
        Query.Parameters.ParamByName('name').Value := title;
        Query.Parameters.ParamByName('text').Value := text;
        Query.Parameters.ParamByName('CDate').DataType := ftDateTime;
        Query.Parameters.ParamByName('CDate').Value := Now;
        Query.Parameters.ParamByName('Person_ID').Value := PersonsQuery.FieldByName('ID').Value;
        Query.Prepared := true;
        Query.ExecSQL;
    except on E: EADOError do
      begin
        MessageDlg(DBWriteError, mtError, [mbOK], 0);
      end;
    end;
    FreeAndNil(Query);
end;

// отвечает за показ выданных справок для выбранного в окне поиска пациента
procedure TBaseForm.PersonsQueryAfterScroll(DataSet: TDataSet);
begin
    CertQuery.Close;
    CertQuery.Parameters.ParamByName('Person_ID').Value := PersonsQuery.FieldByName('ID').Value;
    CertQuery.Open;
end;

procedure TBaseForm.RefreshExecute(Sender: TObject);
var CurrentID: integer;
begin
    CurrentID := PersonsDataSource.DataSet.FieldByName('ID').AsInteger;
    PersonsQuery.Close;
    PersonsQuery.Open;
    PersonsDataSource.DataSet.Locate('ID', CurrentID, []);
    Sleep(100);
    CertQuery.Close;
    CertQuery.Open;
end;

procedure TBaseForm.FindPersonExecute(Sender: TObject);
begin
    //FindInDatabase;
end;

procedure TBaseForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Action := caFree;
end;

procedure TBaseForm.FormCreate(Sender: TObject);
var i: integer;
begin

end;

procedure TBaseForm.FormResize(Sender: TObject);
begin
    FindForm.Width := FindPanel.Width;
    FindForm.Height := FindPanel.Height;
end;

procedure TBaseForm.FormShow(Sender: TObject);
var Query: TADOQuery;
begin
    FindForm := TPersonFindForm.Create(self);
    FindForm.Parent := FindPanel;
    FindForm.WindowState := wsMaximized;
    FindForm.Show;
    StateViewing;
end;

procedure TBaseForm.ViewCertificateExecute(Sender: TObject);
var F: TAddCertForm;
    Title, Text: string;
begin
    F := TAddCertForm.Create(self);
    F.Caption := 'Просмотр справки';
    F.PatientNameLabel.Caption :=
        PersonsDataSource.DataSet.FieldByName('Name').AsString;
    F.TitleEdit.Text := CertDataSource.DataSet.FieldByName('Certificate_name').AsString;
    F.TitleEdit.ReadOnly := true;
    F.ContentsMemo.Lines.Text := CertDataSource.DataSet.FieldByName('Certificate_text').AsString;
    F.ContentsMemo.ReadOnly := true;
    if F.ShowModal = mrOK then
        Exit;
end;

end.
