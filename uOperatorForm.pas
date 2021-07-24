unit uOperatorForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, StdCtrls, ComCtrls, ActnList, ExtCtrls,
  uSertForm, uFindForm;

type
  TOperatorForm = class(TForm)
    ArmOperatopPanel: TPanel;
    PersonsGrid: TDBGrid;
    Panel2: TPanel;
    ActionList: TActionList;
    AddPerson: TAction;
    FindPerson: TAction;
    AddSertificate: TAction;
    AddButton: TButton;
    AddCertButton: TButton;
    FindButton: TButton;
    PersonNameEdit: TEdit;
    BirthDatePick: TDateTimePicker;
    CreationDatePick: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    SaveButton: TButton;
    SavePerson: TAction;
    FindPanel: TPanel;
    DataSource1: TDataSource;
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    ADOQuery2: TADOQuery;
    DataSource2: TDataSource;
    SertPanel: TPanel;
    EditPanel: TPanel;
    CertificatesGrid: TDBGrid;
    Panel1: TPanel;
    Refresh: TAction;
    CancelButton: TButton;
    Cancel: TAction;
    Button2: TButton;
    procedure FormShow(Sender: TObject);
    procedure AddPersonExecute(Sender: TObject);
    procedure FindPersonExecute(Sender: TObject);
    procedure AddSertificateExecute(Sender: TObject);
    procedure SavePersonExecute(Sender: TObject);
    procedure ADOQuery1AfterScroll(DataSet: TDataSet);
    procedure RefreshExecute(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FindPanelResize(Sender: TObject);
    procedure CancelExecute(Sender: TObject);
  private
    FindForm: TForm;
    procedure AddCertToDatabase(title, text: string);

    { Private declarations }
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
    PersonNameEdit.Enabled := true;
    PersonNameEdit.Text := '';
    BirthDatePick.Enabled := true;
    CreationDatePick.Enabled := true;
    CreationDatePick.DateTime := Now;
    SavePerson.Enabled := true;
end;

procedure TOperatorForm.AddSertificateExecute(Sender: TObject);
var F: TForm;
    Title, Text: string;
begin
    // AddCertificate to Person
    F := TAddCertForm.Create(self);
    if F.ShowModal = mrOK then
    begin
        Title := (F as TAddCertForm).Edit1.Text;
        Text := (F as TAddCertForm).Memo1.Lines.Text;
        AddCertToDatabase(Title, Text);
    end;


end;

procedure TOperatorForm.AddCertToDatabase(title, text: string);
const InsertSQL = 'Insert into Certificates (Certificate_name, Certificate_text, ' +
                  'creationdate, person_ID) ' +
                  'values (:name, :text, :CDate, :Person_ID)';
var Query: TAdoQuery;
begin
    Query := TADOQuery.Create(nil);
    Query.ParamCheck := true;
    Query.SQL.Add(InsertSQL);
    Query.Connection := AdoConnection1;
    Query.Parameters.ParseSQL(Query.SQL.Text, true);

    Query.Parameters.ParamByName('name').Value := title;
    Query.Parameters.ParamByName('text').Value := text;
    Query.Parameters.ParamByName('CDate').DataType := ftDateTime;
    Query.Parameters.ParamByName('CDate').Value := Now;
    Query.Parameters.ParamByName('Person_ID').Value := AdoQuery1.FieldByName('ID').Value;
//        Param.DataType := TDataType.ftDatetime;
//        Param.Value := DateTimePicker2.DateTime;

    Query.Prepared := true;
    Query.ExecSQL;
//    Query.Connection.CommitTrans;

    Query.Free;
end;

procedure TOperatorForm.ADOQuery1AfterScroll(DataSet: TDataSet);
begin
    AdoQuery2.Close;
    AdoQuery2.Parameters.ParamByName('Person_ID').Value := AdoQuery1.FieldByName('ID').Value;
    AdoQuery2.Open;
end;

procedure TOperatorForm.CancelExecute(Sender: TObject);
begin
    SavePerson.Enabled := false;
    PersonNameEdit.Text := '';
    PersonNameEdit.Enabled := false;
    Cancel.Enabled := false;
    BirthDatePick.Enabled := false;
    CreationDatePick.Enabled := false;

end;

procedure TOperatorForm.FindPanelResize(Sender: TObject);
begin
    if Assigned(FindForm) then
        FindForm.WindowState := wsMaximized;
end;

procedure TOperatorForm.RefreshExecute(Sender: TObject);
begin
    AdoQuery1.Close;
    AdoQuery1.Open;
    Sleep(100);
    AdoQuery2.Close;
    AdoQuery2.Open;
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

    AdoQuery2.ParamCheck := true;
    AdoQuery2.Parameters.ParseSQL(AdoQuery2.SQL.Text, true);
end;

procedure TOperatorForm.SavePersonExecute(Sender: TObject);
const InsertSQL = 'Insert into Persons (name, birthdate, creationdate) values' +
                  ' ( :Name, :BirthDate, :CreationDate )';
var Query: TADOQuery;
    Param: TParameter;
begin
    // Save to DB
    if ADOConnection1.Connected then
    begin
        Query := TADOQuery.Create(nil);
        Query.ParamCheck := true;
        Query.SQL.Add(InsertSQL);
        Query.Connection := AdoConnection1;
        Query.Parameters.ParseSQL(Query.SQL.Text, true);
        Query.Parameters.ParamByName('Name').Value := PersonNameEdit.Text;
        Query.Parameters.ParamByName('BirthDate').DataType := TDataType.ftDate;
        Query.Parameters.ParamByName('BirthDate').Value := BirthDatePick.Date;
        Query.Parameters.ParamByName('CreationDate').DataType := ftDateTime;
        Query.Parameters.ParamByName('CreationDate').Value := CreationDatePick.DateTime;
        try
            Query.Prepared := true;
            Query.ExecSQL;
            AdoQuery1.Close;
            Sleep(100);
            AdoQuery1.Open;
        finally
            FreeAndNil(Query);
        end;
    end;
end;

end.
