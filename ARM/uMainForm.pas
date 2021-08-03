unit uMainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Menus, ActnList, Generics.Collections,
  uBaseForm, uStatistForm, uOperatorForm, ImgList, uConnectForm, uArmChoice;

type TFormType = Class of TBaseForm;

type
  TMainForm = class(TForm)
    MainMenu: TMainMenu;
    ActionList1: TActionList;
    ArmOperator: TAction;
    ArmStatist: TAction;
    N1: TMenuItem;
    Start1: TMenuItem;
    N3: TMenuItem;
    DBConnectionSettings: TMenuItem;
    Start2: TMenuItem;
    ImageList1: TImageList;
    Window1: TMenuItem;
    WindowsCloseAll: TMenuItem;
    WindowsCascade: TMenuItem;
    WindowsTile: TMenuItem;
    DBSettings: TAction;
    procedure ArmOperatorExecute(Sender: TObject);
    procedure ArmStatistExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure WindowsCloseAllClick(Sender: TObject);
    procedure WindowsCascadeClick(Sender: TObject);
    procedure WindowsTileClick(Sender: TObject);
    procedure DBSettingsExecute(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
    // Key: <тип формы>, value: <сквозной счетчик запускавшихся окон>
    ConnectionString: String;
    FormCounter: TDictionary<TClass, integer>;
    function GetFormTypeCount(FormType: TClass): integer;
    function ChildFormCreate(FormType: TFormType): TForm;

  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

const connString = 'Provider=OraOLEDB.Oracle.1;Password=%s;Persist ' +
    'Security Info=True;User ID=%s;Data Source=%s;Extended Properties=""';

// если в словаре пусто, возвращает "1" - это первая форма такого типа
function TMainForm.GetFormTypeCount(FormType: TClass): integer;
var i: integer;
begin
    Result := 0;
    if FormCounter.TryGetValue(FormType, Result) then
        Exit(Result)
    else
        Result := 1;
end;

procedure TMainForm.WindowsTileClick(Sender: TObject);
begin
    Tile;
end;

// создает MDI-Child окно типа FormType
function TMainForm.ChildFormCreate(FormType: TFormType): TForm;
var F: TBaseForm;
begin
    F := FormType.Create(Application);
    F.Caption := F.Caption + ' - '
        + IntToStr(GetFormTypeCount(FormType));
    if ConnectionString = '' then
        ConnectionString := Format(ConnString, ['password', 'hr', 'orcl']);
    F.SetConnectionString(ConnectionString);
    F.Show;
    // счетчик окон типа FormType
    FormCounter.AddOrSetValue(FormType, GetFormTypeCount(FormType) + 1);
    result := F;
end;

// закрывает все дочерние окна
procedure TMainForm.WindowsCloseAllClick(Sender: TObject);
var i: integer;
begin
    for i := 0 to MDIChildCount-1 do
        MDIChildren[i].Close;
end;

// настройки коннекта к бД - сервер, логин/пароль
procedure TMainForm.DBSettingsExecute(Sender: TObject);
var F: TConnectForm;
begin
    F := TConnectForm.Create(self);
    if F.ShowModal = MrOK then
    begin
        ConnectionString := Format(ConnString, [F.Password.Text, F.Login.Text, F.DataSource.Text]);
    end;
end;

procedure TMainForm.WindowsCascadeClick(Sender: TObject);
begin
    Cascade;
end;

procedure TMainForm.ArmOperatorExecute(Sender: TObject);
begin
    ChildFormCreate(TOperatorForm);
end;

procedure TMainForm.ArmStatistExecute(Sender: TObject);
begin
    ChildFormCreate(TStatistForm);
end;

// показываем диалог выбора АРМа
procedure TMainForm.FormActivate(Sender: TObject);
var F: TForm;
begin
    F := TArmChoice.Create(self);
    if F.ShowModal = mrOK then
    begin
        if TArmChoice(F).Choice = cOper then
            ArmOperatorExecute(self);
        if TArmChoice(F).Choice = cStat then
            ArmStatistExecute(self);
    end
    else
        Exit;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
    FormCounter := TDictionary<TClass, integer>.Create;
end;

end.

