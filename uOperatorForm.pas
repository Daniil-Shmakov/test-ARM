unit uOperatorForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, StdCtrls, ComCtrls, ActnList, ExtCtrls,
  uСertForm, uFindForm, ImgList, Buttons, uErrorMessages;

type
  TOperatorForm = class(TForm)
    ArmOperatopPanel: TPanel;
    PersonsGrid: TDBGrid;
    ButtonPanel: TPanel;
    ActionList: TActionList;
    AddPerson: TAction;
    FindPerson: TAction;
    AddSertificate: TAction;
    BirthDatePick: TDateTimePicker;
    CreationDatePick: TDateTimePicker;
    Label2: TLabel;
    Label3: TLabel;
    SavePerson: TAction;
    FindPanel: TPanel;
    PersonsDataSource: TDataSource;
    Connection: TADOConnection;
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
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    PersonNameEdit: TLabeledEdit;
    ShowCertificate: TAction;
    SpeedButton2: TSpeedButton;
    ARMspecificPanel: TPanel;
    procedure FormShow(Sender: TObject);
    procedure AddPersonExecute(Sender: TObject);
    procedure FindPersonExecute(Sender: TObject); virtual;
    procedure AddSertificateExecute(Sender: TObject);
    procedure SavePersonExecute(Sender: TObject);
    procedure PersonsQueryAfterScroll(DataSet: TDataSet);
    procedure RefreshExecute(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure CancelExecute(Sender: TObject);
    procedure ShowCertificateExecute(Sender: TObject);
  private
    { Private declarations }
  protected
    FindForm: TForm;
    procedure AddCertToDatabase(title, text: string);
    procedure StateAdding; virtual;
    procedure StateViewing; virtual;

  public
    { Public declarations }
  end;

var
  OperatorForm: TOperatorForm;

implementation

{$R *.dfm}

// preparing to add person to database
procedure TOperatorForm.AddPersonExecute(Sender: TObject);
begin
    StateAdding;
end;

// AddCertificate to selected person
procedure TOperatorForm.AddSertificateExecute(Sender: TObject);
var F: TForm;
    Title, Text: string;
begin
    F := TAddCertForm.Create(self);
    TAddCertForm(F).PatientNameLabel.Caption :=
        PersonsDataSource.DataSet.FieldByName('Name').AsString;
    if F.ShowModal = mrOK then
    begin
        Title := (F as TAddCertForm).TitleEdit.Text;
        Text := (F as TAddCertForm).ContentsMemo.Lines.Text;
        AddCertToDatabase(Title, Text);
        RefreshExecute(self);
    end;
end;

// Adding Certificate record to database
procedure TOperatorForm.AddCertToDatabase(title, text: string);
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
    // а вдруг что не так с параметрами
    try
        Query.Parameters.ParamByName('name').Value := title;
        Query.Parameters.ParamByName('text').Value := text;
        Query.Parameters.ParamByName('CDate').DataType := ftDateTime;
        Query.Parameters.ParamByName('CDate').Value := Now;
        Query.Parameters.ParamByName('Person_ID').Value := PersonsQuery.FieldByName('ID').Value;
        Query.Prepared := true;
    except on E: Exception do
    begin
        MessageDlg(ParamError, mtError, [mbOK], 0);
        FreeAndNil(Query);
        Exit;
    end;
    end;
    try
        Query.ExecSQL;
    except on E: Exception do
        MessageDlg(DBWriteError, mtError, [mbOK], 0);
    end;
    FreeAndNil(Query);
end;

//
procedure TOperatorForm.PersonsQueryAfterScroll(DataSet: TDataSet);
begin
    CertQuery.Close;
    CertQuery.Parameters.ParamByName('Person_ID').Value := PersonsQuery.FieldByName('ID').Value;
    CertQuery.Open;
end;

procedure TOperatorForm.CancelExecute(Sender: TObject);
begin
    StateViewing;
end;

procedure TOperatorForm.RefreshExecute(Sender: TObject);
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

procedure TOperatorForm.FindPersonExecute(Sender: TObject);
begin
    //FindInDatabase;
end;

procedure TOperatorForm.FormResize(Sender: TObject);
begin
    FindForm.Width := FindPanel.Width;
    FindForm.Height := FindPanel.Height;
end;

procedure TOperatorForm.FormShow(Sender: TObject);
var Query: TADOQuery;
begin
    FindForm := TPersonFindForm.Create(self);
    FindForm.Parent := FindPanel;
    FindForm.WindowState := wsMaximized;
    FindForm.Show;
    CertQuery.ParamCheck := true;
    CertQuery.Parameters.ParseSQL(CertQuery.SQL.Text, true);
    StateViewing;
end;

procedure TOperatorForm.SavePersonExecute(Sender: TObject);
const InsertSQL = 'Insert into Persons (name, birthdate, creationdate) values' +
                  ' ( :Name, :BirthDate, :CreationDate )';
var Query: TADOQuery;
    Param: TParameter;
begin
    // Save to DB
    if Connection.Connected then
    begin
        Query := TADOQuery.Create(nil);
        Query.ParamCheck := true;
        Query.SQL.Add(InsertSQL);
        Query.Connection := Connection;
        Query.Parameters.ParseSQL(Query.SQL.Text, true);
        Query.Parameters.ParamByName('Name').Value := PersonNameEdit.Text;
        Query.Parameters.ParamByName('BirthDate').DataType := TDataType.ftDate;
        Query.Parameters.ParamByName('BirthDate').Value := BirthDatePick.Date;
        Query.Parameters.ParamByName('CreationDate').DataType := ftDateTime;
        Query.Parameters.ParamByName('CreationDate').Value := CreationDatePick.DateTime;
        try
            Query.Prepared := true;
            Query.ExecSQL;
            PersonsQuery.Close;
            Sleep(100);
            PersonsQuery.Open;
            StateViewing;
        finally
            FreeAndNil(Query);
        end;
    end;
end;

procedure TOperatorForm.ShowCertificateExecute(Sender: TObject);
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

// переходим в "режим добавления" - включаем нужные элементы
procedure TOperatorForm.StateAdding;
begin
    SavePerson.Enabled := true;
    Cancel.Enabled := true;
    PersonNameEdit.Text := '';
    PersonNameEdit.Enabled := true;
    BirthDatePick.Enabled := true;
    CreationDatePick.Enabled := true;
    AddPerson.Enabled := false;
end;

// возвращем элементы в "режим просмотра" - отключаем ненужное
procedure TOperatorForm.StateViewing;
begin
    SavePerson.Enabled := false;
    Cancel.Enabled := false;
    PersonNameEdit.Text := '';
    PersonNameEdit.Enabled := false;
    BirthDatePick.Enabled := false;
    CreationDatePick.Enabled := false;
    AddPerson.Enabled := true;
end;

end.
