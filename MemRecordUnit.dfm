object MemRecordForm: TMemRecordForm
  Left = 313
  Top = 171
  BorderStyle = bsDialog
  Caption = #20869#23384#20219#21153':'#26032#24314#21644#32534#36753#35760#24405
  ClientHeight = 251
  ClientWidth = 396
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 16
  object Label1: TLabel
    Left = 8
    Top = 40
    Width = 33
    Height = 13
    Caption = #26631#35760':'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 8
    Top = 74
    Width = 33
    Height = 13
    Caption = #22320#22336':'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 8
    Top = 109
    Width = 33
    Height = 13
    Caption = #25968#25454':'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 10
    Top = 144
    Width = 33
    Height = 13
    Caption = #31867#22411':'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object MemRecord_info_LB: TLabel
    Left = 8
    Top = 171
    Width = 33
    Height = 13
    Caption = #20449#24687':'
    Color = clBtnFace
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object AddorMod_Sb: TSpeedButton
    Left = 8
    Top = 195
    Width = 145
    Height = 38
    Caption = #21152#20837#38145#23450#21015#34920
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    OnClick = AddorMod_SbClick
  end
  object close_sb: TSpeedButton
    Left = 334
    Top = 195
    Width = 55
    Height = 38
    Caption = #20851#38381
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    OnClick = close_sbClick
  end
  object modify_sb: TSpeedButton
    Left = 163
    Top = 195
    Width = 158
    Height = 38
    Caption = #30452#25509#20462#25913#20869#23384
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    OnClick = modify_sbClick
  end
  object Calc_sb: TSpeedButton
    Left = 310
    Top = 137
    Width = 33
    Height = 30
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
    OnClick = Calc_sbClick
  end
  object Help_sb: TSpeedButton
    Left = 350
    Top = 137
    Width = 33
    Height = 30
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
      FF00FF00FF00FF00FF00FF00FF00FF00FF0000000000B6B6B60000000000B6B6
      B600CECECE00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF0000000000FFAA0000FFFFFF00FFFFFF00FFFFFF00B6B6
      B600B6B6B600B6B6B600B6B6B600CECECE00FF00FF00FF00FF00FF00FF00FF00
      FF0000000000B97A0000B97A0000B97A000000000000FFFFFF00FFFFFF000000
      0000B6B6B600CECECE00FF00FF00FF00FF00FF00FF00FF00FF0000000000B97A
      0000B97A0000B97A0000B97A0000B97A0000FFAA0000FFFFFF00FFFFFF00FFFF
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00B97A
      0000B97A0000B97A0000B97A0000B97A0000B97A000000000000FFFFFF00FFFF
      FF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000
      0000B97A0000B97A0000B97A0000B97A0000B97A0000FFAA0000FFFFFF00FFFF
      FF00FFFFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00B97A0000B97A0000B97A0000B97A0000B97A0000B97A000000000000FFFF
      FF00FFFFFF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF0000000000B97A0000B97A0000FFD48E00B97A0000B97A0000FFAA0000FFFF
      FF00FFFFFF00FFFFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00B97A0000B97A0000B97A0000B97A0000B97A0000B97A00000000
      0000FFFFFF00FFFFFF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF0000000000B97A0000B97A0000FFD48E00FFD48E00B97A0000FFAA
      0000FFFFFF00FFFFFF00FFFFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00B97A0000B97A0000B97A0000B97A0000FFD48E00B97A
      000000000000FFFFFF00FFFFFF0000000000FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF0000000000B97A0000B97A0000B97A0000FFD48E00B97A
      0000FFAA0000FFFFFF00FFFFFF00FFFFFF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00B97A0000B97A0000FFD48E00B97A0000B97A
      0000B97A000000000000FFFFFF00FFFFFF0000000000FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF0000000000B97A0000B97A0000B97A0000B97A
      0000B97A0000FFAA0000FFFFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00B97A0000B97A0000B97A0000B97A
      0000B97A0000B97A000000000000FF00FF00FF00FF00FF00FF00}
    ParentFont = False
    OnClick = Help_sbClick
  end
  object mem_sb: TSpeedButton
    Left = 207
    Top = 137
    Width = 89
    Height = 29
    Caption = #20869#23384
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
      FF00FF00FF000000000066333300999999009999990099999900FF00FF00FF00
      FF00000000000000AA009999990099999900FF00FF00FF00FF00FF00FF000000
      0000FF999900FF99990066333300663333009999990099999900000000006666
      CC006666CC000000AA00000099009999990099999900FF00FF00FF999900FF99
      9900FF999900FF9999006633330066333300663333006666CC006666CC006666
      CC006666CC000000AA000000AA000000AA009999990099999900FF999900FF99
      9900FF999900FF999900444444006633330033000000333399006666CC006666
      CC006666CC000000AA00000099000000AA0000000000FF00FF00FF999900FF99
      9900FF999900FF99990044444400663333003300000033339900333399006666
      CC006666CC000000AA00000099000000AA0000000000FF00FF00FF999900FF99
      9900FFFFFF00FFCCCC00FFCCCC006633330055000000000000000099FF009999
      FF006666CC009999FF00000099000000AA0000000000FF00FF00FFFFFF00FFCC
      CC00FFCCCC00FFCCCC00FFCCCC000000000000CCFF0000CCFF000099FF000099
      FF006666CC006666CC009999FF000000990000000000FF00FF0000000000FFCC
      CC00FFCCCC00DDDDDD0000CCFF0000CCFF0000CCFF0000CCFF000099FF000099
      FF000099FF006666CC006666CC006666CC0000000000FF00FF00FF00FF000000
      0000FFCCCC00FFCCCC0000CCFF0000CCFF0000CCFF0000CCFF000099FF000099
      FF000099FF000000000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00000000000000000000CCFF0000CCFF0000CCFF0000CCFF000099FF000099
      FF000099FF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF0000CCFF0000CCFF00FFFFFF0000FFFF0000FFFF000099
      FF000099FF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FFFFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF000099FF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF000000000000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF000000000000FFFF0000FFFF0000FFFF000000
      0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000000000FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
    ParentFont = False
    OnClick = mem_sbClick
  end
  object Name_CB: TComboBox
    Left = 64
    Top = 37
    Width = 122
    Height = 24
    BevelInner = bvSpace
    BevelKind = bkSoft
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Courier New'
    Font.Style = []
    ItemHeight = 16
    ParentFont = False
    TabOrder = 0
    Text = 'Money'
    Items.Strings = (
      'Money'
      'Gold'
      'lumber'
      'Stone'
      'Hp'
      'Mp'
      '...')
  end
  object Address_Edit: TEdit
    Left = 64
    Top = 71
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
    Text = '00400000'
    OnChange = Lock_valuetype_cbChange
  end
  object value_edit: TEdit
    Left = 64
    Top = 105
    Width = 120
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
  object Lock_valuetype_cb: TComboBox
    Left = 63
    Top = 140
    Width = 121
    Height = 24
    BevelInner = bvSpace
    BevelKind = bkSoft
    Style = csDropDownList
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Courier New'
    Font.Style = []
    ItemHeight = 16
    ItemIndex = 0
    ParentFont = False
    TabOrder = 3
    Text = 'Byte Type'
    OnChange = Lock_valuetype_cbChange
    Items.Strings = (
      'Byte Type'
      'Word Type'
      'DWord Type'
      'Int64 Type'
      'Single'
      'Double'
      'Text')
  end
  object LockType_Rg: TRadioGroup
    Left = 208
    Top = 32
    Width = 177
    Height = 89
    Caption = #38145#23450#27169#24335
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ItemIndex = 0
    Items.Strings = (
      #33258#21160#38145#23450
      #25163#21160#38145#23450)
    ParentFont = False
    TabOrder = 4
  end
  object TaskName_Edit: TEdit
    Left = 1
    Top = 5
    Width = 392
    Height = 24
    BevelKind = bkFlat
    BevelOuter = bvRaised
    BorderStyle = bsNone
    Color = clBtnFace
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    Text = #20219#21153#21517#31216':'
  end
end
