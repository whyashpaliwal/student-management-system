program StudentManagementProject;

uses
  Forms,
  ufrmMain in 'ufrmMain.pas' {frmMainForm};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmMainForm, frmMainForm);
  Application.Run;
end.
