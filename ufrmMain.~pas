unit ufrmMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, uclAllClasses, ufrmRegister, ufrmNewCourse,
  ufrmCourseAssign, ufrmReport;

type
  TfrmMainForm = class(TForm)
    lblHeading: TLabel;
    pnlMainForm: TPanel;
    lblRegister: TLabel;
    lblCourse: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    btnRegister: TButton;
    btnIntroduceCourse: TButton;
    btnCourseAssign: TButton;
    btnShowReport: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnRegisterClick(Sender: TObject);
    procedure btnIntroduceCourseClick(Sender: TObject);
    procedure btnCourseAssignClick(Sender: TObject);
    procedure btnShowReportClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    FStudentList, FCourseList : TStringList;
  end;

var
  frmMainForm: TfrmMainForm;

implementation

{$R *.dfm}
{---------------------------Main Form Procedure--------------------------------}

{Creation of both the list when application is invoked}

procedure TfrmMainForm.FormCreate(Sender: TObject);
begin
  FStudentList := TStringList.Create;
  FCourseList := TStringList.Create;
end;

{This proc open a new form to register student(s)}

procedure TfrmMainForm.btnRegisterClick(Sender: TObject);
var
  LfrmRegistration : TfrmRegistration;
begin
  try
    LfrmRegistration := TfrmRegistration.Create(nil);
    LfrmRegistration.RegisterList := FStudentList;
    LfrmRegistration.ShowModal;
  finally
    FreeAndNil(LfrmRegistration);
end;
end;

{This procedure invokes a new form to add  courses in FCourseList}

procedure TfrmMainForm.btnIntroduceCourseClick(Sender: TObject);
var
  LfrmNewCourse : TfrmNewCourse;
begin
  try
    LfrmNewCourse := TfrmNewCourse.Create(nil);
    LfrmNewCourse.CourseList := FCourseList;
    LfrmNewCourse.ShowModal;
  finally
    FreeAndNil(LfrmNewCourse);
end;
end;

{This proc invokes a new form to assign/unassign the courses to students}

procedure TfrmMainForm.btnCourseAssignClick(Sender: TObject);
var
  LfrmAssign : TfrmAssign;
begin
  try
    LfrmAssign := TfrmAssign.Create(nil);
    LfrmAssign.ListOfStudents := FStudentList;
    LfrmAssign.ListOfCourse := FCourseList;
    LfrmAssign.ShowModal;
  finally
    FreeAndNil(LfrmAssign);
end;
end;

{This proc generates an new form to show report}

procedure TfrmMainForm.btnShowReportClick(Sender: TObject);
var
  LReport : TfrmReport;
begin
  LReport := TfrmReport.Create(nil);

  LReport.ShowStudentList := FStudentList;
  LReport.ShowCourseList := FCourseList;

  LReport.ShowModal;
end;

{Destroying objects associated to student list and course list
 and freeing it when main form destroys}

procedure TfrmMainForm.FormDestroy(Sender: TObject);
var
  LCounter : Integer;
begin
  for LCounter := 0 to FStudentList.Count - 1 do
  begin
    FStudentList.Objects[LCounter].Free;
  end;
  FreeAndNil(FStudentList);

  for LCounter := 0 to FCourseList.Count - 1 do
  begin
    FCourseList.Objects[LCounter].Free;
  end;
  FreeAndNil(FCourseList);

end;

end.// end of main unit
