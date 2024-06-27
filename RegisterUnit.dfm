object RegisterForm: TRegisterForm
  Left = 375
  Top = 177
  BorderStyle = bsDialog
  Caption = #20851#20110' '#27743#28246#34892'II( Game Paladin II)'
  ClientHeight = 215
  ClientWidth = 378
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 62
    Top = 13
    Width = 296
    Height = 24
    Caption = #27743#28246#34892'II(GamePaladinII)'
    Font.Charset = GB2312_CHARSET
    Font.Color = clNavy
    Font.Height = -24
    Font.Name = #38582#20070
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 24
    Top = 72
    Width = 168
    Height = 13
    Caption = 'CopyRight (C): 1999-2003'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 24
    Top = 48
    Width = 222
    Height = 13
    Caption = #29256#26412': II (2003) Build 1.85.77.74'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object author_lb: TLabel
    Left = 24
    Top = 96
    Width = 96
    Height = 13
    Caption = #20316#32773':XuGanQuan'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object myweb_lb: TLabel
    Left = 56
    Top = 120
    Width = 175
    Height = 13
    Cursor = crHandPoint
    Caption = 'http://www.AdvNetsoft.com'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = [fsUnderline]
    ParentFont = False
    OnClick = myweb_lbClick
  end
  object Label4: TLabel
    Left = 24
    Top = 120
    Width = 33
    Height = 13
    Caption = #20027#39029':'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel
    Left = 256
    Top = 48
    Width = 105
    Height = 13
    Caption = '('#31616#20307#20013#25991#20813#36153#29256')'
  end
  object Bevel1: TBevel
    Left = 8
    Top = 148
    Width = 361
    Height = 4
  end
  object Image1: TImage
    Left = 24
    Top = 8
    Width = 32
    Height = 32
    AutoSize = True
    Picture.Data = {
      055449636F6E0000010001002020100000000000E80200001600000028000000
      2000000040000000010004000000000080020000000000000000000000000000
      0000000000000000000080000080000000808000800000008000800080800000
      80808000C0C0C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000
      FFFFFF0000066666666666666666666666666000066666666666666666666666
      6666666006666666666666666666666666666660666666666666666666666666
      6666666666666666666666666666666666666666666666666666666666666666
      6666666666666666D6666666666D6666666666666666666DDD6666666DDDDD66
      666666666666666DDD66666DDDDDDD66666666666666666DDD66666D666DDDD6
      666666666666666DDD6666666666DDD6666666666666666DDD6666666666DDD6
      666666666666666DDD6666666666DDD6666666666666666DDD6666666666DDD6
      66666666666DDDDDDD6666666666DDD666666666666DDDDDDD6666666666DD66
      6666666666666DDDDD6666666666DD666DD666666666666DDDD6DDDDDDDDDDDD
      DDDD6666666666666DD66DDDDDDDDDDDDDDDD66666666DD666DD666666666666
      666666666666DDDDD6666666666666666666666666666DDDDD6666DDDDDDDDDD
      D666666666666666DDD6666DDDDDDDDDD66666666666666666DD666666666666
      6666666666666666666666666666666666666666666666666666666666666666
      6666666666666666666666666666666666666666666666666666666666666666
      6666666666666666666666666666666666666666066666666666666666666666
      6666666006666666666666666666666666666660000666666666666666666666
      66666000E0000007800000018000000100000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000008000000180000001
      E0000007}
  end
  object Close_bn: TButton
    Left = 288
    Top = 168
    Width = 75
    Height = 25
    Caption = #30830#23450
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnClick = Close_bnClick
  end
  object Panel1: TPanel
    Left = 16
    Top = 168
    Width = 185
    Height = 25
    BevelOuter = bvNone
    Caption = 'Powered by Delphi'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Courier New'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
  end
end
