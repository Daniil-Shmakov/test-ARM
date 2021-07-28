unit uFindForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, DB, ADODB, Grids, DBGrids, Buttons,
  uResources, StrUtils;

type
  TPersonFindForm = class(TForm)
    GridPanel: TPanel;
    SearchEdit: TEdit;
    CaptionPanel: TPanel;
    NameLabel: TLabel;
    SearchPanel: TPanel;
    ResultGrid: TDBGrid;
    SearchADOQuery: TADOQuery;
    DataSource: TDataSource;
    SearchButton: TSpeedButton;
    procedure SearchButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SearchEditKeyPress(Sender: TObject; var Key: Char);
  private
    Connection: TADOConnection;
    procedure SearchQuery(name: string);
  public
    { Public declarations }
  end;

var
  PersonFindForm: TPersonFindForm;

implementation

{$R *.dfm}

// формирование и выполнение поискового запроса
procedure TPersonFindForm.SearchQuery(name: string);
begin
    if SearchADOQuery.Active then
        SearchADOQuery.Close;
    if Connection.Connected then
    begin
        SearchAdoQuery.Connection := Connection;
        // add '%' for correct Oracle search pattern
        try
            SearchADOQuery.Parameters.ParamByName('Name').Value := name + '%';
            try
                DataSource.DataSet := SearchADOQuery;
                SearchADOQuery.Open;
            except on E: Exception do
                MessageDlg(SearchError, mtError, [mbOK], 0);
            end;
        except on E: Exception do
        begin
            MessageDlg(ParamError, mtError, [mbOK], 0);
        end;
        end;
    end
    else
        MessageDlg(ConnectionError, mtError, [mbOK], 0);
end;

procedure TPersonFindForm.SpeedButton1Click(Sender: TObject);
begin
    SearchQuery(SearchEdit.Text);
end;

procedure TPersonFindForm.FormCreate(Sender: TObject);
var i: integer;
begin
// ищем на родительской форме Connection и используем его дл€ коннекта к Ѕƒ
    for i := 0 to Self.Owner.ComponentCount-1 do
    begin
        if Self.Owner.Components[i].ClassNameIs('TADOConnection') then
        begin
            Connection := Self.Owner.Components[i] as TADOConnection;
        end;
    end;
end;

procedure TPersonFindForm.SearchButtonClick(Sender: TObject);
begin
    SearchQuery(SearchEdit.Text);
end;

procedure TPersonFindForm.SearchEditKeyPress(Sender: TObject; var Key: char);
var LA: set of Char;
begin
    // старт поиска по нажатию Enter
    if ord(key) = VK_RETURN then
        SearchQuery(SearchEdit.Text);
    // считаем, что в фамили€х пациентов цифр и спец. символов быть не должно
    // только латиница (под вопросом) и кириллица
    // Latin alphabet
    LA := ['A'..'z'] + ['-'];
    if not ((Key in LA) or (containsStr(CyrillicAlphabeth, Key)) or (Key = chr(VK_BACK))) then
        Key := #0;
end;

end.
