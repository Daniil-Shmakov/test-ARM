// returns collection of founded persons IDs
unit uFindForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, DB, ADODB, Grids, DBGrids;

type
  TPersonFindForm = class(TForm)
    Panel1: TPanel;
    SearchEdit: TEdit;
    Panel2: TPanel;
    Label1: TLabel;
    Panel3: TPanel;
    SearchButton: TButton;
    DBGrid1: TDBGrid;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    procedure SearchButtonClick(Sender: TObject);
  private
    procedure SearchQuery(name: string; Connection: TADOConnection);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PersonFindForm: TPersonFindForm;

implementation

const SearchSQL = 'Select * from Persons where lower(name) like lower(:Name)';

{$R *.dfm}

procedure TPersonFindForm.SearchQuery(name: string; Connection: TADOConnection);
var Query: TADOQuery;
begin
    if Connection.Connected then
    begin
        Query := TADOQuery.Create(nil);
        Query.Connection := Connection;
        Query.SQL.Add(SearchSQL);
        Query.Parameters.ParseSQL(Query.SQL.Text, true);
        // add '%' for correct Oracle search pattern
        Query.Parameters.ParamByName('Name').Value := name + '%';
        DataSource1.DataSet := Query;
        Query.Open;
    end;

end;

procedure TPersonFindForm.SearchButtonClick(Sender: TObject);
var i: integer;
    Query: TADOQuery;
begin
    for I := 0 to Self.Owner.ComponentCount-1 do
    begin
        if Self.Owner.Components[i].ClassNameIs('TADOConnection') then
        begin
            SearchQuery(SearchEdit.Text, Self.Owner.Components[i] as TADOConnection);
        end;
    end;
end;

end.
