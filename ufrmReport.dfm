object frmReport: TfrmReport
  Left = 321
  Top = 183
  Width = 634
  Height = 436
  BorderWidth = 1
  Caption = 'Student Management System >> Report'
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object lbldisplay: TLabel
    Left = 24
    Top = 24
    Width = 305
    Height = 33
    Alignment = taCenter
    AutoSize = False
    Caption = 'Display '
    Color = 5855577
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -19
    Font.Name = 'Century'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Layout = tlCenter
  end
  object lblOptions: TLabel
    Left = 352
    Top = 24
    Width = 241
    Height = 33
    Alignment = taCenter
    AutoSize = False
    Caption = 'Options'
    Color = 5855577
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -19
    Font.Name = 'Century'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Layout = tlCenter
  end
  object memoDisplay: TMemo
    Left = 24
    Top = 64
    Width = 305
    Height = 313
    BevelInner = bvLowered
    BevelOuter = bvRaised
    Color = 16316664
    Font.Charset = ANSI_CHARSET
    Font.Color = 4802889
    Font.Height = -13
    Font.Name = 'Roboto'
    Font.Style = []
    ParentFont = False
    ScrollBars = ssVertical
    TabOrder = 0
  end
  object pnlOptions: TPanel
    Left = 352
    Top = 72
    Width = 241
    Height = 305
    BevelInner = bvLowered
    BevelWidth = 2
    BorderWidth = 1
    Color = 4802889
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindow
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object lblOp1: TLabel
      Left = 8
      Top = 56
      Width = 145
      Height = 25
      Alignment = taCenter
      AutoSize = False
      Caption = 'Show Full Student List'
      Color = 16316664
      Font.Charset = ANSI_CHARSET
      Font.Color = clMenuText
      Font.Height = -12
      Font.Name = 'Century'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Layout = tlCenter
    end
    object lblOp2: TLabel
      Left = 8
      Top = 88
      Width = 145
      Height = 25
      Alignment = taCenter
      AutoSize = False
      Caption = 'Show Full CourseList'
      Color = 16316664
      Font.Charset = ANSI_CHARSET
      Font.Color = clMenuText
      Font.Height = -12
      Font.Name = 'Century'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Layout = tlCenter
    end
    object lblOp3: TLabel
      Left = 8
      Top = 152
      Width = 225
      Height = 25
      Alignment = taCenter
      AutoSize = False
      Caption = 'Generate Report'
      Color = 16316664
      Font.Charset = ANSI_CHARSET
      Font.Color = clMenuText
      Font.Height = -16
      Font.Name = 'Century'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Layout = tlCenter
    end
    object Label1: TLabel
      Left = 8
      Top = 187
      Width = 83
      Height = 22
      Alignment = taCenter
      AutoSize = False
      Caption = 'Select Student'
      Color = 16316664
      Font.Charset = ANSI_CHARSET
      Font.Color = clMenuText
      Font.Height = -11
      Font.Name = 'Century'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Layout = tlCenter
    end
    object btnShowCourses: TButton
      Left = 158
      Top = 88
      Width = 75
      Height = 25
      Cursor = crHandPoint
      Hint = 'Display available courses'
      Caption = 'CourseList'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindow
      Font.Height = -13
      Font.Name = 'Roboto'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = btnShowCoursesClick
    end
    object btnShowStudents: TButton
      Left = 158
      Top = 56
      Width = 75
      Height = 25
      Cursor = crHandPoint
      Hint = 'Display all students'
      Caption = 'StudentList'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindow
      Font.Height = -13
      Font.Name = 'Roboto'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = btnShowStudentsClick
    end
    object comboxStudentName: TComboBox
      Left = 96
      Top = 187
      Width = 137
      Height = 22
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Roboto'
      Font.Style = []
      ItemHeight = 14
      ParentFont = False
      TabOrder = 2
    end
    object btnReport: TButton
      Left = 40
      Top = 216
      Width = 75
      Height = 25
      Cursor = crHandPoint
      Hint = 'Show student details'
      Caption = 'SHOW'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindow
      Font.Height = -15
      Font.Name = 'Roboto'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnClick = btnReportClick
    end
    object btnClear: TButton
      Left = 120
      Top = 216
      Width = 75
      Height = 25
      Cursor = crHandPoint
      Hint = 'Reset display'
      Caption = 'CLEAR'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindow
      Font.Height = -15
      Font.Name = 'Roboto'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      OnClick = btnClearClick
    end
  end
end
