object PersonFindForm: TPersonFindForm
  Left = 0
  Top = 0
  BorderStyle = bsNone
  ClientHeight = 248
  ClientWidth = 675
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object GridPanel: TPanel
    Left = 0
    Top = 25
    Width = 675
    Height = 223
    Align = alClient
    Caption = 'GridPanel'
    TabOrder = 0
    object SearchPanel: TPanel
      Left = 1
      Top = 1
      Width = 673
      Height = 34
      Align = alTop
      TabOrder = 0
      object NameLabel: TLabel
        AlignWithMargins = True
        Left = 4
        Top = 8
        Width = 44
        Height = 22
        Margins.Top = 7
        Align = alLeft
        Alignment = taCenter
        Caption = #1060#1072#1084#1080#1083#1080#1103
        ExplicitHeight = 13
      end
      object SearchButton: TSpeedButton
        Left = 346
        Top = 1
        Width = 80
        Height = 32
        Align = alLeft
        Caption = '  '#1055#1086#1080#1089#1082
        Flat = True
        Glyph.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000040000
          00160000001A0000001900000018000000160000001400000012000000100000
          000E0000000B0000000900000006000000040000000300000001000000080606
          06440A0A0A840202026B0000002F0000002C00000028000000240000001F0000
          001B00000016000000110000000C000000080000000500000002000000001919
          1974EADADAFF2A27279E01010144000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000001212
          124B38363690DDD1D1FF1C1B1B96010101330000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000D0D0D382C2B2B86CCC4C4FF1312128C0101012500000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000A0A0A2A2322227CBCB8B8FF0B0B0B830101012A010101560202
          0279020202870202027901010156000000160000000000000000000000000000
          000000000000000000000707071F1B1B1B73AFADADFF1716158766625EA5B7B2
          AEC4D1CCC7D6B9B5B1C56C6A69A91414147D0303032A00000000000000000000
          0000000000000000000000000000080808242222217BA59C92BEC1B7ADCBC7BF
          B8CEC7BFB8CEC7BFB8CECAC4BDD1A19D98B81C1B1B7403030314000000000000
          00000000000000000000000000000E0E0E49635D5797B3A392C3C3B9B2CBC7BF
          B8CEC7BFB8CEC7BFB8CEC7BFB8CEC7BFB7CE6B66619D0E0E0E49000000000000
          0000000000000000000000000000161616659C9082B1AF9E8DC0C7BFB8CEC7BF
          B8CEC7BFB8CEC7BFB8CEC7BFB8CEC7BFB8CEA79C92B816161665000000000000
          00000000000000000000000000001B1B1B6FAE9E8EBEAF9E8DC0AF9E8DC0C7BF
          B8CEC7BFB8CEC7BFB8CEC7BFB8CEC7BFB8CEB7A99BC51B1B1B6F000000000000
          00000000000000000000000000001919196097897BACAF9E8DC0AF9E8DC0AF9E
          8DC0AF9E8DC0AF9E8DC0AF9E8DC0AF9E8DC09F9387B219191960000000000000
          0000000000000000000000000000131313436059518EAF9E8DC0BDB2A7C8C7BF
          B8CEC7BFB8CEC7BFB8CEC7BFB8CEBEB3A8C8645D569113131343000000000000
          00000000000000000000000000000505051125242364867A6EA1B3A495C2C6BE
          B6CDC7BFB8CEC7BFB8CEC6BEB6CD8C8176A42624246405050511000000000000
          0000000000000000000000000000000000000A0A0A21262524626059518B9E92
          87AFBEB7AEC7A8A19AB565605A8E262524620A0A0A2100000000000000000000
          0000000000000000000000000000000000000000000006060611151515401E1E
          1E5A222222651E1E1E5A15151540060606110000000000000000}
        OnClick = SpeedButton1Click
        ExplicitLeft = 439
        ExplicitTop = 5
      end
      object SearchEdit: TEdit
        AlignWithMargins = True
        Left = 54
        Top = 4
        Width = 289
        Height = 26
        Align = alLeft
        AutoSize = False
        MaxLength = 250
        TabOrder = 0
        OnKeyPress = SearchEditKeyPress
      end
    end
    object ResultGrid: TDBGrid
      Left = 1
      Top = 35
      Width = 673
      Height = 187
      Align = alClient
      DataSource = DataSource
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      ReadOnly = True
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'Name'
          Title.Caption = #1060#1048#1054' '#1087#1072#1094#1080#1077#1085#1090#1072
          Width = 320
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'BirthDate'
          Title.Caption = #1044#1072#1090#1072' '#1088#1086#1078#1076#1077#1085#1080#1103
          Width = 89
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CreationDate'
          Title.Caption = #1044#1072#1090#1072' '#1074#1085#1077#1089#1077#1085#1080#1103
          Width = 139
          Visible = True
        end>
    end
  end
  object CaptionPanel: TPanel
    Left = 0
    Top = 0
    Width = 675
    Height = 25
    Align = alTop
    Caption = #1053#1072#1081#1090#1080' '#1087#1072#1094#1080#1077#1085#1090#1072' '#1087#1086' '#1092#1072#1084#1080#1083#1080#1080
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    ExplicitLeft = 8
    ExplicitTop = -1
  end
  object SearchADOQuery: TADOQuery
    Parameters = <
      item
        Name = 'Name'
        DataType = ftString
        Size = -1
        Value = Null
      end>
    Prepared = True
    SQL.Strings = (
      
        'select name, to_char(birthdate, '#39'dd.mm.yyyy'#39') as birthdate, to_c' +
        'har(creationdate, '#39'dd.mm.yyyy'#39') as creationdate from persons whe' +
        're '
      'lower(name) like lower(:name)')
    Left = 528
    Top = 112
  end
  object DataSource: TDataSource
    Left = 576
    Top = 32
  end
end
