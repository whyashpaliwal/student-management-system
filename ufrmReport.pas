unit ufrmReport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, uclAllClasses, ExtCtrls;

type
  TfrmReport = class(TForm)
    memoDisplay: TMemo;
    lbldisplay: TLabel;
    pnlOptions: TPanel;
    lblOptions: TLabel;
    btnShowCourses: TButton;
    btnShowStudents: TButton;
    lblOp1: TLabel;
    lblOp2: TLabel;
    lblOp3: TLabel;
    Label1: TLabel;
    comboxStudentName: TComboBox;
    btnReport: TButton;
    btnClear: TButton;
    procedure btnShowStudentsClick(Sender: TObject);
    procedure btnShowCoursesClick(Sender: TObject);
    procedure btnReportClick(Sender: TObject);
    procedure btnClearClick(Sender: TObject);
  private
    { Private declarations }
    FShowCourses: TStringList;
    FShowStudent: TStringList;
    procedure SetCourse(const Value: TStringList);
    procedure SetStudents(const Value: TStringList);


  public
    { Public declarations }
  published
    property ShowStudentList : TStringList read FShowStudent write SetStudents;
    property ShowCourseList : TStringList read FShowCourses write SetCourse;
end;

{==============================================================================}

implementation

{$R *.dfm}
procedure TfrmReport.SetCourse(const Value: TStringList);
begin
  FShowCourses := Value;
end;

procedure TfrmReport.SetStudents(const Value: TStringList);
var
  LCounter : Integer;
  LStudent : TStudent;
begin
  FShowStudent := Value;

  for LCounter := 0 to ShowStudentList.Count - 1 do
  begin
    LStudent := ShowStudentList.Objects[LCounter] as TStudent;

    comboxStudentName.AddItem(LStudent.Name, ShowStudentList);
  end;
  
end;

 // to show all students with their details
procedure TfrmReport.btnShowStudentsClick(Sender: TObject);
var
  LCounter, LCounterX : Integer;
  LStudent : TStudent;
  LCourse : TCourse;
begin
  memoDisplay.Clear;
  lbldisplay.Caption := 'Showing Full Student List';
  for LCounter := 0 to ShowStudentList.Count - 1 do
  begin
    LStudent := ShowStudentList.Objects[LCounter] as TStudent;
    memoDisplay.Lines.Add('===========================');
    memoDisplay.Lines.Add('Name : ' + LStudent.Name);
    memoDisplay.Lines.Add('Age : ' + IntToStr(LStudent.Age));
    memoDisplay.Lines.Add('Education Year :  ' + LStudent.Education);
    memoDisplay.Lines.Add('Stream : '+ LStudent.Stream);
    memoDisplay.Lines.Add('All Courses Associated : ' + LStudent.Course.CommaText);
    memoDisplay.Lines.Add(' ');
    memoDisplay.Lines.Add('>>>Course Details<<');
    for LCounterX := 0 to LStudent.Course.Count -1 do
    begin
      LCourse := LStudent.Course.Objects[LCounterX] as TCourse;
      memoDisplay.Lines.Add(' ');
      memoDisplay.Lines.Add('Course Name : '+ #9 + LCourse.CourseName);
      memoDisplay.Lines.Add('Course Duration : '+ #9 + IntToStr(LCourse.CourseDuration) + ' Months');
      memoDisplay.Lines.Add('Course ratings : '+ #9 + LCourse.Ratings);
    end;
    memoDisplay.Lines.Add('===========================');
  end;
end;

// Show Course with details
procedure TfrmReport.btnShowCoursesClick(Sender: TObject);
var
  LCounter : Integer;
  LCourse : TCourse;
begin
  memoDisplay.Clear;
  lbldisplay.Caption := 'Showing Full Course List';
  for LCounter := 0 to ShowCourseList.Count - 1 do
  begin
    LCourse := ShowCourseList.Objects[LCounter] as TCourse;
    memoDisplay.Lines.Add('============================');
    memoDisplay.Lines.Add('Course Name : '+ #9 + LCourse.CourseName);
    memoDisplay.Lines.Add('Course Duration : '+ #9 + IntToStr(LCourse.CourseDuration) + ' Months');
    memoDisplay.Lines.Add('Course Ratings : '+ #9 + LCourse.Ratings);
    memoDisplay.Lines.Add('============================');
  end;
end;


// Show selected student deails from the combox
procedure TfrmReport.btnReportClick(Sender: TObject);
var
  LIndex, LCounterX : Integer;
  LStudent : TStudent;
  LCourse : TCourse;
begin
  memoDisplay.Clear;
  LIndex := comboxStudentName.ItemIndex;
  if LIndex > -1 then
  begin
  lbldisplay.Caption := 'Showing Student Details';

    LStudent := ShowStudentList.Objects[LIndex] as TStudent;
    memoDisplay.Lines.Add('===========================');
    memoDisplay.Lines.Add('Name : ' + LStudent.Name);
    memoDisplay.Lines.Add('Age : ' + IntToStr(LStudent.Age));
    memoDisplay.Lines.Add('Education Year :  ' + LStudent.Education);
    memoDisplay.Lines.Add('Stream : ' + LStudent.Stream);
    memoDisplay.Lines.Add('All Courses Associated : ' + LStudent.Course.CommaText);
    memoDisplay.Lines.Add(' ');
    memoDisplay.Lines.Add('>>>Course Details<<');
    for LCounterX := 0 to LStudent.Course.Count -1 do
    begin
      LCourse := LStudent.Course.Objects[LCounterX] as TCourse;

      memoDisplay.Lines.Add(' ');
      memoDisplay.Lines.Add('Course Name : '+ #9 + LCourse.CourseName);
      memoDisplay.Lines.Add('Course Duration : '+ #9  + IntToStr(LCourse.CourseDuration) + ' Months');
      memoDisplay.Lines.Add('Course ratings : '+ #9  + LCourse.Ratings);
    end;
    memoDisplay.Lines.Add('===========================');
  end
  else
  begin
    ShowMessage('Please select student if you want to show information');
  end;
end;

procedure TfrmReport.btnClearClick(Sender: TObject);
begin
 comboxStudentName.ItemIndex := -1;
 memoDisplay.Clear;
 lbldisplay.Caption := 'Display';
end;

end.
