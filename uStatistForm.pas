unit uStatistForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBaseForm, ImgList, DB, ADODB, ActnList, Grids, DBGrids, Buttons,
  ExtCtrls, StdCtrls, ComCtrls, uResources;

type TSearchType = (stBirthdate, stCreationdate);

type
  TStatistForm = class(TBaseForm)
    RadioGroup1: TRadioGroup;
    StartDatePick: TDateTimePicker;
    EndDatePick: TDateTimePicker;
    SearchByBirthdate: TAction;
    SearchByCreationday: TAction;
    Label1: TLabel;
    Label2: TLabel;
    procedure AcceptExecute(Sender: TObject); override;
    procedure SearchByBirthdateExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    procedure Search(DateParam: string);
  public
    { Public declarations }
    procedure StateAdding; override;
    procedure StateViewing; override;
    procedure SetConnectionString(ConnString: string); override;
  end;

implementation

{$R *.dfm}

const SearchQuery = 'select ID, name, to_char(birthdate, ''dd.mm.yyyy'') as birthdate, ' +
    ' to_char(creationdate, ''dd.mm.yyyy'') as creationdate from persons where %s ' +
    ' between :StartPeriod and :EndPeriod';


{ TStatistForm }

procedure TStatistForm.FormShow(Sender: TObject);
begin
    PersonsQuery.SQL.Text := SearchQuery;
    PersonsQuery.Connection := Connection;
    CertQuery.ParamCheck := true;
    CertQuery.Parameters.ParseSQL(CertQuery.SQL.Text, true);
    CertQuery.Connection := Connection;
    CertQuery.Close;
    inherited;
//    try
//        PersonsQuery.Close;
//        PersonsQuery.Open;
//    except on E: EADOError do
//        MessageDlg(SearchError, mtError, [mbOK], 0);
//    end;
end;

procedure TStatistForm.Search(Dateparam: string);
begin
    PersonsQuery.SQL.Text := format(SearchQuery, [Dateparam]);
    PersonsQuery.Connection := Connection;
    PersonsQuery.Parameters.ParseSQL(PersonsQuery.SQL.Text, true);
    PersonsQuery.Parameters.ParamByName('StartPeriod').DataType := ftDate;
    PersonsQuery.Parameters.ParamByName('StartPeriod').Value := StartDatePick.Date;
    PersonsQuery.Parameters.ParamByName('EndPeriod').DataType := ftDate;
    PersonsQuery.Parameters.ParamByName('EndPeriod').Value := EndDatePick.Date;
    PersonsQuery.Prepared := true;
    try
        PersonsQuery.Open;
    Except on E: Exception do
        MessageDlg(SearchError, mtError, [mbOK], 0);
    end;
end;

procedure TStatistForm.SearchByBirthdateExecute(Sender: TObject);
begin
    Search('Birthdate');
end;

procedure TStatistForm.AcceptExecute(Sender: TObject);
var Searchtype: string;
begin
    if RadioGroup1.ItemIndex = 0 then
        Searchtype := 'Birthdate';
    if RadioGroup1.ItemIndex = 1 then
        Searchtype := 'Creationdate';
    if RadioGroup1.ItemIndex = -1 then 
    begin
      ShowMessage('не выбран критерий поиска');
      Exit;
    end;
    Search(searchtype);
end;

procedure TStatistForm.StateAdding;
begin
    inherited;
end;

procedure TStatistForm.StateViewing;
begin
    ButtonPanel.Visible := false;
    Cancel.Visible := false;
    Accept.Caption := 'Поиск';
end;

procedure TStatistForm.SetConnectionString(ConnString: string);
begin
    Connection.ConnectionString := ConnString;
    Connection.LoginPrompt := false;
    try
        Connection.Connected := true;
    except on E: Exception do 
        MessageDlg(ConnectionError, mtError, [mbOk], 0);          
    end;
end;

end.
