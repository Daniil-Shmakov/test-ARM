object AddCertForm: TAddCertForm
  Left = 0
  Top = 0
  Caption = 'AddCertForm'
  ClientHeight = 313
  ClientWidth = 592
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
    Top = 0
    Width = 592
    Height = 49
    Align = alTop
    Caption = 'Panel1'
    TabOrder = 0
    object Label3: TLabel
      Left = 21
      Top = 18
      Width = 74
      Height = 13
      Caption = #1060#1048#1054' '#1087#1072#1094#1080#1077#1085#1090#1072
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 49
    Width = 592
    Height = 264
    Align = alClient
    Caption = 'Panel2'
    TabOrder = 1
    ExplicitTop = 55
    object Label1: TLabel
      Left = 21
      Top = 9
      Width = 117
      Height = 13
      Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1089#1087#1088#1072#1074#1082#1080
    end
    object Label2: TLabel
      Left = 21
      Top = 51
      Width = 73
      Height = 13
      Caption = #1058#1077#1082#1089#1090' '#1089#1087#1088#1072#1074#1082#1080
    end
    object Edit1: TEdit
      Left = 144
      Top = 6
      Width = 337
      Height = 21
      TabOrder = 0
      Text = 'Edit1'
    end
    object Memo1: TMemo
      Left = 144
      Top = 48
      Width = 337
      Height = 89
      Lines.Strings = (
        'Memo1')
      TabOrder = 1
    end
    object Panel3: TPanel
      Left = 1
      Top = 222
      Width = 590
      Height = 41
      Align = alBottom
      Caption = 'Panel3'
      TabOrder = 2
      ExplicitLeft = 320
      ExplicitTop = 208
      ExplicitWidth = 185
      object OKButton: TButton
        Left = 434
        Top = 8
        Width = 75
        Height = 25
        Caption = 'OKButton'
        TabOrder = 0
        OnClick = OKButtonClick
      end
      object CancelButton: TButton
        Left = 515
        Top = 8
        Width = 75
        Height = 25
        Caption = 'Cancel'
        TabOrder = 1
      end
    end
  end
end
