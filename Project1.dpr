program Project1;

uses
  Vcl.Forms,
  uMainForm in 'uMainForm.pas' {FormOperator},
  uFormStatist in 'uFormStatist.pas' {FormStatist},
  uFormOperator in 'uFormOperator.pas' {Form1},
  uFormFind in 'uFormFind.pas' {FrmFind};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormOperator, FormOperator);
  Application.CreateForm(TFormStatist, FormStatist);
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TFrmFind, FrmFind);
  Application.Run;
end.
