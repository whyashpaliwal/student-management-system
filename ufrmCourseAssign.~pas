unit ufrmCourseAssign;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, clisted, ExtCtrls, uclAllClasses;

type
  TfrmAssign = class(TForm)
    pnlAssign: TPanel;
    pnlContain: TPanel;
    comboxStudentNameA: TComboBox;
    btnAllocate: TButton;
    lblHeading: TLabel;
    lblStudentName: TLabel;
    lblCourses: TLabel;
    lblCourseD: TLabel;
    lblstudentNameD: TLabel;
    lblDeallocate: TLabel;
    comboxStudentNameD: TComboBox;
    btnDeallocate: TButton;
    comboxDeallocate: TComboBox;
    comboxAllocate: TComboBox;
    procedure btnAllocateClick(Sender: TObject);
    procedure comboxDeallocateDropDown(Sender: TObject);
    procedure btnDeallocateClick(Sender: TObject);

  private
    { Private declarations }
    FListStudentData, FListCourseData : TStringList;
    procedure SetCourse(const Value: TStringList);
    procedure SetStudents(const Value: TStringList);
  public
    { Public declarations }
  published
    property ListOfStudents : TStringList read FListStudentData write SetStudents;
    property ListOfCourse : TStringList read FListCourseData write SetCourse;
end;

{==============================================================================}

implementation

{$R *.dfm}

{============================= Allocation =====================================}
procedure TfrmAssign.SetStudents(const Value: TStringList);
var
  LCounter : Integer;
  LStudent : TStudent;
begin
  FListStudentData := Value;
  for LCounter := 0 to FListStudentData.Count - 1 do
  begin
    LStudent := FListStudentData.Objects[LCounter] as TStudent;

    comboxStudentNameA.AddItem(LStudent.Name, FListStudentData);
    {Adding students in deallocation combox as well}
    comboxStudentNameD.AddItem(LStudent.Name, FListStudentData);
  end;
end;

procedure TfrmAssign.SetCourse(const Value: TStringList);
var
  LCounter : Integer;
  LCourse : TCourse;
begin
  FListCourseData := Value;
  for LCounter := 0 to FListCourseData.Count - 1 do
  begin
    LCourse := FListCourseData.Objects[LCounter] as TCourse;
    comboxAllocate.AddItem(LCourse.CourseName, FListCourseData);
  end;
end;

{On allocate button click the course is added to selected student in combox}
procedure TfrmAssign.btnAllocateClick(Sender: TObject);
var
  LStudent : TStudent;
  LIndex, LCourseIndex: Integer;
  LCourse : TCourse;
begin
  // Getting Index of student and selected course
  LIndex := comboxStudentNameA.ItemIndex;
  LCourseIndex := comboxAllocate.ItemIndex;

  try
  if LIndex > -1 then
  begin
    if LCourseIndex > -1 then
    begin
      // ref initialization
      LStudent := FListStudentData.Objects[LIndex] as TStudent;
      LCourse := FListCourseData.Objects[LCourseIndex] as TCourse;

      LStudent.Course.Sorted := True;
      LStudent.Course.CaseSensitive := True;
      LStudent.Course.Duplicates := dupError;
      // allocation of course to selected student
      LStudent.Course.AddObject(LCourse.CourseName, LCourse);

      MessageDlg('Coursed assigned to ' + comboxStudentNameA.Text + ' Sucessfully',mtInformation ,[mbOK], 0);
    end // if to check LCourseIndex ends here
    else
    begin
      MessageDlg('Please Select Course to assign',mtWarning,[mbOK], 0);
    end;
  end // if to check LIndex ends here
  else
  begin
    MessageDlg('Please Select the student',mtWarning,[mbOK], 0);
  end;

  except
    on E : EStringListError do
    begin
      MessageDlg('This course is already allocated to this student',mtWarning,[mbOK], 0);
    end;
    on E : Exception do
    begin
      MessageDlg('Illegal use of Applcation!  Press OK to continue.',mtError,[mbOK], 0);
    end;
  end;
  comboxStudentNameA.ItemIndex := -1;
  comboxAllocate.ItemIndex := -1;
end;
{=========================== Deallocation =====================================}

{ On dropdown the courses associated with student is added to combobox }
procedure TfrmAssign.comboxDeallocateDropDown(Sender: TObject);
var
  LStudent : TStudent;
  LIndex : Integer;
begin
  try
  comboxDeallocate.Clear;
  LIndex := comboxStudentNameD.ItemIndex;
  if LIndex > -1 then
  begin
    LStudent := FListStudentData.Objects[LIndex] as TStudent;

    comboxDeallocate.Items := LStudent.Course;

          (*Alternate method but it has performance issues
            LStudent.Course.SaveToFile('Course.txt');
            comboxDeallocate.Items.LoadFromFile('Course.txt');
            TFileStream.Create( 'Course.txt', fmCreate ).Free;*)
  end // if to check LIndex ends here
  else
  begin
    MessageDlg('First select the student to deallocate his/her course ',mtWarning,[mbOK], 0);
  end;
  except
    on E : Exception do
    begin
      MessageDlg('Illegal use of Applcation!  Press OK to continue.',mtError,[mbOK], 0);
      comboxStudentNameD.ItemIndex := -1;
      comboxDeallocate.ItemIndex := -1;
    end;
  end;
end;

{On dellocate button click event def}
procedure TfrmAssign.btnDeallocateClick(Sender: TObject);
var
  LStudent : TStudent;
  LIndex, LCourseIndex: Integer;
 // LCourse : TCourse;
begin
  // Getting Index of student and selected course
  LIndex := comboxStudentNameD.ItemIndex;
  LCourseIndex := comboxDeallocate.ItemIndex;

  if LIndex > -1 then
  begin
    try
      // ref initialization
      LStudent := FListStudentData.Objects[LIndex] as TStudent;

      // Deallocation of course of selected student
      LStudent.Course.Delete(LCourseIndex);

      MessageDlg('Coursed Deallocated from ' + comboxStudentNameD.Text + ' Sucessfully',mtInformation,[mbOK], 0);
    except
      on E : Exception do
      begin
        MessageDlg('Illegal use of Applcation!  Press OK to continue.',mtError,[mbOK], 0);
      end;
    end;  //try end
  end // if to check LIndex ends here
  else
  begin
    MessageDlg('Please Select the student',mtWarning,[mbOK], 0);
  end;
  
  comboxStudentNameD.ItemIndex := -1;
  comboxDeallocate.ItemIndex := -1;
end; // proc click end

end.// end of course assign unit
