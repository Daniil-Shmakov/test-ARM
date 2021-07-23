// доступ к данным
unit DBLayer;

interface

uses DB, ADODB, SysUtils, Dialogs;

type TPerson = class
    Name: string;
    BirthDate: TDate;
    CreationDate: TDateTime;
    ID: integer;
end;

type TDataBase = class
  private

      class var Instance: TDataBase;
      class var InstCount : integer;
      constructor Create(UserName, Password, DataSource: String);
      function WriteToDB(SQL: string): boolean;



  public
      class var Connection: TADOConnection;
      // returns instance of class, which gives access to DB (write, read data etc)
      class function OpenDatabase(UserName, Password, DataSource: String): TDataBase;
      // delete class instance and close DB connection
      class procedure CloseDatabase;

      function SaveToDB(Person: TPerson): boolean;
      function LoadFromDB(SQL: string; var DS: TDataSource): TDataSource;


end;

implementation

const ConnectionString = 'Provider=OraOLEDB.Oracle.1;Password=%s;Persist Security Info=True;' +
                         'User ID=%s;Data Source=%s;Extended Properties=""';


class procedure TDataBase.CloseDatabase;
begin
    if Instcount > 0 then
    begin
        Connection.Connected := false;
        FreeAndNil(Connection);
        FreeandNil(Instance);
        Instcount := 0;
    end;
end;

constructor TDataBase.Create(UserName, Password, DataSource: String);
begin
    Connection := TADOConnection.Create(nil);
    Connection.ConnectionString := format(ConnectionString, [Password, UserName, DataSource]);
    Connection.LoginPrompt := false;
    try
        Connection.Connected := True;
    except
        on e: EADOError do
        begin
            MessageDlg('Error while connecting', mtError,
                      [mbOK], 0);
            Exit;
        end;
    end;
    ShowMessage('Connection successful');
end;


class function TDataBase.OpenDatabase(UserName, Password, DataSource: String): TDataBase;
begin
    if not Assigned(Instance) then
    begin
        Instance := TDataBase.Create(UserName, Password, DataSource);
        InstCount := 1;
    end;
    result := Instance;
end;

function TDataBase.LoadFromDB(SQL: string; var DS: TDataSource): TDataSource;
var Query: TADOQuery;
//    DS: TDataSet;
begin
  //  DS := TDataSet.Create(nil);

    Query := TADOQuery.Create(nil);
    Query.Connection := Connection;
    Query.SQL.Add(SQL);
    Query.Prepared := true;
    try
        Query.Open;
    except
        on e: EADOError do
        begin
            MessageDlg('Error while executing query', mtError,
                  [mbOK], 0);
            Exit;
        end;
    end;
    DS := Query.DataSource;
    result := Query.DataSource;
end;

function TDataBase.WriteToDB(SQL: string): boolean;
var Query: TADOQuery;
    RowsAffected: integer;
begin
    result := false;
    if Connection.Connected then
    begin
        Query := TADOQuery.Create(nil);
        Query.SQL.Add(SQL);
        Query.Prepared := true;
        try
            RowsAffected := Query.ExecSQL;
        except
            on e: EADOError do
            begin
                MessageDlg('Error while executing query', mtError,
                      [mbOK], 0);
                Exit;
            end;
        end;
        result := true;
        Query.Free;
    end;
end;

function TDataBase.SaveToDB(Person: TPerson): boolean;
const InsertQuery = 'insert into Persons values (:name, :BirthDate, :CreationDate)';
var Query: TADOQuery;
    Param: TParameter;
begin
    Query := TADOQuery.Create(nil);
    Query.SQL.Add(InsertQuery);

    Param := Query.Parameters.ParamByName('name');
    Param.DataType := TDataType.ftString;
    Param.Value := Person.Name;

    Param := Query.Parameters.ParamByName('BirthDate');
    Param.DataType := TDataType.ftDate;
    Param.Value := Person.BirthDate;

    Param := Query.Parameters.ParamByName('CreationDate');
    Param.DataType := TDataType.ftDateTime;
    Param.Value := Person.CreationDate;

    Query.Free;



end;



end.
