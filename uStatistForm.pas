unit uStatistForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uOperatorForm, ImgList, DB, ADODB, ActnList, StdCtrls, ExtCtrls,
  ComCtrls, Grids, DBGrids, Buttons;

type
  TStatistForm = class(TOperatorForm)
    procedure FormCreate(Sender: TObject);
  private
    procedure StateFinding;
    procedure Search(SearchField: string);
    { Private declarations }
  protected
    procedure FindPersonExecute(Sender: TObject);
  public
    { Public declarations }
  end;

var
  StatistForm: TStatistForm;

implementation

{$R *.dfm}

procedure TStatistForm.Search(SearchField: string);
const SearchQueryByDate = 'Select * from Persons where :datetype between :date1 and :date2';
begin
    if PersonsQuery.Active then
    begin
        PersonsQuery.Close;
        PersonsQuery.SQL.Text := SearchQueryByDate;
        PersonsQuery.Parameters.ParseSQL(PersonsQuery.SQL.Text, true);
        PersonsQuery.Parameters.ParamByName('datetype').Value := SearchField;
        PersonsQuery.Parameters.ParamByName('date1').Value := ;
        PersonsQuery.Parameters.ParamByName('datetype').Value := SearchField;


    end;



end;




procedure TStatistForm.FindPersonExecute(Sender: TObject);

begin

end;

procedure TStatistForm.FormCreate(Sender: TObject);
begin
    Self.Caption := 'АРМ статиста';
    StateFinding;
end;

procedure TStatistForm.StateFinding;
begin
    AddPerson.Visible := false;
    AddSertificate.Visible := false;
    SavePerson.Visible := false;
    FindPerson.Enabled := true;
    FindPerson.visible := true;
    PersonNameEdit.Visible := false;
    Refresh.Visible := false;

end;

end.
