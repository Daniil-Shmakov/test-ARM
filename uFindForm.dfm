object PersonFindForm: TPersonFindForm
  Left = 0
  Top = 0
  BorderStyle = bsNone
  ClientHeight = 248
  ClientWidth = 697
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 41
    Width = 697
    Height = 207
    Align = alClient
    Caption = 'Panel1'
    TabOrder = 0
    ExplicitTop = 16
    ExplicitWidth = 737
    ExplicitHeight = 304
    object Panel3: TPanel
      Left = 1
      Top = 1
      Width = 695
      Height = 57
      Align = alTop
      TabOrder = 0
      ExplicitLeft = 2
      ExplicitTop = 111
      ExplicitWidth = 762
      object Label1: TLabel
        Left = 16
        Top = 20
        Width = 44
        Height = 13
        Caption = #1060#1072#1084#1080#1083#1080#1103
      end
      object SearchEdit: TEdit
        Left = 72
        Top = 16
        Width = 289
        Height = 21
        TabOrder = 0
        Text = 'SearchEdit'
      end
      object SearchButton: TButton
        Left = 367
        Top = 16
        Width = 75
        Height = 25
        Caption = 'SearchButton'
        TabOrder = 1
        OnClick = SearchButtonClick
      end
    end
    object DBGrid1: TDBGrid
      Left = 1
      Top = 58
      Width = 695
      Height = 148
      Align = alClient
      DataSource = DataSource1
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 697
    Height = 41
    Align = alTop
    Caption = #1053#1072#1081#1090#1080' '#1087#1072#1094#1080#1077#1085#1090#1072' '#1087#1086' '#1092#1072#1084#1080#1083#1080#1080
    TabOrder = 1
    ExplicitLeft = 232
    ExplicitWidth = 185
  end
  object ADOQuery1: TADOQuery
    Parameters = <>
    SQL.Strings = (
      'select * from persons where '
      'lower(name) like lower(:name)')
    Left = 640
    Top = 48
  end
  object DataSource1: TDataSource
    Left = 552
    Top = 48
  end
end
