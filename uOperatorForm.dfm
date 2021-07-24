object OperatorForm: TOperatorForm
  Left = 0
  Top = 0
  Caption = #1040#1056#1052' '#1086#1087#1077#1088#1072#1090#1086#1088#1072
  ClientHeight = 606
  ClientWidth = 934
  Color = clBtnFace
  Constraints.MinHeight = 640
  Constraints.MinWidth = 940
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poOwnerFormCenter
  Visible = True
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object ArmOperatopPanel: TPanel
    Left = 0
    Top = 232
    Width = 934
    Height = 374
    Align = alBottom
    Caption = 'ArmOperatopPanel'
    TabOrder = 0
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 932
      Height = 49
      Align = alTop
      TabOrder = 0
      object AddButton: TButton
        AlignWithMargins = True
        Left = 1
        Top = 1
        Width = 104
        Height = 47
        Margins.Left = 0
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        Action = AddPerson
        Align = alLeft
        TabOrder = 0
      end
      object AddCertButton: TButton
        AlignWithMargins = True
        Left = 289
        Top = 1
        Width = 88
        Height = 47
        Margins.Left = 0
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        Action = Refresh
        Align = alLeft
        TabOrder = 1
      end
      object FindButton: TButton
        AlignWithMargins = True
        Left = 105
        Top = 1
        Width = 96
        Height = 47
        Margins.Left = 0
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        Action = FindPerson
        Align = alLeft
        TabOrder = 2
      end
      object Button2: TButton
        AlignWithMargins = True
        Left = 201
        Top = 1
        Width = 88
        Height = 47
        Margins.Left = 0
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        Action = AddSertificate
        Align = alLeft
        TabOrder = 3
      end
    end
    object SertPanel: TPanel
      Left = 544
      Top = 50
      Width = 389
      Height = 323
      Align = alClient
      Caption = 'SertPanel'
      TabOrder = 1
      object CertificatesGrid: TDBGrid
        Left = 1
        Top = 29
        Width = 387
        Height = 293
        Align = alClient
        DataSource = DataSource2
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'Certificate_name'
            ReadOnly = False
            Title.Caption = #1053#1072#1079#1074#1072#1085#1080#1077
            Width = 108
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Certificate_Text'
            Title.Caption = #1057#1086#1076#1077#1088#1078#1072#1085#1080#1077
            Width = 134
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Creation_date'
            Title.Caption = #1044#1072#1090#1072' '#1074#1099#1076#1072#1095#1080
            Width = 116
            Visible = True
          end>
      end
      object Panel1: TPanel
        Left = 1
        Top = 1
        Width = 387
        Height = 28
        Align = alTop
        Caption = #1057#1087#1080#1089#1086#1082' '#1074#1099#1076#1072#1085#1085#1099#1093' '#1089#1087#1088#1072#1074#1086#1082
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
      end
    end
    object EditPanel: TPanel
      Left = 1
      Top = 50
      Width = 543
      Height = 323
      Align = alLeft
      Caption = 'EditPanel'
      TabOrder = 2
      object Label3: TLabel
        Left = 8
        Top = 74
        Width = 97
        Height = 13
        Caption = #1044#1072#1090#1072' '#1079#1072#1085#1077#1089#1077#1085#1080#1103' '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 10
        Top = 40
        Width = 95
        Height = 13
        Caption = #1044#1072#1090#1072' '#1088#1086#1078#1076#1077#1085#1080#1103
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label1: TLabel
        Left = 8
        Top = 8
        Width = 84
        Height = 13
        Caption = #1060#1048#1054' '#1087#1072#1094#1080#1077#1085#1090#1072
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object PersonsGrid: TDBGrid
        Left = 1
        Top = 109
        Width = 541
        Height = 213
        Align = alBottom
        DataSource = DataSource1
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'ID'
            Title.Caption = #8470' '#1087'/'#1087
            Width = 40
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NAME'
            Title.Caption = #1060#1048#1054
            Width = 237
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'BIRTHDATE'
            Title.Caption = #1044#1072#1090#1072' '#1088#1086#1078#1076#1077#1085#1080#1103
            Width = 116
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CREATIONDATE'
            Title.Caption = #1044#1072#1090#1072' '#1074#1085#1077#1089#1077#1085#1080#1103
            Visible = True
          end>
      end
      object PersonNameEdit: TEdit
        Left = 120
        Top = 8
        Width = 393
        Height = 21
        Enabled = False
        TabOrder = 1
      end
      object SaveButton: TButton
        Left = 342
        Top = 45
        Width = 91
        Height = 58
        Action = SavePerson
        TabOrder = 2
      end
      object CreationDatePick: TDateTimePicker
        Left = 120
        Top = 72
        Width = 186
        Height = 21
        Date = 44398.552664409720000000
        Time = 44398.552664409720000000
        Enabled = False
        TabOrder = 3
      end
      object BirthDatePick: TDateTimePicker
        Left = 120
        Top = 40
        Width = 186
        Height = 21
        Date = 44398.552664409720000000
        Time = 44398.552664409720000000
        Enabled = False
        TabOrder = 4
      end
      object CancelButton: TButton
        Left = 431
        Top = 45
        Width = 91
        Height = 58
        Action = Cancel
        TabOrder = 5
      end
    end
  end
  object FindPanel: TPanel
    Left = 0
    Top = 0
    Width = 934
    Height = 232
    Align = alClient
    Caption = 'FindPanel'
    TabOrder = 1
    OnResize = FindPanelResize
  end
  object ActionList: TActionList
    Left = 664
    Top = 240
    object AddPerson: TAction
      Caption = 'AddPerson'
      OnExecute = AddPersonExecute
    end
    object FindPerson: TAction
      Caption = 'FindPerson'
      Enabled = False
      Visible = False
      OnExecute = FindPersonExecute
    end
    object AddSertificate: TAction
      Caption = 'AddCertificate'
      OnExecute = AddSertificateExecute
    end
    object SavePerson: TAction
      Caption = 'SavePerson'
      Enabled = False
      OnExecute = SavePersonExecute
    end
    object Refresh: TAction
      Caption = 'Refresh'
      OnExecute = RefreshExecute
    end
    object Cancel: TAction
      Caption = 'Cancel'
      OnExecute = CancelExecute
    end
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 760
    Top = 152
  end
  object ADOConnection1: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=OraOLEDB.Oracle.1;Password=password;Persist Security In' +
      'fo=True;User ID=hr;Data Source=orcl'
    LoginPrompt = False
    Provider = 'OraOLEDB.Oracle.1'
    Left = 792
    Top = 240
  end
  object ADOQuery1: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    AfterScroll = ADOQuery1AfterScroll
    Parameters = <>
    Prepared = True
    SQL.Strings = (
      'SELECT *  FROM '
      '(SELECT * FROM PERSONS ORDER BY CREATIONDATE DESC)'
      'WHERE ROWNUM <= 10'
      'ORDER BY ID')
    Left = 856
    Top = 144
  end
  object ADOQuery2: TADOQuery
    Connection = ADOConnection1
    DataSource = DataSource1
    Parameters = <
      item
        Name = 'Person_ID'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'select * from Certificates where Person_ID = :Person_ID')
    Left = 704
    Top = 152
  end
  object DataSource2: TDataSource
    DataSet = ADOQuery2
    Left = 840
    Top = 240
  end
end
