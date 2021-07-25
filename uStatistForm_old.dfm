object StatistForm: TStatistForm
  Left = 0
  Top = 0
  Caption = #1040#1056#1052' '#1089#1090#1072#1090#1080#1089#1090#1072
  ClientHeight = 606
  ClientWidth = 904
  Color = clBtnFace
  Constraints.MinHeight = 640
  Constraints.MinWidth = 900
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Visible = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object ArmOperatopPanel: TPanel
    Left = 0
    Top = 232
    Width = 904
    Height = 374
    Align = alBottom
    Caption = 'ArmOperatopPanel'
    TabOrder = 0
    ExplicitWidth = 879
    object StartPeriodText: TLabel
      Left = 10
      Top = 93
      Width = 96
      Height = 13
      Caption = #1053#1072#1095#1072#1083#1086' '#1087#1077#1088#1080#1086#1076#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object EndPeriodtext: TLabel
      Left = 10
      Top = 125
      Width = 89
      Height = 13
      Caption = #1050#1086#1085#1077#1094' '#1087#1077#1088#1080#1086#1076#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object SearchTypeText: TLabel
      Left = 130
      Top = 60
      Width = 54
      Height = 13
      Alignment = taCenter
      Caption = #1055#1086#1080#1089#1082' '#1087#1086' '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBGrid1: TDBGrid
      Left = 3
      Top = 144
      Width = 521
      Height = 225
      DataSource = DataSource1
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 902
      Height = 49
      Align = alTop
      Caption = 'Panel2'
      TabOrder = 1
      ExplicitTop = -4
      ExplicitWidth = 877
      object Button1: TButton
        Left = 151
        Top = 1
        Width = 75
        Height = 47
        Action = FindPersonByCreationDate
        Align = alLeft
        TabOrder = 0
        ExplicitTop = 5
      end
      object Button2: TButton
        Left = 76
        Top = 1
        Width = 75
        Height = 47
        Action = FindPersonByBirthDate
        Align = alLeft
        TabOrder = 1
        ExplicitLeft = 176
        ExplicitTop = 24
        ExplicitHeight = 25
      end
      object Button3: TButton
        Left = 1
        Top = 1
        Width = 75
        Height = 47
        Action = Find
        Align = alLeft
        TabOrder = 2
        ExplicitLeft = 176
        ExplicitTop = 24
        ExplicitHeight = 25
      end
    end
    object DateTimePicker1: TDateTimePicker
      Left = 130
      Top = 85
      Width = 186
      Height = 21
      Date = 44398.552664409720000000
      Time = 44398.552664409720000000
      TabOrder = 2
    end
    object DateTimePicker2: TDateTimePicker
      Left = 130
      Top = 117
      Width = 186
      Height = 21
      Date = 44398.552664409720000000
      Time = 44398.552664409720000000
      TabOrder = 3
    end
    object SertPanel: TPanel
      Left = 554
      Top = 50
      Width = 349
      Height = 323
      Align = alRight
      Caption = 'SertPanel'
      TabOrder = 4
      ExplicitLeft = 529
      object DBGrid2: TDBGrid
        Left = 1
        Top = 1
        Width = 347
        Height = 321
        Align = alClient
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
    end
    object Button4: TButton
      Left = 368
      Top = 85
      Width = 75
      Height = 58
      Action = Find
      TabOrder = 5
    end
    object Button5: TButton
      Left = 441
      Top = 85
      Width = 75
      Height = 58
      Action = Cancel
      TabOrder = 6
    end
  end
  object FindPanel: TPanel
    Left = 0
    Top = 0
    Width = 904
    Height = 232
    Align = alClient
    Caption = 'FindPanel'
    TabOrder = 1
    ExplicitLeft = -1
    ExplicitTop = -4
    ExplicitWidth = 879
  end
  object ActionList1: TActionList
    Left = 352
    Top = 232
    object AddPerson: TAction
      Caption = 'AddPerson'
      Enabled = False
      Visible = False
    end
    object FindPersonByBirthDate: TAction
      Caption = 'FindPersonByBirthDate'
      OnExecute = FindPersonByBirthDateExecute
    end
    object FindPersonByCreationDate: TAction
      Caption = 'FindPersonByCreationDate'
      OnExecute = FindPersonByCreationDateExecute
    end
    object Find: TAction
      Caption = 'Find'
      Enabled = False
    end
    object Cancel: TAction
      Caption = 'Cancel'
    end
  end
  object DataSource1: TDataSource
    DataSet = ADOTable1
    Left = 680
    Top = 24
  end
  object ADOConnection1: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=OraOLEDB.Oracle.1;Password=password;Persist Security In' +
      'fo=True;User ID=hr;Data Source=orcl'
    LoginPrompt = False
    Provider = 'OraOLEDB.Oracle.1'
    Left = 808
    Top = 16
  end
  object ADOTable1: TADOTable
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    TableName = 'persons'
    Left = 760
    Top = 16
  end
end
