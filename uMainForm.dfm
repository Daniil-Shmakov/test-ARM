object MainForm: TMainForm
  Left = 0
  Top = 0
  Caption = #1040#1056#1052
  ClientHeight = 662
  ClientWidth = 1008
  Color = clBtnFace
  Constraints.MinHeight = 680
  Constraints.MinWidth = 980
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIForm
  Menu = MainMenu1
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object MainMenu1: TMainMenu
    Left = 488
    Top = 200
    object N1: TMenuItem
      Action = ArmOperator
    end
    object N2: TMenuItem
      Action = ArmStatist
    end
  end
  object ActionList1: TActionList
    Left = 760
    Top = 80
    object ArmOperator: TAction
      Caption = 'ArmOperator'
      OnExecute = ArmOperatorExecute
    end
    object ArmStatist: TAction
      Caption = 'ArmStatist'
      OnExecute = ArmStatistExecute
    end
  end
end
