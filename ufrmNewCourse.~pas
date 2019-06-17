unit ufrmNewCourse;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, TypInfo, StdCtrls, uclAllClasses;

type
  TfrmNewCourse = class(TForm)
    pnlNewCourse: TPanel;
    pnlInner: TPanel;
    lblCourseName: TLabel;
    lblHGeading: TLabel;
    lblDuration: TLabel;
    edtCourseName: TEdit;
    edtDuration: TEdit;
    comboxRatings: TComboBox;
    btnAdd: TButton;
    lblRating: TLabel;
    procedure btnAddClick(Sender: TObject);
    procedure edtDurationKeyPress(Sender: TObject; var Key: Char);

  private
    { Private declarations }
    FNewCourse: TStringList;
    procedure SetNewCourse(const Value: TStringList);

  public
    { Public declarations }

  published
    property CourseList : TStringList read FNewCourse write SetNewCourse;
end;

{==============================================================================}
  
implementation
uses ufrmMain;

{$R *.dfm}

procedure TfrmNewCourse.SetNewCourse(const Value: TStringList);
begin
  FNewCourse := Value;
end;

{ Introducing new course on click ADD event }
procedure TfrmNewCourse.btnAddClick(Sender: TObject);
var
  LCourse : TCourse;
begin
  try
    LCourse := TCourse.Create;
    LCourse.CourseName := edtCourseName.Text;
    if (LCourse.CourseName <> '') and (LCourse.CourseName <> ' ')
        and (LCourse.CourseName <> '  ') then
    begin
    {Course duration should be in between 0 and 25  months}
      if (StrToInt(edtDuration.Text) > 0) AND (StrToInt(edtDuration.Text) < 25) then
      begin
        LCourse.CourseDuration := StrToInt(edtDuration.Text);
        {get enum is present in typeinfo unit and returns string from enum TRating}
        LCourse.Ratings := GetEnumName(TypeInfo(TRating), Integer(comboxRatings.ItemIndex));
        FNewCourse.Sorted := True;
        FNewCourse.CaseSensitive := True;
        FNewCourse.Duplicates := dupError;

        FNewCourse.AddObject(LCourse.CourseName, LCourse);
        MessageDlg('Course Added Sucessfully!!',mtInformation,[mbOK], 0);

      end // inside if ends here
      else
      begin
        MessageDlg('Course Duration should be greater than 0 month and less than 24 months',mtWarning,[mbOK], 0);
      end; //inside else end here
    end // if for blank entry ends here
    else
    begin
      MessageDlg('Course name cannot be empty',mtWarning,[mbOK], 0);
    end;
  except
    on E : EStringListError do
  begin
    MessageDlg('Duplicate Entry Not allowed',mtWarning,[mbOK], 0);
    edtCourseName.Clear;
    edtDuration.Clear;
    comboxRatings.ItemIndex := -1;
  end;
  on E : Exception do
  begin
    MessageDlg('Illegal use of applicaion! Press Ok to Continue',mtError,[mbOK], 0);
    edtCourseName.Clear;
    edtDuration.Clear;
    comboxRatings.ItemIndex := -1;
  end;
  end;

  edtCourseName.Clear;
  edtDuration.Clear;
  comboxRatings.ItemIndex := -1;edtCourseName.Clear;
  edtDuration.Clear;
  comboxRatings.ItemIndex := -1;
end;

procedure TfrmNewCourse.edtDurationKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (Key in [#8, '0'..'9']) then      //#8 is backspace
  begin
    ShowMessage('Invalid Key pressed');
    Key := #0;
  end;
end;

end. // end of Introduce course NewCourse unit
