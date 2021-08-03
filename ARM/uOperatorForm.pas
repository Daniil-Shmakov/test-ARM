unit uOperatorForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBaseForm, ImgList, DB, ADODB, ActnList, Grids, DBGrids, Buttons,
  ExtCtrls, StdCtrls, ComCtrls, StrUtils, uResources;

type
  TOperatorForm = class(TBaseForm)
    PersonNameEdit: TLabeledEdit;
    BirthdatePick: TDateTimePicker;
    CreationdatePick: TDateTimePicker;
    BirthdateLabel: TLabel;
    CreationdateLabel: TLabel;
    procedure PersonNameEditKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
  private
    procedure SavePerson(Sender: TObject);
    { Private declarations }
  public
    { Public declarations }
  published
    procedure AcceptExecute(Sender: TObject); override;
    procedure CancelExecute(Sender: TObject); override;
    procedure StateAdding; override;
    procedure StateViewing; override;
    procedure SetConnectionString(ConnString: string); override;
  end;

var
  OperatorForm: TOperatorForm;

implementation

{$R *.dfm}

// показывает последние 10 записей (по ID)
const BrowseQuery = 'SELECT ID, name, to_char(birthdate, ''dd.mm.yyyy'') as birthdate, ' +
    ' to_char(creationdate, ''dd.mm.yyyy'') as creationdate FROM ' +
      '(SELECT * FROM PERSONS ORDER BY ID DESC) '+
      ' WHERE ROWNUM <= 10' +
      ' ORDER BY ID';


{ TOperatorForm }

procedure TOperatorForm.SavePerson(Sender: TObject);
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
        try
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

            end;
        except on E: Exception do
            MessageDlg(ParamError, mtError, [mbOK], 0);
        end;
        FreeAndNil(Query);
    end;
end;


procedure TOperatorForm.SetConnectionString(ConnString: string);
begin
    Connection.ConnectionString := ConnString;
    Connection.LoginPrompt := false;
    Connection.Connected := true;
end;

procedure TOperatorForm.AcceptExecute(Sender: TObject);
begin
    SavePerson(self);
end;

procedure TOperatorForm.CancelExecute(Sender: TObject);
begin
    StateViewing;
    PersonNameEdit.Text := '';
end;

procedure TOperatorForm.FormShow(Sender: TObject);
begin
    inherited;
    PersonsQuery.SQL.Text := BrowseQuery;
    PersonsQuery.Connection := Connection;
    CertQuery.Connection := Connection;
    try
        PersonsQuery.Close;
        PersonsQuery.Open;
    except on E: EADOError do
        MessageDlg(SearchError, mtError, [mbOK], 0);
    end;

end;

procedure TOperatorForm.PersonNameEditKeyPress(Sender: TObject; var Key: Char);
var LA: set of Char;
begin
    // считаем, что в фамилиях пациентов цифр и спец. символов быть не должно
    // только латиница (под вопросом), кириллица и дефис с точкой
    // Latin alphabet
    LA := ['A'..'z'] + ['-'] + [' '] + ['.'];
    if not ((Key in LA) or (containsStr(CyrillicAlphabeth, Key)) or (Key = chr(VK_BACK))) then
        Key := #0;
end;

// переходим в "режим добавления" - включаем нужные элементы
procedure TOperatorForm.StateAdding;
var i: integer;
begin
    for I := 0 to ArmSpecificPanel.ControlCount-1 do
    begin
        ArmSpecificPanel.Controls[i].Enabled := true;
    end;
    PersonNameEdit.Text := '';
end;

// возвращем элементы в "режим просмотра" - отключаем ненужное
procedure TOperatorForm.StateViewing;
var i: integer;
begin
    for I := 0 to ArmSpecificPanel.ControlCount-1 do
    begin
        ArmSpecificPanel.Controls[i].Enabled := false;
    end;
end;

end.
