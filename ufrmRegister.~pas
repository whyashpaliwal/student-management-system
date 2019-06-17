unit ufrmRegister;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, TypInfo, uclAllClasses;
  
type
  TfrmRegistration = class(TForm)
    pnlMain: TPanel;
    pnlRegister: TPanel;
    lblStream: TLabel;
    lblEducation: TLabel;
    lblAge: TLabel;
    lblName: TLabel;
    edtName: TEdit;
    comboxEducation: TComboBox;
    comboxStream: TComboBox;
    btnRegister: TButton;
    lblHeading: TLabel;
    edtAge: TEdit;
    procedure btnRegisterClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtAgeKeyPress(Sender: TObject; var Key: Char);
  private
    FRegList: TStringList;
    procedure SetRegList(const Value: TStringList);

  public
    { Public declarations }
  published
    property RegisterList : TStringList read FRegList write SetRegList;
end;

{==============================================================================}

implementation
uses ufrmMain;

{$R *.dfm}

procedure TfrmRegistration.FormCreate(Sender: TObject);
begin
  FRegList := TStringList.Create;
end;

procedure TfrmRegistration.SetRegList(const Value: TStringList);
begin
  FRegList := Value;
end;


procedure TfrmRegistration.btnRegisterClick(Sender: TObject);
var
  LStudent : TStudent;
begin
  try
    LStudent := TStudent.Create;
    LStudent.Name := edtName.Text;

    if (LStudent.Name <> '') and (LStudent.Name <> ' ') and (LStudent.Name <> '  ') then
    begin
      LStudent.Age := StrToInt(edtAge.Text);
      {GetEnumName is a function in TypeInfo unit which takes enum TEducation/Tstream
       and index to returns string}
      LStudent.Education := GetEnumName(TypeInfo(TEducation),
                                        Integer(comboxEducation.ItemIndex));
      LStudent.Stream := GetEnumName(TypeInfo(TStream),
                                     Integer(comboxStream.ItemIndex));

      FRegList.Sorted := True;
      FRegList.CaseSensitive := True;
      FRegList.Duplicates := dupError;
      FRegList.AddObject(LStudent.Name, LStudent);

      MessageDlg('Registered Sucessfully!',mtInformation,[mbOK], 0);
    end // if to check LStudent name ends here
    else
    begin
      MessageDlg('Student name cannot be empty',mtWarning,[mbOK], 0);
    end;
  except
    on E : EStringListError do
    begin
      MessageDlg('Duplicate Entry Not allowed',mtWarning,[mbOK], 0);
    end;
    on E : Exception do
    begin
      MessageDlg('Illegal use of application ! Press OK to continue.',mtError,[mbOK], 0);
    end;
  end;// try-except ends here

  edtName.Clear;
  edtAge.Clear;
  comboxEducation.ItemIndex := -1;
  comboxStream.ItemIndex := -1;

end;

procedure TfrmRegistration.edtAgeKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in [#8, '0'..'9']) then      //#8 is backspace
  begin
    ShowMessage('Invalid Key pressed');
    Key := #0;
  end;
end;


end. // end of unit
