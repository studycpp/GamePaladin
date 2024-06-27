object MyCalcForm: TMyCalcForm
  Left = 348
  Top = 253
  BorderStyle = bsDialog
  Caption = #25105#30340#35745#31639#22120
  ClientHeight = 286
  ClientWidth = 421
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 16
  object Label1: TLabel
    Left = 143
    Top = 97
    Width = 53
    Height = 13
    Caption = #25805#20316#25968'1:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 144
    Top = 158
    Width = 53
    Height = 13
    Caption = #25805#20316#25968'2:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object inc1_sb: TSpeedButton
    Left = 208
    Top = 120
    Width = 41
    Height = 25
    Caption = '++'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    OnClick = inc1_sbClick
  end
  object Label3: TLabel
    Left = 127
    Top = 235
    Width = 40
    Height = 13
    Caption = #32467#26524':='
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object dec1_sb: TSpeedButton
    Left = 264
    Top = 120
    Width = 41
    Height = 25
    Caption = '- -'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    OnClick = dec1_sbClick
  end
  object not1_sb: TSpeedButton
    Left = 320
    Top = 120
    Width = 41
    Height = 25
    Caption = 'Not'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    OnClick = not1_sbClick
  end
  object AddDec1_sb: TSpeedButton
    Left = 376
    Top = 120
    Width = 41
    Height = 25
    Caption = '+/-'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    OnClick = AddDec1_sbClick
  end
  object adddec2_sb: TSpeedButton
    Left = 376
    Top = 176
    Width = 41
    Height = 25
    Caption = '+/-'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    OnClick = adddec2_sbClick
  end
  object inc2_sb: TSpeedButton
    Left = 208
    Top = 176
    Width = 41
    Height = 25
    Caption = '++'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    OnClick = inc2_sbClick
  end
  object dec2_sb: TSpeedButton
    Left = 264
    Top = 176
    Width = 41
    Height = 25
    Caption = '- -'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    OnClick = dec2_sbClick
  end
  object not2_sb: TSpeedButton
    Left = 320
    Top = 176
    Width = 41
    Height = 25
    Caption = 'Not'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    OnClick = not2_sbClick
  end
  object calc_sb: TSpeedButton
    Left = 15
    Top = 239
    Width = 108
    Height = 33
    Caption = #35745#31639
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    Glyph.Data = {
      36040000424D3604000000000000360000002800000010000000100000000100
      2000000000000004000000000000000000000000000000000000FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000404
      0400040404000404040004040400040404000404040004040400040404000404
      04000404040004040400040404000404040004040400FF00FF00808000008080
      0000800000008000000080000000800000008000000080000000800000008000
      000080000000800000008000000080000000800000000404040080800000FFFF
      FF00808000008080000080800000808000008080000080800000808000008080
      000080800000808000008080000080800000800000000404040080800000FFFF
      00008080000004040400FFFFFF0004040400FFFFFF0004040400FFFFFF000404
      0400FFFFFF00FFFFFF00C0C0C00004040400800000000404040080800000FFFF
      FF00808000008080000080800000808000008080000080800000808000008080
      000080800000808000008080000080800000800000000404040080800000FFFF
      00008080000004040400FFFFFF0004040400FFFFFF0004040400FFFFFF000404
      0400FFFFFF0004040400FFFFFF0004040400800000000404040080800000FFFF
      FF00808000008080000080800000808000008080000080800000808000008080
      000080800000808000008080000080800000800000000404040080800000FFFF
      000004040400C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C00080800000808000008080000080800000800000000404040080800000FFFF
      FF0004040400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0
      C00080800000808000008080000080800000800000000404040080800000FFFF
      0000040404000404040004040400040404000404040004040400040404000404
      040080800000808000008080000080800000800000000404040080800000FFFF
      FF00FFFF0000FFFFFF00FFFF0000FFFFFF00FFFF0000FFFFFF00FFFF0000FFFF
      FF00FFFF0000FFFFFF00FFFF0000FFFFFF008080000004040400FF00FF008080
      0000808000008080000080800000808000008080000080800000808000008080
      00008080000080800000808000008080000080800000FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
    ParentFont = False
    Spacing = 20
    OnClick = calc_sbClick
  end
  object Label4: TLabel
    Left = 158
    Top = 221
    Width = 46
    Height = 13
    Caption = #21313#36827#21046':'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel
    Left = 143
    Top = 255
    Width = 59
    Height = 13
    Caption = #21313#20845#36827#21046':'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 421
    Height = 81
    Align = alTop
    Caption = #25968#21046#36716#25442
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object dec_sb: TSpeedButton
      Left = 27
      Top = 48
      Width = 73
      Height = 25
      Caption = #21313#36827#21046'>>'
      OnClick = dec_sbClick
    end
    object hex_sb: TSpeedButton
      Left = 160
      Top = 48
      Width = 73
      Height = 25
      Caption = '<'#21313#20845#36827#21046'>'
      OnClick = hex_sbClick
    end
    object bin_sb: TSpeedButton
      Left = 312
      Top = 48
      Width = 73
      Height = 25
      Caption = '<<'#20108#36827#21046
      OnClick = bin_sbClick
    end
    object Dec_Edit: TEdit
      Left = 4
      Top = 20
      Width = 121
      Height = 21
      BevelInner = bvNone
      BevelKind = bkSoft
      BorderStyle = bsNone
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Courier New'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Text = '0'
    end
    object hex_Edit: TEdit
      Left = 130
      Top = 20
      Width = 121
      Height = 21
      BevelInner = bvNone
      BevelKind = bkSoft
      BorderStyle = bsNone
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Courier New'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      Text = '0'
    end
    object Bin_Edit: TEdit
      Left = 256
      Top = 20
      Width = 160
      Height = 21
      BevelInner = bvNone
      BevelKind = bkSoft
      BorderStyle = bsNone
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Courier New'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      Text = '0'
    end
  end
  object Num1_Edit: TEdit
    Left = 208
    Top = 95
    Width = 209
    Height = 21
    BevelInner = bvLowered
    BevelKind = bkSoft
    BevelOuter = bvNone
    BorderStyle = bsNone
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Courier New'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    Text = '0'
  end
  object NUm2_Edit: TEdit
    Left = 208
    Top = 152
    Width = 209
    Height = 21
    BevelInner = bvLowered
    BevelKind = bkSoft
    BevelOuter = bvNone
    BorderStyle = bsNone
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Courier New'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    Text = '$0'
  end
  object Op_rg: TRadioGroup
    Left = 5
    Top = 87
    Width = 134
    Height = 138
    Caption = #25805#20316
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ItemIndex = 0
    Items.Strings = (
      '+    '#21152
      '-    '#20943
      '*    '#20056
      '/    '#38500
      'mod  '#21462#20313
      'x^Y  '#26041)
    ParentFont = False
    TabOrder = 3
  end
  object Result1_Edit: TEdit
    Left = 208
    Top = 216
    Width = 209
    Height = 21
    BevelInner = bvLowered
    BevelKind = bkSoft
    BevelOuter = bvSpace
    BorderStyle = bsNone
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Courier New'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    Text = '0'
  end
  object Result2_Edit: TEdit
    Left = 208
    Top = 248
    Width = 209
    Height = 21
    BevelInner = bvLowered
    BevelKind = bkSoft
    BevelOuter = bvSpace
    BorderStyle = bsNone
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Courier New'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    Text = '0'
  end
end
