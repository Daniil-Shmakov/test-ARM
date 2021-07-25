unit uStatistForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, StdCtrls, ComCtrls, ActnList, ExtCtrls,
  uFindForm;

type
  TStatistForm = class(TForm)
    ArmOperatopPanel: TPanel;
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    ActionList1: TActionList;
    AddPerson: TAction;
    FindPersonByBirthDate: TAction;
    FindPersonByCreationDate: TAction;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    StartPeriodText: TLabel;
    EndPeriodtext: TLabel;
    FindPanel: TPanel;
    SertPanel: TPanel;
    DBGrid2: TDBGrid;
    DataSource1: TDataSource;
    ADOConnection1: TADOConnection;
    ADOTable1: TADOTable;
    Button4: TButton;
    Button5: TButton;
    Find: TAction;
    Cancel: TAction;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    SearchTypeText: TLabel;
    procedure FormShow(Sender: TObject);
    procedure FindPersonByBirthDateExecute(Sender: TObject);
    procedure FindPersonByCreationDateExecute(Sender: TObject);
  private
    { Private declarations }
      FindForm: TForm;

  public
    { Public declarations }
  end;

var
  OperatorForm: TStatistForm;

implementation

{$R *.dfm}

procedure TStatistForm.FindPersonByBirthDateExecute(Sender: TObject);
begin
    SearchTypeText.Caption := 'Поиск по дате рождения';
end;

procedure TStatistForm.FindPersonByCreationDateExecute(Sender: TObject);
begin
    SearchTypeText.Caption := 'Поиск по дате внесения данных';
end;

procedure TStatistForm.FormShow(Sender: TObject);
begin
    FindForm := TPersonFindForm.Create(self);
    FindForm.Parent := FindPanel;
    FindForm.WindowState := wsMaximized;

    FindForm.Show;

//    AdoQuery2.ParamCheck := true;
//    AdoQuery2.Parameters.ParseSQL(AdoQuery2.SQL.Text, true);
end;

end.
