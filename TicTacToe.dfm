object Form1: TForm1
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1050#1088#1077#1089#1090#1080#1082#1080'-'#1053#1086#1083#1080#1082#1080
  ClientHeight = 289
  ClientWidth = 504
  Color = clGreen
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Image1: TImage
    Left = 0
    Top = 0
    Width = 288
    Height = 288
    OnMouseDown = Image1MouseDown
  end
  object Label1: TLabel
    Left = 294
    Top = 16
    Width = 34
    Height = 28
    Caption = #1061#1086#1076':'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe Print'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 334
    Top = 16
    Width = 6
    Height = 28
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe Print'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 294
    Top = 104
    Width = 150
    Height = 28
    Caption = #1050#1086#1085#1077#1094' '#1080#1075#1088#1099' '#1095#1077#1088#1077#1079':'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe Print'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 334
    Top = 138
    Width = 17
    Height = 28
    Caption = '0:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe Print'
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel
    Left = 357
    Top = 138
    Width = 24
    Height = 28
    Caption = '59'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe Print'
    Font.Style = []
    ParentFont = False
  end
  object Label6: TLabel
    Left = 346
    Top = 16
    Width = 6
    Height = 28
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe Print'
    Font.Style = []
    ParentFont = False
  end
  object Label7: TLabel
    Left = 369
    Top = 262
    Width = 105
    Height = 23
    Caption = #169#1057#1072#1083#1072#1093#1086#1074' '#1048#1083#1100#1103
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe Print'
    Font.Style = []
    ParentFont = False
  end
  object MainMenu1: TMainMenu
    object N1: TMenuItem
      Caption = #1048#1075#1088#1072
      object N2: TMenuItem
        Caption = #1053#1086#1074#1072#1103
        OnClick = N2Click
      end
      object N8: TMenuItem
        Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
        OnClick = N8Click
      end
      object N3: TMenuItem
        Caption = #1047#1072#1082#1088#1099#1090#1100
        OnClick = N3Click
      end
    end
    object N6: TMenuItem
      Caption = #1054' '#1087#1088#1086#1075#1088#1072#1084#1084#1077
      object N5: TMenuItem
        Caption = #1055#1088#1072#1074#1080#1083#1072' '#1080#1075#1088#1099
      end
      object N7: TMenuItem
        Caption = #1054' '#1087#1088#1086#1075#1088#1072#1084#1084#1077'...'
      end
    end
  end
  object Timer1: TTimer
    Interval = 15
    OnTimer = Timer1Timer
    Left = 40
  end
  object Timer2: TTimer
    OnTimer = Timer2Timer
    Left = 80
  end
  object Timer3: TTimer
    Enabled = False
    Interval = 4000
    OnTimer = Timer3Timer
    Left = 120
  end
end
