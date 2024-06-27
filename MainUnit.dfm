object MainForm: TMainForm
  Left = 197
  Top = 155
  Width = 684
  Height = 460
  AlphaBlend = True
  Caption = #27743#28246#34892'II (Game Paladin II)'
  Color = clBtnFace
  DefaultMonitor = dmMainForm
  DockSite = True
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object MainPageControl: TPageControl
    Left = 0
    Top = 49
    Width = 676
    Height = 384
    ActivePage = MemoryScan_TS
    Align = alClient
    MultiLine = True
    TabOrder = 0
    object MyFavorites_TS: TTabSheet
      Caption = 'My Favorites'
      TabVisible = False
    end
    object MemoryScan_TS: TTabSheet
      Caption = 'Memory Scan'
      ImageIndex = 1
      TabVisible = False
      object Splitter1: TSplitter
        Left = 153
        Top = 0
        Height = 374
      end
      object temp_Panel1: TPanel
        Left = 0
        Top = 0
        Width = 153
        Height = 374
        Align = alLeft
        BevelInner = bvRaised
        BevelOuter = bvLowered
        Caption = 'temp_Panel1'
        ParentShowHint = False
        ShowHint = False
        TabOrder = 0
        object ToolBar1: TToolBar
          Left = 2
          Top = 2
          Width = 149
          Height = 24
          AutoSize = True
          ButtonWidth = 81
          Caption = 'ToolBar1'
          Color = clBtnFace
          EdgeOuter = esRaised
          Flat = True
          Images = MainImageList
          List = True
          ParentColor = False
          ShowCaptions = True
          TabOrder = 0
          TabStop = True
          Transparent = True
          object newtask_TB: TToolButton
            Left = 0
            Top = 0
            AutoSize = True
            Caption = #26032#24314'(&N)'
            DropdownMenu = AddNew
            ImageIndex = 8
            Style = tbsDropDown
            OnClick = newtask_TBClick
          end
          object deltask_tb: TToolButton
            Left = 91
            Top = 0
            AutoSize = True
            Caption = #21024#38500
            ImageIndex = 9
            OnClick = deltask_tbClick
          end
        end
        object Panel2: TPanel
          Left = 2
          Top = 26
          Width = 149
          Height = 346
          Align = alClient
          BevelOuter = bvNone
          Caption = 'mmPanel3'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = #23435#20307
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          object tasks_LV: TListView
            Left = 0
            Top = 0
            Width = 149
            Height = 346
            Align = alClient
            BevelInner = bvNone
            BevelOuter = bvRaised
            Columns = <
              item
                AutoSize = True
                Caption = #20869#23384#20219#21153#21015#34920
                MinWidth = 70
              end>
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = #23435#20307
            Font.Style = [fsBold]
            GridLines = True
            HideSelection = False
            RowSelect = True
            ParentFont = False
            PopupMenu = taskListPopupMenu
            ShowWorkAreas = True
            TabOrder = 0
            ViewStyle = vsReport
            OnClick = tasks_LVClick
            OnEdited = tasks_LVEdited
          end
        end
      end
      object Panel1: TPanel
        Left = 156
        Top = 0
        Width = 512
        Height = 374
        Align = alClient
        BevelInner = bvSpace
        BevelOuter = bvLowered
        TabOrder = 1
        object Splitter2: TSplitter
          Left = 2
          Top = 188
          Width = 508
          Height = 6
          Cursor = crVSplit
          Align = alTop
          Color = clBtnFace
          MinSize = 12
          ParentColor = False
        end
        object Panel4: TPanel
          Left = 2
          Top = 60
          Width = 508
          Height = 128
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object Scan_Gauge: TGauge
            Left = 0
            Top = 0
            Width = 508
            Height = 3
            Align = alTop
            BackColor = clBtnFace
            BorderStyle = bsNone
            ForeColor = clTeal
            Progress = 100
            ShowText = False
          end
          object Found_LV: TListView
            Left = 0
            Top = 3
            Width = 508
            Height = 125
            Align = alClient
            AllocBy = 1000
            Columns = <
              item
                AutoSize = True
                Caption = #22320#22336
                MinWidth = 55
              end
              item
                AutoSize = True
                Caption = 'Byte'
                MinWidth = 55
              end
              item
                AutoSize = True
                Caption = 'Word'
                MinWidth = 55
              end
              item
                AutoSize = True
                Caption = 'DWord'
                MinWidth = 55
              end
              item
                AutoSize = True
                Caption = 'Int64'
                MinWidth = 55
              end
              item
                AutoSize = True
                Caption = 'Single'
                MinWidth = 55
              end
              item
                AutoSize = True
                Caption = 'Double'
                MinWidth = 55
              end
              item
                AutoSize = True
                Caption = 'Text'
                MinWidth = 50
              end>
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #23435#20307
            Font.Style = []
            ReadOnly = True
            RowSelect = True
            ParentFont = False
            PopupMenu = FoundPopMenu
            TabOrder = 0
            ViewStyle = vsReport
            OnDblClick = Found_LVDblClick
            OnMouseDown = Found_LVMouseDown
          end
        end
        object MainPanel2: TPanel
          Left = 2
          Top = 2
          Width = 508
          Height = 58
          Align = alTop
          BevelInner = bvRaised
          BevelOuter = bvLowered
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabOrder = 1
          DesignSize = (
            508
            58)
          object Scan_bn: TSpeedButton
            Left = 304
            Top = 4
            Width = 75
            Height = 28
            Anchors = [akLeft, akTop, akBottom]
            Caption = #25628#32034'(&M)'
            Flat = True
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #23435#20307
            Font.Style = []
            Glyph.Data = {
              36050000424D3605000000000000360400002800000010000000100000000100
              080000000000000100000000000000000000000100000001000000000000FFFF
              FF00787599008380A3007F7AA5006C666E00D698DA00A087A00083407900A357
              8F00D78EB200636162008A536D00B47290009F657D00A36B7D00B97C8C00C88B
              9B00C0949B00A88387009D696D00996666009D6A6A00A16E6E00A57272009B6B
              6B00A3717100A97676009F6F6F00A6767600B4818100825D5D00B6838300B885
              8500B5838300785757009E737300805D5D0083606000C18E8E00B2838300C794
              9400C6939300CB989800C9969600B0878700B5929200614F4F00C7A4A4007561
              61006C5C5C00A6A4A40074737300B6B5B500B17F7E00BE8B8A00A7757200A372
              6F00AD7C7900BC898600AF807B00AA7C7700BB8F8A00C99A9400CC9E9700BB92
              8A00D1A49A00C2918300B68D8000D4A49300C4988500C39B8A00D5B4A400DEAF
              9100CAA58E00DAB39B00E1BBA300D0AC9300C8A79100E7B79500F1BF9600EAC3
              A000E3C9B100FFCE9B00FFD19E00FFD2A000F8D1A500E0C4A600FFD4A100FFD5
              A200FFD6A300FBD3A300FFD8A900FFD9AA00F7D3A700F5D2A900EBCDA800D7C1
              A800FFD7A400FFD9A600F9D5A500FFDAAB00FFDDB000FFDBA800FFDCA900FFDD
              AA00FFDDAC00FFE1B500FFDEAB00FFDFAC00FFE0AD00FFE3B700FFE5BD00FFE1
              AE00FFE2AF00FFE3B000FFE4B600FFE5B800EED6AE00FFE8BE00FFE4B100FFE5
              B200FFE6B300FFEAC200FFF1D600FFE7B400FFE8B500FFE8B700FFE9BA00FFEE
              CA00FFF0D100FFEAB700FFEBB800FFEBBA00FBE8B800FFECBD00FFECBF00FFEE
              C300F4E4BC00FFEEC600ECE0C300FFECB900FFEDBA00FFEEBF00FFF2CD00FDF6
              E200FFEEBB00FFEFBC00FFF1C400FFF2CA00FFF0BD00FFF1BE00FFF5D400FFFA
              E800FFFDF600FFF2BF00FFF3C000FFF4C700FFF7D800FFFDF500FFF4C100FFF6
              CD00FFF7D100FFF8D900FFF9DE00FAF7E900FFF5C200FFF6C300F9F1C500F7F0
              CA00FFF8D300F4EECD00FFF8C500F3EDC400FFFDEF00FFFDF000FFF9C600FFFA
              C700FFFBC800FFFBD300FFFCD500FFFCC900FFFCD000FFFCD200FFFDD700FFFD
              DA00FFFDCA00FFFDCC00FFFECB00FFFFCC00FFFFCF00FFFFD100FFFFD300FFFF
              D500FFFFD600FFFFD900FFFFDB00FFFFDC00FFFFDF00FFFFE100FFFFE200FFFF
              E500FFFFE600FFFFE900FFFFEA00FFFFED00FFFFEE00FFFFF000FFFFF300FFFF
              F400FFFFF700FFFFF800FFFFFA00FFFFFD000000000061C7FF0051B7FF0055BB
              FF0059ACE2006FC2F90065B8F40042A8FF004F9BE900BBC1C7003694F600408C
              DB0064686D00676B7000407DD20064666A0095969800496AB5004E6AA700526D
              AA005F6DAA008294FF008A9CFD008B8B8B00848484007B7B7B006B6B6B005E5E
              5E00000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000DF2FF1EDDFDF
              DFDFDFDFDFDFDFDFDFDF2F0213F1EDDFDFDFDFDFDFDFDFDFDFDFDCE10413F1ED
              DFDFDFDFDFDFDFDFDFDFEBD8E10413F1EDDFDFDFDFDFDFDFDFDFDFEBD8E1042D
              F1EDDFDFDFDFDFDFDFDFDFDFEBD9E404130505050505EDDFDFDFDFDFDFEBD8E1
              EDEF464D52483405DFDFDFDFDFDFEBEB2D5F9DB6C4C5911305DFDFDFDFDFDF4D
              609BA7C3CBD301AB31EDDFDFDFDFDF489478B0C4CDD4D2C44705DFDFDFDFDF4D
              A169A6C2C9CDCAC34D05DFDFDFDFDF489D7593BDC2C4C3B64D05DFDFDFDFDF48
              A17C6F97A6B0A7AC44EDDFDFDFDFDF4B8C0199886D73965F24DFDFDFDFDFDFDF
              48AB99A1929D5641DFDFDFDFDFDFDFDFDF48484A4C4BEDDFDFDF}
            ParentFont = False
            ParentShowHint = False
            ShowHint = False
            Transparent = False
            OnClick = Scan_bnClick
          end
          object InputHelp_SB: TSpeedButton
            Left = 162
            Top = 6
            Width = 24
            Height = 24
            Flat = True
            Glyph.Data = {
              36050000424D3605000000000000360400002800000010000000100000000100
              080000000000000100000000000000000000000100000001000000000000FFFF
              FF0000000000FFFBFF00F7F3F700EFEBEF00FFF3F700FFEFEF00F7E7E700FFF7
              F700F7EFEF00EFE7E700FFD7D600B296950053464500EFCBC600DED7D600F7DB
              D600FFE3DE00FFEBE700E7D3CE00F7D7CE00FFDFD600DECBC600E7C7BD00EFB2
              9C00DEBAAD00E7CFC600EFD7CE00F7DFD600FFE7DE00FFF3EF00F7EBE700C686
              6B00B5928400C6A29400EFE3DE00E7DBD600BD5D3100D6693900C6653900DE71
              4200D6714200CE6D4200DE794A00D6754A00FF9A6B00DE9A7B00EFAA8C00D69E
              8400E7AE9400DEAA9400EFC7B500BDA69C00EFD3C600F7DBCE00FFE3D600BDB2
              AD00CE653100C6613100D66D3900CE693900C6693900DE754200BD653900E77D
              4A00CE714200EF865200E7825200F78E5A00EF8A5A00FF966300EF926300F79A
              6B00BD755200FFA27300C67D5A00D68A6300FFA67B00DE926B00CE866300EFA2
              7B00BD866B00D69A7B00C68E7300FFBE9C00B58E7B00DEB29C00EFC3AD00FFD3
              BD00E7CBBD00FFEFE700BD5D2900CE693100C6653100D6713900CE6D3900DE79
              4200D6754200E7824A00F7925A00D6825200FF9A6300D6865A00EF9E7300CE8A
              6300CE8E6B00BD826300D6967300FFB68C00DE9E7B00C6967B00D6A68C00F7C7
              AD00FFCFB500DEBEAD00E7C7B500EFCFBD00F7E7DE00E78E5A00FFA26B00FFAE
              7B00FFAA7300FFB68400CEA68C00EFDBCE00F7E3D600FFEBDE00D6C7BD00FFB2
              7B00FFBE8C00FFBA8400FFDFC600FFC79400FFF7EF00FFFBF700F7F3EF00FFD7
              AD00FFD39C00FFD7A500FFDFAD00FFEFD600FFEBB500FFF3C600FFFBD600FFFB
              C600FFFFE700FFFFEF00DEDFDE00D6D7D600CECFCE00BDBEBD00F7F7F700EFEF
              EF00E7E7E700FFFFFF0000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              000000000000000000000000000000000000000000000000000096969696960E
              0E0E0E0E0E969696969696969656227E2424767E350E0E969696969635760625
              57701805047E5A0E969696352001545C5C575C5C310476800E969635012B5C5C
              2301445C5C6C877E0E9635036E5C3A3A3D4D3A3A5C5C5A0A170E80093B5C3A5C
              5076275C3A5C42015A0E801D5C3A3A5C6503325C5C3A5C071D0E80153A3A3A3A
              5C3309685C3A5C88240E805B273A3A5C5C5C1B01273A3D031D0E800149276A20
              655C6C01775C4801800E96807F434498011A0198295F1F080E969680018D7A30
              2499084E45370180969696968001018F8C8A8589010180969696969696808001
              0101010317809696969696969696961780808080969696969696}
            Transparent = False
            OnClick = InputHelp_SBClick
          end
          object backtogame_bn: TSpeedButton
            Left = 409
            Top = 4
            Width = 86
            Height = 28
            Anchors = [akTop, akRight, akBottom]
            Caption = #36820#22238#28216#25103
            Flat = True
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #23435#20307
            Font.Style = []
            Glyph.Data = {
              76060000424D7606000000000000360000002800000014000000140000000100
              200000000000400600000000000000000000000000000000000000000000FFFF
              FF8FFFFFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFEFFFFFFF8F00000000FFFFFF8FD0E8D0FF289228FF0B810BFF0F830FFF1284
              12FF158515FF138613FF138A13FF138F13FF0E970EFF0B9B0BFF099E09FF069B
              06FF04A004FF019D01FF009400FF1F921FFFCFE4CFFFFFFFFF8FFFFFFFEF28A2
              28FF139F13FF19A019FF20A520FF24A524FF26A726FF24A824FF24AB24FF23B0
              23FF1EBB1EFF19C119FF15C315FF10C610FF0AC80AFF04C504FF01BA01FF00A5
              00FF1F901FFFFFFFFFEFFFFFFFFF0DA70DFF1BAD1BFF26B126FF2EB32EFF32B5
              32FF33B633FF33B833FF33BC33FF31C031FF2ACC2AFF24D224FF1ED71EFF16DA
              16FF10DA10FF07D707FF03CE03FF00B800FF009100FFFFFFFFFFFFFFFFFF13AD
              13FF25B325FF30B730FF37B937FF3DBB3DFF3DBD3DFF3DBE3DFF3DC23DFFA7E6
              A7FFFFFFFFFF2DDA2DFF24DF24FF1DE21DFF15E315FF0CE00CFF06D806FF03C4
              03FF019B01FFFFFFFFFFFFFFFFFF18AE18FF2DB62DFF39BA39FF41BD41FF45BE
              45FF45BF45FF44C144FF44C544FFFFFFFFFFFFFFFFFFFFFFFFFF2BE32BFF23E6
              23FF1AE81AFF11E411FF0ADA0AFF06C706FF039E03FFFFFFFFFFFFFFFFFF1EB0
              1EFF35B935FF41BD41FF48BF48FF4CC04CFF4BC14BFF4AC24AFF49C649FF47CB
              47FFFFFFFFFFFFFFFFFFFFFFFFFF25E625FF1CE71CFF15E315FF10DA10FF0CC7
              0CFF079D07FFFFFFFFFFFFFFFFFF25B325FF3DBB3DFF48BF48FF4DC14DFF51C3
              51FF50C350FF4CC34CFF4CC64CFF49CB49FF3ED53EFFFFFFFFFFFFFFFFFFFFFF
              FFFF1FE31FFF1AE01AFF17D717FF13C413FF0B9B0BFFFFFFFFFFFFFFFFFF31B7
              31FF4CC14CFF55C455FF58C458FF58C558FF56C556FF51C451FF4DC54DFF49C7
              49FF3CCD3CFF35D135FFFFFFFFFFFFFFFFFFFFFFFFFF21D121FF21CC21FF20BC
              20FF139813FFFFFFFFFFFFFFFFFF38B938FF53C353FF5BC65BFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFF26C526FF24B724FF179417FFFFFFFFFFFFFFFFFF3CBB
              3CFF5BC65BFF62C862FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF29BF29FF28B2
              28FF1A911AFFFFFFFFFFFFFFFFFF46BE46FF63C963FF69CB69FF67CA67FF62C8
              62FF5DC75DFF55C555FF4DC24DFF46C046FF37BE37FF30BD30FFFFFFFFFFFFFF
              FFFFFFFFFFFF28BC28FF2CBA2CFF2AAE2AFF1C8D1CFFFFFFFFFFFFFFFFFF47BF
              47FF6CCC6CFF72CE72FF6ECD6EFF67CA67FF60C860FF59C659FF51C351FF49C0
              49FF39BC39FFFFFFFFFFFFFFFFFFFFFFFFFF28B828FF2BB82BFF2EB72EFF2BAB
              2BFF1D8B1DFFFFFFFFFFFFFFFFFF4DC14DFF76CF76FF7BD17BFF75CF75FF6CCC
              6CFF65CA65FF5CC75CFF55C455FF4DC24DFFFFFFFFFFFFFFFFFFFFFFFFFF2DB7
              2DFF2DB72DFF2DB72DFF2FB62FFF2CA92CFF1D8A1DFFFFFFFFFFFFFFFFFF53C3
              53FF7FD27FFF86D586FF7ED27EFF73CE73FF6ACB6AFF61C861FF5AC55AFFFFFF
              FFFFFFFFFFFFFFFFFFFF3ABA3AFF36B936FF33B833FF32B732FF31B531FF2CA9
              2CFF1C891CFFFFFFFFFFFFFFFFFF5BC65BFF8DD78DFF95DA95FF8AD68AFF7DD1
              7DFF75CF75FF6CCC6CFF65C965FFB7E6B7FFFFFFFFFF4DC14DFF4BC04BFF45BE
              45FF40BC40FF3ABA3AFF33B533FF2AA92AFF188718FFFFFFFFFFFFFFFFFF66CA
              66FF9ADB9AFFA0DEA0FF95DA95FF85D485FF7CD17CFF74CF74FF6FCD6FFF6BCB
              6BFF63C963FF5FC75FFF5AC65AFF53C353FF4CC04CFF41BD41FF36B736FF27A6
              27FF148614FFFFFFFFFFFFFFFFEF6DCC6DFF93D993FF98DB98FF8BD78BFF7DD2
              7DFF75CF75FF6FCD6FFF69CB69FF66CA66FF5FC75FFF59C559FF56C456FF4FC2
              4FFF48BF48FF3DBB3DFF30B530FF21A521FF2F942FFFFFFFFFEFFFFFFF8FDBF2
              DBFF6CCC6CFF64C964FF58C558FF4EC14EFF4AC04AFF43BD43FF43BD43FF3FBC
              3FFF3DBB3DFF39BA39FF33B833FF32B832FF2DB62DFF26B326FF1EAD1EFF32A8
              32FFD1E8D1FFFFFFFF8F00000000FFFFFF8FFFFFFFEFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFFFFF8F00000000}
            ParentFont = False
            ParentShowHint = False
            ShowHint = False
            Transparent = False
            OnClick = backtogame_bnClick
          end
          object Value_Edit: TEdit
            Left = 55
            Top = 6
            Width = 100
            Height = 24
            BevelInner = bvNone
            BevelKind = bkSoft
            BorderStyle = bsNone
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Courier New'
            Font.Style = []
            ParentFont = False
            ParentShowHint = False
            ShowHint = False
            TabOrder = 0
            Text = '200'
            OnKeyPress = Value_EditKeyPress
          end
          object VarType_CB: TComboBox
            Left = 194
            Top = 6
            Width = 100
            Height = 24
            BevelInner = bvNone
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
            ParentShowHint = False
            ShowHint = False
            TabOrder = 1
            Text = 'Auto Type'
            OnChange = VarType_CBChange
            Items.Strings = (
              'Auto Type'
              'Byte Type'
              'Word Type'
              'DWord Type'
              'Int64 Type'
              'Single'
              'Double'
              'Text')
          end
          object Panel3: TPanel
            Left = 2
            Top = 38
            Width = 504
            Height = 18
            Align = alBottom
            BevelOuter = bvLowered
            TabOrder = 2
            object Task_info_Name_LB: TStaticText
              Left = 1
              Top = 1
              Width = 186
              Height = 16
              Align = alLeft
              Caption = #27809#26377#20869#23384#25628#32034#20219#21153#65307#35831#26032#24314#21152#20837
              Font.Charset = ANSI_CHARSET
              Font.Color = clNavy
              Font.Height = -13
              Font.Name = #23435#20307
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              Transparent = False
            end
            object Task_Info_SearchResult_LB: TStaticText
              Left = 332
              Top = 1
              Width = 171
              Height = 16
              Align = alRight
              Alignment = taRightJustify
              BiDiMode = bdRightToLeftReadingOnly
              Caption = #25628#32034#27425#25968': 0 ;'#32467#26524#25968#30446': 0 '
              Font.Charset = ANSI_CHARSET
              Font.Color = clNavy
              Font.Height = -13
              Font.Name = #23435#20307
              Font.Style = []
              ParentBiDiMode = False
              ParentFont = False
              TabOrder = 1
              Transparent = False
            end
          end
          object StaticText1: TStaticText
            Left = 12
            Top = 12
            Width = 37
            Height = 17
            Caption = #36755#20837':'
            TabOrder = 3
            Transparent = False
          end
        end
        object Panel6: TPanel
          Left = 2
          Top = 194
          Width = 508
          Height = 178
          Align = alClient
          Caption = 'Panel6'
          TabOrder = 2
          object ToolBar4: TToolBar
            Left = 1
            Top = 1
            Width = 506
            Height = 24
            ButtonWidth = 79
            Caption = 'ToolBar3'
            EdgeOuter = esRaised
            Flat = True
            Images = MiddleImageList
            List = True
            ShowCaptions = True
            TabOrder = 0
            TabStop = True
            Transparent = True
            object SelMemEdit_TB: TToolButton
              Left = 0
              Top = 0
              AutoSize = True
              Caption = #20869#23384#26597#30475
              ImageIndex = 0
              OnClick = SelMemEdit_TBClick
            end
            object AddToLock_Tb: TToolButton
              Left = 83
              Top = 0
              AutoSize = True
              Caption = #21152#20837#21015#34920
              ImageIndex = 1
              OnClick = FoundAdd_memuClick
            end
            object EditAddress_tb: TToolButton
              Left = 166
              Top = 0
              AutoSize = True
              Caption = #32534#36753#38145#23450
              ImageIndex = 2
              OnClick = EditAddress_tbClick
            end
            object lockRemove_TB: TToolButton
              Left = 249
              Top = 0
              AutoSize = True
              Caption = #21024#38500
              ImageIndex = 3
              OnClick = LockRemove_menuClick
            end
            object OpenLockRecord_TB: TToolButton
              Left = 306
              Top = 0
              AutoSize = True
              Caption = #25171#24320
              ImageIndex = 4
              OnClick = OpenLockRecord_TBClick
            end
            object SaveLockRecord_TB: TToolButton
              Left = 363
              Top = 0
              AutoSize = True
              Caption = #21478#23384#20026
              ImageIndex = 5
              OnClick = SaveLockRecord_TBClick
            end
          end
          object Lock_LV: TListView
            Left = 1
            Top = 25
            Width = 506
            Height = 152
            Align = alClient
            Checkboxes = True
            Color = clBtnFace
            Columns = <
              item
                AutoSize = True
                Caption = #26631#24535
                MinWidth = 50
              end
              item
                AutoSize = True
                Caption = #22320#22336
                MinWidth = 50
              end
              item
                AutoSize = True
                Caption = #25968#20540
                MinWidth = 50
              end
              item
                AutoSize = True
                Caption = #31867#22411
                MinWidth = 50
              end
              item
                AutoSize = True
                Caption = #36827#31243'ID'
                MinWidth = 50
              end
              item
                AutoSize = True
                Caption = #29366#24577
                MinWidth = 50
              end>
            MultiSelect = True
            RowSelect = True
            PopupMenu = LockPopMenu
            TabOrder = 1
            ViewStyle = vsReport
            OnDblClick = Lock_LVDblClick
            OnEdited = Lock_LVEdited
            OnMouseDown = Lock_LVMouseDown
          end
        end
      end
    end
    object archiveEdit_TS: TTabSheet
      Caption = 'Archive Edit'
      ImageIndex = 2
      TabVisible = False
    end
    object CapPic_TS: TTabSheet
      Caption = 'Image Capture'
      ImageIndex = 3
      TabVisible = False
    end
    object GameRecord_TS: TTabSheet
      Caption = 'Game Record'
      ImageIndex = 5
      TabVisible = False
    end
    object SET_TS: TTabSheet
      Caption = 'Options'
      ImageIndex = 6
      TabVisible = False
      object Panel5: TPanel
        Left = 0
        Top = 0
        Width = 668
        Height = 374
        Align = alClient
        BevelOuter = bvLowered
        TabOrder = 0
        object Options_TreeView: TTreeView
          Left = 1
          Top = 1
          Width = 152
          Height = 372
          Align = alLeft
          HotTrack = True
          Images = Option_ImageList
          Indent = 19
          ParentShowHint = False
          ReadOnly = True
          RightClickSelect = True
          ShowHint = False
          TabOrder = 0
          OnClick = Options_TreeViewClick
          Items.Data = {
            0300000021000000000000000100000000000000FFFFFFFF0000000000000000
            08C4DAB4E6CBD1CBF7210000000000000001000000FFFFFFFFFFFFFFFF000000
            000000000008CDBCCFF3B2B6D7BD210000000000000001000000FFFFFFFFFFFF
            FFFF000000000000000008B8DFBCB6D1A1CFEE}
        end
        object Options_PageControl: TPageControl
          Left = 153
          Top = 1
          Width = 514
          Height = 372
          ActivePage = TabSheet3
          Align = alClient
          TabOrder = 1
          object TabSheet1: TTabSheet
            Caption = 'TabSheet1'
            TabVisible = False
            object Label4: TLabel
              Left = 8
              Top = 135
              Width = 59
              Height = 13
              Caption = #24377#20986#28909#38190':'
            end
            object Label6: TLabel
              Left = 8
              Top = 8
              Width = 59
              Height = 13
              Caption = #20869#23384#25628#32034':'
              Color = clWindow
              ParentColor = False
            end
            object GroupBox1: TGroupBox
              Left = 8
              Top = 25
              Width = 401
              Height = 88
              Caption = #25628#32034#36873#39033
              TabOrder = 0
              object Label2: TLabel
                Left = 16
                Top = 56
                Width = 85
                Height = 13
                Caption = #25628#32034#20869#23384#33539#22260':'
              end
              object Label3: TLabel
                Left = 236
                Top = 55
                Width = 16
                Height = 13
                Caption = '->'
                Font.Charset = ANSI_CHARSET
                Font.Color = clNavy
                Font.Height = -13
                Font.Name = #23435#20307
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Set_1_RB1: TRadioButton
                Left = 16
                Top = 24
                Width = 89
                Height = 17
                Caption = #33258#21160#33539#22260
                Checked = True
                TabOrder = 0
                TabStop = True
                OnClick = Set_1_RB1Click
              end
              object Set_1_RB2: TRadioButton
                Left = 96
                Top = 24
                Width = 121
                Height = 17
                Caption = 'Windows'#28216#25103
                TabOrder = 1
                OnClick = Set_1_RB2Click
              end
              object Set_1_RB3: TRadioButton
                Left = 208
                Top = 24
                Width = 97
                Height = 17
                Caption = 'DOS'#28216#25103
                TabOrder = 2
                OnClick = Set_1_RB3Click
              end
              object Set_1_RB4: TRadioButton
                Left = 312
                Top = 24
                Width = 65
                Height = 17
                Caption = #33258#23450#20041
                TabOrder = 3
                OnClick = Set_1_RB4Click
              end
              object set_FromEdit: TEdit
                Left = 111
                Top = 51
                Width = 121
                Height = 21
                Enabled = False
                TabOrder = 4
                Text = '00010000'
              end
              object Set_toEdit: TEdit
                Left = 253
                Top = 51
                Width = 132
                Height = 21
                Enabled = False
                TabOrder = 5
                Text = '86500000'
              end
            end
            object GroupBox2: TGroupBox
              Left = 8
              Top = 168
              Width = 401
              Height = 105
              Caption = #38145#23450#36873#39033
              TabOrder = 1
              object Label5: TLabel
                Left = 16
                Top = 24
                Width = 59
                Height = 13
                Caption = #38145#23450#21608#26399':'
              end
              object Lock_Frequency_LB: TLabel
                Left = 104
                Top = 24
                Width = 42
                Height = 13
                Caption = '500 ms'
              end
              object Lock_TrackBar: TTrackBar
                Left = 8
                Top = 56
                Width = 273
                Height = 45
                Max = 50
                Min = 1
                Position = 5
                SelEnd = 10
                SelStart = 5
                TabOrder = 0
                OnChange = Lock_TrackBarChange
              end
            end
            object Set_1_OK: TButton
              Left = 8
              Top = 280
              Width = 75
              Height = 25
              Caption = #24212#29992
              TabOrder = 2
              OnClick = Set_1_OKClick
            end
            object Main_HotKey: THotKey
              Left = 112
              Top = 128
              Width = 257
              Height = 25
              HotKey = 24695
              Modifiers = [hkShift, hkCtrl]
              TabOrder = 3
            end
          end
          object TabSheet2: TTabSheet
            Caption = 'TabSheet2'
            ImageIndex = 1
            TabVisible = False
            object Label8: TLabel
              Left = 16
              Top = 184
              Width = 59
              Height = 13
              Caption = #25235#22270#28909#38190':'
            end
            object Label7: TLabel
              Left = 16
              Top = 8
              Width = 59
              Height = 13
              Caption = #22270#35937#25429#25417':'
              Color = clWindow
              ParentColor = False
            end
            object Capture_HotKey: THotKey
              Left = 88
              Top = 176
              Width = 265
              Height = 25
              HotKey = 24696
              Modifiers = [hkShift, hkCtrl]
              TabOrder = 0
            end
            object SaveWay_RG: TGroupBox
              Left = 16
              Top = 32
              Width = 417
              Height = 129
              Caption = #20445#23384#27169#24335
              TabOrder = 1
              object SaveMode1: TRadioButton
                Left = 16
                Top = 24
                Width = 177
                Height = 17
                Caption = #35810#38382#20445#23384#36335#24452
                Checked = True
                TabOrder = 0
                TabStop = True
              end
              object SaveMode2: TRadioButton
                Left = 16
                Top = 53
                Width = 185
                Height = 17
                Caption = #33258#21160#39034#24207#23384#20648
                TabOrder = 1
              end
              object CaptureSavepath_Edit: TEdit
                Left = 19
                Top = 73
                Width = 286
                Height = 21
                TabOrder = 2
              end
              object SaveMode3: TRadioButton
                Left = 16
                Top = 104
                Width = 177
                Height = 17
                Caption = #26174#31034#32534#36753
                TabOrder = 3
              end
              object path_bn: TButton
                Left = 306
                Top = 72
                Width = 25
                Height = 25
                Caption = '...'
                TabOrder = 4
                OnClick = path_bnClick
              end
            end
            object Set_2_ok: TButton
              Left = 16
              Top = 216
              Width = 75
              Height = 25
              Caption = #24212#29992
              TabOrder = 2
              OnClick = Set_2_okClick
            end
          end
          object TabSheet3: TTabSheet
            Caption = 'TabSheet3'
            ImageIndex = 2
            TabVisible = False
            object Label9: TLabel
              Left = 16
              Top = 8
              Width = 59
              Height = 13
              Caption = #39640#32423#36873#39033':'
              Color = clWindow
              ParentColor = False
            end
            object GroupBox3: TGroupBox
              Left = 16
              Top = 32
              Width = 393
              Height = 129
              Caption = #31383#20307#36879#26126#24230
              TabOrder = 0
              object EnabledAlphaBlend_cb: TCheckBox
                Left = 16
                Top = 32
                Width = 281
                Height = 17
                Caption = #20351#33021'('#19981#25903#25345'Windows2000'#20197#19979#30340#25805#20316#31995#32479')'
                TabOrder = 0
                OnClick = EnabledAlphaBlend_cbClick
              end
              object Alphablend_TrackBar: TTrackBar
                Left = 8
                Top = 68
                Width = 321
                Height = 45
                Max = 255
                Min = 80
                Frequency = 5
                Position = 80
                TabOrder = 1
                OnChange = Alphablend_TrackBarChange
              end
            end
            object set_autoRun: TCheckBox
              Left = 16
              Top = 184
              Width = 97
              Height = 17
              Caption = #24320#26426#33258#21551#21160
              TabOrder = 1
              OnClick = set_autoRunClick
            end
            object Makeappshortcut: TButton
              Left = 16
              Top = 224
              Width = 145
              Height = 33
              Caption = #22312#26700#38754#21019#24314#24555#25463#26041#24335
              TabOrder = 2
              OnClick = MakeappshortcutClick
            end
          end
        end
      end
    end
    object help_TS: TTabSheet
      Caption = 'Help'
      ImageIndex = 7
      TabVisible = False
    end
  end
  object Main_cb: TCoolBar
    Left = 0
    Top = 0
    Width = 676
    Height = 49
    AutoSize = True
    Bands = <
      item
        BorderStyle = bsSingle
        Control = Main_TB
        ImageIndex = -1
        MinHeight = 41
        Width = 672
      end>
    DockSite = True
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    object Main_TB: TToolBar
      Left = 9
      Top = 2
      Width = 659
      Height = 41
      Align = alClient
      AutoSize = True
      ButtonHeight = 36
      ButtonWidth = 59
      Caption = 'Main_TB'
      Customizable = True
      EdgeOuter = esNone
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      Images = MainImageList
      ParentFont = False
      ShowCaptions = True
      TabOrder = 0
      Transparent = True
      object MyFavorite_TB: TToolButton
        Left = 0
        Top = 0
        AllowAllUp = True
        AutoSize = True
        Caption = #25105#30340#25910#34255
        Grouped = True
        ImageIndex = 0
        Style = tbsCheck
        OnClick = MyFavorite_TBClick
      end
      object MemEdit_TB: TToolButton
        Tag = 1
        Left = 63
        Top = 0
        AllowAllUp = True
        AutoSize = True
        Caption = #20869#23384#25628#32034
        Grouped = True
        ImageIndex = 1
        Style = tbsCheck
        OnClick = MemEdit_TBClick
      end
      object archiveEdit_TB: TToolButton
        Tag = 2
        Left = 126
        Top = 0
        AllowAllUp = True
        AutoSize = True
        Caption = #23384#26723#32534#36753
        Grouped = True
        ImageIndex = 2
        Style = tbsCheck
        OnClick = archiveEdit_TBClick
      end
      object CapPic_TB: TToolButton
        Tag = 3
        Left = 189
        Top = 0
        AllowAllUp = True
        AutoSize = True
        Caption = #22270#35937#25429#25417
        Grouped = True
        ImageIndex = 3
        Style = tbsCheck
        OnClick = CapPic_TBClick
      end
      object GameRecord_TB: TToolButton
        Tag = 5
        Left = 252
        Top = 0
        AllowAllUp = True
        AutoSize = True
        Caption = #28216#25103#35760#24405
        Grouped = True
        ImageIndex = 5
        Style = tbsCheck
        OnClick = GameRecord_TBClick
      end
      object SetOptions_TB: TToolButton
        Tag = 6
        Left = 315
        Top = 0
        AllowAllUp = True
        AutoSize = True
        Caption = ' '#36873' '#39033' '
        Grouped = True
        ImageIndex = 6
        Style = tbsCheck
        OnClick = SetOptions_TBClick
      end
      object Help_TB: TToolButton
        Tag = 7
        Left = 373
        Top = 0
        AllowAllUp = True
        AutoSize = True
        Caption = ' '#24110' '#21161
        DropdownMenu = Help_popMenu
        Grouped = True
        ImageIndex = 7
        Style = tbsDropDown
        OnClick = Help_TBClick
      end
    end
  end
  object MainImageList: TImageList
    Left = 352
    Top = 320
    Bitmap = {
      494C01010A000E00040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000004000000001002000000000000040
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000033333300777777007777770077777700777777007777
      77007777770000000000000000000000000000000000A37774FFA37774FFA377
      74FFA37774FFA37774FFA37774FFA37774FFA37774FFA37774FFA37774FFA377
      74FFA37774FF90605DFF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000CCCCCC0055555500777777007777770077777700777777007777
      77007777770077777700000000000000000000000000A67B75FFFFE8D2FFFFE8
      D2FFFFE8D1FFFFE6CEFFFFE3C5FFFFDEBDFFFFDDBAFFFFD8B2FFFFD6AEFFFFD2
      A5FFFFD2A3FF93635FFF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000CCCCCC0055555500000000000000000000000000000000000000
      00000000000000000000000000000000000000000000AB7F77FFFFE8D2FFFFE8
      D2FFFFE6CEFFFFE3C6FFFFE1C2FFFFDDBBFFFFDAB6FFFFD7B0FFFFD4A9FFFFD2
      A4FFFFD2A3FF966662FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000CCCCCC0055555500000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B08379FFFFECD9FFFFEC
      D9FFFFE8D2FFFFE6CEFFFFE3C6FFFFE1C2FFFFDDBBFFFFD9B4FFFFD7B0FFFFD4
      A9FFFFD4A9FF9A6964FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000099FFFF0000CCFF00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B6897CFFFFEEDDFFFFEE
      DDFFFFECD9FFDFD1D8FFFFE6CEFFFFE3C6FFFFE1C2FFEFD2BFFFFFD9B4FFFFD7
      B0FFFFD7B0FF9E6C66FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000099FF0099FFFF0000CCFF00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BC8E7EFFFFF2E4FFFFF2
      E4FFCFCBE3FF103FFDFF6077EEFFFFE6CEFF6075EAFF3053F2FFEFD2BFFFFFD9
      B4FFFFD9B4FFA26F68FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000CCFF0000CCFF0000CCFF000099FF000000000000000000000000000000
      00000000000000000000000000000000000000000000C39581FFFFF4E8FFFFF4
      E8FFEFE6E6FF3056F9FF0033FFFF204AF9FF0033FFFF3054F4FFEFD6C5FFFFDD
      BBFFFFDDBBFFA5736AFF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000CC
      FF0033FFFF0066FFFF0033FFFF0033FFFF0000CCFF0000000000000000000000
      00000000000000000000000000000000000000000000CA9B84FFFFF7F0FFFFF7
      F0FFFFF4E8FFEFE6E6FF103FFDFF0033FFFF103EFCFFEFDBD0FFFFE3C6FFFFE0
      C1FFFFE1C2FFA8766CFF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000033FFFF0099FF
      FF00CCFFFF0099FFFF0099FFFF0066FFFF0033FFFF0000CCFF00000000000000
      00000000000000000000000000000000000000000000D2A187FFFFF9F4FFFFF9
      F4FFFFF7F0FF607BF6FF0033FFFF0033FFFF0033FFFF6077EEFFFFE6CEFFFFE3
      C6FFFFE3C6FFAC796EFF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000CCFF0033FFFF00CCFF
      FF00FFFFFF000099FF0066FFFF0099FFFF0066FFFF0000CCFF00000000000000
      00000000000000000000000000000000000000000000D9A88AFFFFFDFBFFFFFD
      FBFFBFC8F7FF0033FFFF3057FBFFDFDAE7FF3056F9FF103FFDFFDFD1D8FFFFE6
      CEFFFFE6CEFFAE7B71FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000CCFF0099FFFF00FFFF
      FF00FFFFFF000099FF0099CCFF00CCFFFF0066FFFF0000CCFF00000000000000
      00000000000000000000000000000000000000000000DFAE8CFFFFFFFFFFFFFF
      FFFFFFFDFBFFAFBBF7FFEFEBF0FFFFF4E8FFEFE6E6FFCFCBE3FFFFECD9FFFFC8
      C2FFFFB0B0FFB07D72FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000CCFF0099FFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0099FFFF0066FFFF0000CCFF00000000000000
      00000000000000000000000000000000000000000000E5B38FFFFDFDFDFFFDFD
      FDFFFFFFFFFFFFFFFFFFFFFFFEFFFFFAF6FFFFF9F3FFFFF5EAFFF4DECEFFB27F
      73FFB27F73FFB27F73FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000066FFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0099FFFF0033FFFF0000CCFF00000000000000
      00000000000000000000000000000000000000000000EAB891FFFEFEFEFFFEFE
      FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFFFAF6FFFFF9F3FFF5E1D2FFB27F
      73FFEDA754FFCB987FCF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000CCFF0099FF
      FF00CCFFFF00CCFFFF00CCFFFF0066FFFF0000CCFF0000000000000000000000
      00000000000000000000000000000000000000000000EFBC92FFFFFFFFFFFFFF
      FFFFFCFCFCFFFAFAFAFFF7F7F7FFF5F5F5FFF2F1F1FFF0EDEAFFE9DAD0FFB27F
      73FFD4A183CFD09D811000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000033FF
      FF0066FFFF0066FFFF0033FFFF0000CCFF000000000000000000000000000000
      00000000000000000000000000000000000000000000F2BF94FFDCA987FFDCA9
      87FFDCA987FFDCA987FFDCA987FFDCA987FFDCA987FFDCA987FFDCA987FFB27F
      73FFD8A585100000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000003333
      3320866039FF3333332000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007549
      1DDFF2B373FFD98026FF0000000000000000000000000012BDDF0728CCDF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000626262006262620062626200000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFE07800FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      000000808000FFFFFF0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CC6600FFCC6600FFCC6600FF8660
      39FFF2B373FFD98026FFCC6600FFCC6600FF8073ABFF0C4BFFFF1B69FFFF4043
      B8FFCC6600FFCC6600FFCC6600FF000000000000000000000000000000000000
      0000000000006262620092929200FFFFFF007A7A7A0096006200000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFE09000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF000000000000000000000000000000000000000000C0C0
      C000C0C0C000FFFFFF00FFFFFF00000000000000000000000000000000000000
      000000000000000000000000000000000000CC6600FFFFFDFAFFFFF9F2FF8660
      39FFEDA965FFD47618FFFFE9D4FFFFE9D4FF8073ABFF1256FFFF297BFFFF4146
      B4FFFFD9B3FFFFD5ABFFCC6600FF000000000000000000000000000000006262
      620092929200C0C0C000F2F2F200A4A0A000FFFFFF007A7A7A00960062000000
      00000000000000000000000000000000000000000000FFFFFF00FFE07800B014
      7800A0147800B0147800A0147800B0147800A0147800B0147800A0147800B014
      7800FFFFFF00FFFFFF000000000000000000000000000000000000008000C0C0
      C000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000800000000000000000000000
      000000000000000000000000000000000000CC6600FFFFFFFFFFFFFDFAFF8660
      39FFECA660FFD37313FFFFECD9FFFFECD9FF8076AEFF1A66FFFF368BFFFF434B
      B3FFFFDBB8FFFFD9B3FFCC6600FF00000000000000006262620092929200B6B6
      B600DADADA00A4A0A000FFD4F000FFD4F000FFD4F000FFD4F000808080006262
      62000000000000000000000000000000000000000000FFFFFF00FFE09000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000008080000080
      8000FFFFFF00FFFFFF00FFFFFF00FFFFFF0000808000C0C0C000008080000000
      000000000000000000000000000000000000CC6600FFFFFFFFFFFFFFFFFF8660
      39FFECA660FFD37313FFFFF0E1FFFFF0E1FF8076AAFF2276FFFF439CFFFF4550
      B0FFFFDFBFFFFFDBB8FFCC6600FF0000000062626200929292009E9E9E00A4A0
      A000FFB1E200FFB1E200FFB1E200FFB1E200FFB1E200FFB1E200FFB1E2008686
      86006262620000000000000000000000000000000000FFFFFF00FFE07800D014
      A000D024A000D014A000D024A000FFFFFF00D024A000D014A000D024A000FFFF
      FF00FFFFFF00FFFFFF00000000000000000000000000C0C0C000C0C0C000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000808000C0C0C000C0C0C0000080
      800000008000000000000000000000000000CC6600FFFFFFFFFFFFFFFFFF8660
      39FFE69B4FFFD6731DFFFFF2E5FFFFF2E5FF8079ABFF2885FFFF51AEFFFF4653
      B0FFFFE1C4FFFFDFBFFFCC6600FF0000000032005000A4A0A000FF8ED400FF8E
      D400FF8ED40092929200FF8ED400FF8ED400FF8ED400FF8ED400FF8ED400FF8E
      D4008080800062626200000000000000000000000000FFFFFF00FFE09000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00000000000000000000008000C0C0C000C0C0C000FFFF
      FF00FFFFFF000000000000000000FFFFFF00FFFFFF00FFFFFF00008080000080
      8000C0C0C000008080000000800000000000CC6600FFFFFFFFFFFFFFFFFF8660
      39FFE5994DFFD6731DFFFFF6EDFFFFF6EDFF8079A9FF3297FFFF61C3FFFF495A
      ACFFFFE5CCFFFFE1C4FFCC6600FF00000000FF6BC600FF6BC600FF6BC600FF6B
      C600FF6BC60025FFFF009E9E9E00FF6BC600FF6BC600FF6BC600FF6BC600FF6B
      C600FF6BC60062626200000000000000000000000000FFFFFF00FFE07800FFFF
      FF0000781800FFFFFF0018781800FFFFFF00FFFFFF00C0149000B0147800C014
      9000FFFFFF00FFFFFF0000000000000000000080800000808000FFFFFF008080
      8000FFFFFF00FFFFFF0000808000FFFFFF000000000000808000FFFFFF00FFFF
      FF00FFFFFF0000808000C0C0C00000808000CC6600FFFFFFFFFFFFFFFFFF8660
      39FFE5994DFFD97626FFCAAEA7FFFFF9F2FF8F8CB4FF5C89BCFF3F5886FF5E63
      9CFFFFE8D1FFFFE5CCFFCC6600FF00000000FF6B8F0096009600FF48B800FF48
      B800FF48B800FF48B8009E9E9E0086868600FF48B800FF48B800FF48B800FF48
      B800FF48B8007A7A7A00960062000000000000000000FFFFFF00FFE090001878
      1800FFFFFF0018E018001878180018781800FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF000000000000000000C0C0C000FFFFFF00FFFFFF000000
      800080808000C0C0C000FFFFFF00008080000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000808000CC6600FFFFFFFFFFFFFFFFFF8660
      39FFC98C4FFFC27646FFCCB3B3FFFFFDFAFFEFE9E9FF8C8C8CFFE5E5E6FFBCB1
      ADFFFFECD9FFFFE8D1FFCC6600FF0000000000000000FF6B8F0096009600FF00
      AA00FF00AA00FF00AA00FF00AA009E9E9E006BFFFF0025FFFF006BC6FF00FF00
      AA00FF00AA00FF00AA00808080006262620000000000FFFFFF00FFE07800FFFF
      FF00FFFFFF00FFFFFF000078180018682800FFFFFF00E014B000E024A000FFFF
      FF00FFFFFF00FFFFFF000000000000000000FFFFFF00C0C0C000FFFFFF00C0C0
      C0008080800080808000C0C0C000FFFFFF0080000000FF00000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000CC6600FFEDEDEDFF717171FFFFFF
      FFFF717171FF7B7B7BFFBFBFBFFFF2F2F2FF8C8C8CFF8C8C8CFFD1D2D3FF8C8C
      8CFFE6D8CAFFFFECD9FFCC6600FF000000000000000000000000FF6B8F009600
      9600DC009200DC009200DC009200DC009200DC009200DC00920025FFFF006E6E
      6E00DC009200DC009200DC0092000000000000000000FFFFFF00FFE09000FFFF
      FF0018781800FFFFFF0018681800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00000000000000000080808000FFFFFF0080808000FFFF
      FF00C0C0C000C0C0C000FFFFFF0000808000FFFFFF0080000000FF0000000000
      0000FFFFFF00FFFFFF000000000000000000CC6600FF717171FFD9D9D9FF7A6D
      6DFF959595FFA7A7A7FF979797FF8C8C8CFFF5F5F5FFD9D9D9FFDADADBFFE3E4
      E5FF8C8C8CFFFFF0E1FFCC6600FF00000000000000000000000000000000FF6B
      8F0096009600B9007A009600960025FFFF00868686009E9E9E006BFFFF00B900
      7A00B9007A00B9007A00B9007A009600960000000000FFE07800FFE09000FFE0
      7800FFE09000FFE07800FFE09000FFE07800FFE09000FFE07800FFE09000FFE0
      7800FFE09000FFE0780000000000000000000000000080808000FFFFFF008080
      8000C0C0C000C0C0C00000008000FFFFFF00FFFFFF00FFFFFF0080000000FF00
      000000000000000000000000000000000000CC6600FF717171FFD6D6D6FFD9D9
      D9FF707070FFB9B9B9FFC1C1C1FF898989FFC6C6C6FFA1A1A1FF8C8C8CFFDFE0
      E1FF8C8C8CFFFFF2E5FFCC6600FF000000000000000000000000000000000000
      0000FF6B8F009600960096006200960062007A7A7A0092929200960062009600
      62009600620096009600960096000000000000000000FFFFFF00FFE09000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF000000000000000000000000000000000080808000FFFF
      FF00FFFFFF00C0C0C000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008000
      0000FF000000000000000000000000000000CC6600FFD6D6D6FF9E9E9EFFA4A4
      A4FF9E9E9EFFAEAEAEFFB3B3B3FFC9C9C9FFA7A7A7FFDF7A00FFDF7A00FFE1E1
      E2FFAC8C62FFDF7A00FFCC6600FF000000000000000000000000000000000000
      000000000000FF6B8F009600960073004A0073004A0073004A0073004A009600
      96000000000000000000000000000000000000000000FFFFFF00FFE07800FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000808080000000000080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      000080000000FF0000000000000000000000CE6800FFCF6900FFCF6900FF7D71
      63FF7D7163FF7D7163FF7D7163FFCF6900FF7D7163FFCF6900FFCF6900FF7D71
      63FFCF6900FFCF6900FFCF6900FF000000000000000000000000000000000000
      00000000000000000000FF6B8F00960096009600960096009600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000080808000FFFFFF00000000000000
      000000000000800000008000000000000000CC660030D27313FFD27313FFD273
      13FFD27313FFD27313FFD27313FFD27313FFD27313FFD27313FFD27313FFD273
      13FFD27313FFD27313FFCC660040000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000009999990099999900999999000000000000000000000000000000
      0000999999009999990000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007F7F7F007F7F7F007F7F
      7F007F7F7F0000000000000000007F7F7F007F7F7F007F7F7F007F7F7F007F7F
      7F007F7F7F000000000000000000000000000000000000000000000000000066
      9910006699800066992000000000000000000000000000000000000000000066
      9910408CB380006699300000000000000000000000000000000000000000FF99
      9900FF99990066333300999999009999990099999900000000006666CC006666
      CC000000AA009999990099999900000000000000000000000000000000003333
      FF003333FF003333FF003333FF003333FF003333FF003333FF003333FF003333
      FF003333FF003333FF003333FF003333FF007F7F7F0000000000000000000000
      0000BFBFBF000000000000000000BFBFBF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000066
      998092DDF2FF008FC2EF00669950000000000000000000000000006699306DA8
      C5DFE0FBFFFF0A73A2AF000000000000000000000000FF999900FF999900FF99
      9900FF9999006633330066333300000000006666CC006666CC006666CC006666
      CC000000AA0000009900999999009999990000000000000000003333FF003333
      FF003333FF003333FF003333FF003333FF003333FF003333FF003333FF003333
      FF003333FF003333FF003333FF003333FF00000000000000000000000000BFBF
      BF0000000000505050005050500030303000BFBFBF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000066
      9920BFD9E6FF32D6FFFF15A7D2FF006699800000000000669960AACCDDEFAFEF
      FFFF2FC0E6FF00669960000000000000000000000000FF999900FF999900FF99
      9900FF9999006633330066333300000000006666CC006666CC006666CC006666
      CC000000AA000000AA000000990099999900000000003333FF003333FF003333
      FF003333FF003333FF003333FF003333FF003333FF003333FF003333FF003333
      FF003333FF003333FF003333FF003333FF000000000000000000000000000000
      000050505000A0A0A000A0A0A000505050000000000060606000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00005599BBBF9FECFFFF15D3FFFF32BDDFFF1F7EAABFBFD9E6FFB3F5FFFF0ED1
      FFFF0389BBEF00000000000000000000000000000000FF999900FF999900FF99
      9900FF999900663333006633330000000000333399006666CC006666CC006666
      CC000000AA000000AA0000009900000000009966FF009966FF003333FF009966
      FF00CCCCFF00CCCCFF00CCCCFF00CCCCFF00CCCCFF00CCCCFF00CCCCFF00CCCC
      FF00CCCCFF003333FF003333FF00000000000000000000000000000000000000
      000050505000BFBFBF00FFFFFF007F7F7F000000000060606000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000669950DFECF2FF25D4FFFF3ADFFFFF86F2FFFFBFFFFFFF6EF0FFFF29CD
      F2FF0066998000000000000000000000000000000000FF999900FF999900FF99
      9900FFFFFF0066333300330000000000000000000000333399006666CC00FFFF
      FF00000099000000AA000000AA00000000009966FF009966FF009966FF00CCCC
      FF00000000006699FF006699FF00CCCCFF00CCCCFF00CCCCFF00CCCCFF00CCCC
      FF00CCCCFF009966FF000000000000000000000000000000000000000000BFBF
      BF0030303000BFBFBF00BFBFBF0000000000BFBFBF0060606000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000055A0C2EF70E2FFFF1AD5FFFF59E9FFFF90FCFFFF8BFAFFFF29A6
      CCFF0066993000000000000000000000000000000000FF999900FFFFFF00FFCC
      CC00FFCCCC00FFCCCC005500000000CCFF0000CCFF000099FF006666CC006666
      CC009999FF00000099000000AA00000000009966FF009966FF00CCCCFF00CCCC
      FF0099CCFF0099CCFF000099FF0033CCFF009966FF00CCCCFF00CCCCFF00CCCC
      FF00CCCCFF009966FF0000000000000000000000000000000000000000000000
      0000BFBFBF000000000000000000BFBFBF007F7F7F0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000066
      99400095C8CF05C7F9FF13D3FFFF07CEFFFF3CE0FFFF78F4FFFF99FFFFFF5EDE
      F2FF128EBBEF00669970000000000000000000000000FFCCCC00FFCCCC00FFCC
      CC000000000000CCFF0000CCFF0000CCFF0000CCFF000099FF000099FF006666
      CC006666CC006666CC000000AA00000000009966FF00CCCCFF00CCCCFF00CCCC
      FF0099CCFF0000FFFF0000FFFF000099FF0033CCFF009966FF009966FF00CCCC
      FF009966FF000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF0000009000FFFFFF00BFBFBF0000000000000000000000
      0000000000000000000000000000000000000000000000669920008FC29F00B9
      ECFF3EE1FFFF59E9FFFF30DCFFFF05CEFFFF21D7FFFF60ECFFFF94FDFFFF86F9
      FFFF43E2FFFF07B5E6FF0076A9CF006699400000000000000000FFCCCC00FFCC
      CC000000000000CCFF0000CCFF0000CCFF0000CCFF000099FF000099FF000099
      FF006666CC006666CC0000000000000000000000000000000000000000000000
      00000000000033CCFF0000FFFF0000FFFF000099FF0033CCFF00000000000000
      00000000000000000000000000000000000000000000BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF000000000000000000BFBFBF00BFBFBF0000000000FFFF
      FF00000000007F7F7F000000000000000000000000002499C5DF80E6FFFFABF4
      FFFFCCFFFFFFDAFBFFFFCEF7FFFF64E1FFFF0CD0FFFF41E1FFFFBBF9FFFFE3FE
      FFFFADF4FFFF89E9FFFF87E8FFFF3999BFFF000000000000000000000000FFCC
      CC000000000000CCFF0000CCFF0000CCFF0000CCFF000099FF000099FF000099
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000033CCFF0000FFFF0000FFFF000099FF0033CCFF000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00BFBFBF000000000000000000000000003988B08F5599BBBF329D
      C5FF329DC5FF329DC5FF329DC5FFC6F5FFFF02CDFFFF2BDAFFFF0671A2BF329D
      C5FF329DC5FF329DC5FF329DC5FF5D9EBEAF0000000000000000000000000000
      00000000000000CCFF0000CCFF0000CCFF00FFFFFF000099FF000099FF000099
      FF00000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000033CCFF0000FFFF0000FFFF000099FF0033CC
      FF0000000000000000000000000000000000FFFFFF00EFEFEF00000000007F7F
      7F000000000000000000BFBFBF00BFBFBF00BFBFBF000000000000000000FFFF
      FF007F7F7F00000000009F9F9F00000000000000000000000000000000000000
      0000000000000000000000669930329DC5FF0ED1FFFF07BBECFF006699600000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000CCFF00FFFFFF0000FFFF0000FFFF0000FFFF000099FF000099
      FF00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000033CCFF0000FFFF0000FFFF000099
      FF0044444400000000000000000000000000FFFFFF00EFEFEF00EFEFEF00DFDF
      DF00DFDFDF00DFDFDF0000000000FFFFFF007F7F7F00BFBFBF00BFBFBF00AFAF
      AF00AFAFAF00AFAFAF00AFAFAF00000000000000000000000000000000000000
      0000000000000000000000000000329DC5FF58E1FFFF009FD2FF006699200000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000099
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000033CCFF0000FFFF004444
      440077777700444444000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000329DC5FFA0EEFFFF0B8EBDDF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000044444400C0C0
      C000444444006666FF006666FF00000000007F7F7F00FFFFFF00EFEFEF00EFEF
      EF00EFEFEF00DFDFDF00DFDFDF007F7F7F000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000247CA8708CCADFFF0472A39F000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF0000FFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000004444
      44009999FF009999FF000000000000000000000000007F7F7F00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF007F7F7F00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000009FD2FF00669910000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00009999FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000400000000100010000000000000200000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000F807800300000000F003800300000000
      F0FF800300000000F0FF800300000000F0FF800300000000F0FF800300000000
      E0FF800300000000C07F800300000000803F800300000000801F800300000000
      801F800300000000801F800300000000803F800300000000C03F800300000000
      E07F800700000000F1FFFFFF00000000FFFFF7FFE3FFFFFF8001F3FFE39FFE3F
      8001E1FF0001F83F8001C0FF0001E01F8001C03F0001800F8001800F00010007
      8001000300010003800100000001000380010000000100018001000000018000
      800100010001C001800100030001E000800180070001F0018001C0030001F80F
      8001F4110001FC3FFFFFFF390001FFFFFFFFF0E3E0008007E3E3C001C0000003
      E1C3000080000000E083000000000000F007000100010000F007000100030000
      F807000100030000E00300010007000080008001F83F00008000C007FC1F0000
      8000E00FFE0F0000FC1FF00FFF070000FE1FF00FFF830000FE3FF80FFFC100FF
      FE3FFC3FFFE381FFFF3FFEFFFFF7FFFF00000000000000000000000000000000
      000000000000}
  end
  object MiddleImageList: TImageList
    Left = 384
    Top = 320
    Bitmap = {
      494C010106000900040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000003000000001002000000000000030
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000109FCFFF109FCFFF0099
      CCEF0099CCAF0099CC700099CC30000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000004EBBE4FFA7DDEFFF65D1
      F9FF48C1ECFF2BB1DFFF0EA1D2FF0099CCEF0099CCAF0099CC700099CC300000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000004EBBE4FF67C3E2FFA8ED
      FFFF80E5FFFF80E5FFFF80E5FFFF70DCF9FF50C9ECFF30B6DFFF1BA7D9FF0B9F
      D28F000000000000000000000000000000000000000000000030994D4DFFBF8C
      8CFFC4C4C4FFC4C4C4FFC4C4C4FFC4C4C4FFC4C4C4FFC4C4C4FFC4C4C4FFC4C4
      C4FFBF8C8CFF994D4DFFB98675FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000004EBBE4FF4EBBE4FFCDF9
      FFFF8CF2FFFF8CF2FFFF8CF2FFFF8CF2FFFF8CF2FFFF8CF2FFFF70D6FFFF30B4
      E0EF0099CC1000000000000000000000000000000000994D4DFFCC6666FFBF8C
      8CFFFAFAFAFFFAFAFAFFFAFAFAFFFAFAFAFFFAFAFAFFFAFAFAFFFAFAFAFFFAFA
      FAFFBF8C8CFFCC6666FFB98675FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000004EBBE4FF4ABCEAFFC2EB
      F5FF96FCFFFF96FCFFFF96FCFFFF96FCFFFF96FCFFFF96FCFFFF72D8FFFF89E6
      F9FF0099CC6000000000000000000000000000000000994D4DFFCC6666FFBF8C
      8CFFFAFAFAFFC5C5C5FFC4C4C4FFC3C3C3FFC2C2C2FFC0C0C0FFBFBFBFFFFAFA
      FAFFBF8C8CFFCC6666FFB98675FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000004EBBE4FF71CFFCFF80CC
      E6FFC4FFFFFFA6FFFFFFA6FFFFFFA6FFFFFFA6FFFFFFA6FFFFFF76D9FFFFB3F2
      FFFF3AB6DBDF00000000000000000000000000000000994D4DFFCC6666FFBF8C
      8CFFFAFAFAFFFAFAFAFFFAFAFAFFFAFAFAFFFAFAFAFFFAFAFAFFFAFAFAFFFAFA
      FAFFBF8C8CFFCC6666FFB98675FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000004EBBE4FF88DFFFFF4DC2
      E9FF70C6E2FF8FD2E9FFB6E6F2FFE2FFFFFFC6FFFFFFC6FFFFFF7ED9FFFFA4DF
      DFFF8CD6DFFF0099CC40000000000000000000000000994D4DFFCC6666FFBF8C
      8CFFFAFAFAFFC7C7C7FFC5C5C5FFC5C5C5FFC3C3C3FFC3C3C3FFC1C1C1FFFAFA
      FAFFBF8C8CFFCC6666FFB98675FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000004EBBE4FF99EDFFFF86EC
      FFFF86ECFFFF76E2F9FF56D2E9FF39BCD2FFDAF2F9FFF4FFFFFFA9DFEFFF0D76
      1AFF2D8330FF179EBEAF000000000000000000000000994D4DFFCC6666FFBF8C
      8CFFFAFAFAFFFAFAFAFFFAFAFAFFFAFAFAFFFAFAFAFFFAFAFAFFFAFAFAFFFAFA
      FAFFBF8C8CFFCC6666FFB98675FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000004EBBE4FF96FCFFFF96FC
      FFFF96FCFFFF96FCFFFF96FCFFFF84F1F9FF56D2E9FF39BCD2FF207C2DFF3DC6
      60FF3DC35DFF006E1FCF000000000000000000000000994D4DFFCC6666FFCC66
      66FFBF8C8CFFBF8C8CFFBF8C8CFFBF8C8CFFBF8C8CFFBF8C8CFFBF8C8CFFBF8C
      8CFFCC6666FFCC6666FFB98675FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000004EBBE4FFBDFEFFFF99FF
      FFFF99FFFFFFCAF7FCFFA0E4F2FFC6F8FCFFCCFFFFFF399F60FF29AB46FF50E8
      83FF5AF38DFF249D37FF0066008F0000000000000000994D4DFFCC6666FFCC66
      66FFCC6666FFCC6666FFCC6666FFCC6666FFCC6666FFCC6666FFCC6666FFCC66
      66FFCC6666FFCC6666FFB98675FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000004EBBE4FF9FD9ECFFACE6
      F2FFDCF9FCFF66C2E0EF4EBBE4FF4EBBE4FF006600FF006600FF10831DFF45DA
      75FF42D06BFF178A24FF006600FF006600FF00000000994D4DFFCC6666FF9C36
      36FF993333FFD6CFCFFFB3B3B3FFA9A9A9FFCAB1B1FFCA9797FFDCC8C8FF994D
      4DFFCC6666FFCC6666FFB98675FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000099CC104EBBE4FF4EBB
      E4FF4EBBE4FF0099CC30000000000000000000000000000000000066008031BD
      57FF33BB56FF00660080000000000000000000000000994D4DFFCC6666FF9933
      33FF993333FFFBFBFBFFD9D9D9FFB3B3B3FFA97676FFA84242FFE1C7C7FF994D
      4DFFCC6666FFCC6666FFB98675FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000006600CF34CA
      64FF10831DFF00660040000000000000000000000000994D4DFFCC6666FF9933
      33FF993333FFF0F0F0FFFBFBFBFFD9D9D9FFBF8C8CFFB75151FFCFB6B6FF994D
      4DFFCC6666FFCC6666FFB98675FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000006600600066004000660050006600AF138F26FF138C
      26FF0066009F00000000000000000000000000000000994D4DFFCC6666FF9933
      33FF993333FFE4E4E4FFF0F0F0FFFBFBFBFFDAB4B4FFC27575FFAF9C9CFF994D
      4DFFCC6666FFCC6666FFB98675FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000660080006600EF006600FF07790DFF05720AEF0066
      00800000000000000000000000000000000000000000994D4DFF994D4DFF9933
      33FF993333FFB3B3B3FFB3B3B3FFB3B3B3FFB3B3B3FFB3B3B3FFB3B3B3FF9946
      46FF994D4DFF7A3D3DEF00000030000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000066004000660040000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000663333009999990099999900999999000000000000000000000000000000
      AA00999999009999990000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00006B6B6B006B6B6B006B6B6B006B6B6B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF999900FF99
      990066333300663333009999990099999900000000006666CC006666CC000000
      AA00000099009999990099999900000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CC6600FFCC6600FFCC6600FFCC66
      00FFCC6600FFCC6600FFCC6600FFCC6600FFCC6600FFCC6600FFCC6600FFCC66
      00FFCC6600FFCC6600FFCC6600FF000000000000000000000000000000006B6B
      6B00B1B19F00A9A99900A9A999008D8D81006B6B6B0070707000000000000000
      000000000000000000000000000000000000FF999900FF999900FF999900FF99
      99006633330066333300663333006666CC006666CC006666CC006666CC000000
      AA000000AA000000AA0099999900999999000000000000000000000000000000
      0000000000000000000000000000FF5A18000000000000000000000000000000
      000000000000000000000000000000000000CC6600FFFFFFFFFFFFFBF7FFFFF0
      E2FFBFB7AEFFAFACA6FFBFCBC9FFCCC9BDFFFFE5CDFFFFE3C7FFFFDFBFFFFFDB
      B8FFFFD9B2FFFFD3A8FFCC6600FF0000000000000000000000006B6B6B00FFF2
      CD00FFEBC300FFE6BC00FFE9C100FFF2CD00FFF8D800D1C4A600767676007070
      700000000000000000000000000000000000FF999900FF999900FF999900FF99
      9900444444006633330033000000333399006666CC006666CC006666CC000000
      AA00000099000000AA0000000000000000000000000000000000000000000000
      00000000000000000000FF5A1800FFFFBD000000000000000000000000000000
      000000000000000000000000000000000000CC6600FFFFFFFFFFFFFFFFFFFFFB
      F7FFFFFBF7FF296884FF55AEC9FFC97D2EFFDF9346FFE6A666FFFCDBBAFFFFDF
      BFFFFFDBB8FFFFD9B2FFCC6600FF000000000000000000000000F1C78900FFE6
      BC00FFDDB000FFD8A90040B34000FDF8DF00FDF9E100FFFFEA00FFFDDB009999
      8B006B6B6B00000000000000000000000000FF999900FF999900FF999900FF99
      990044444400663333003300000033339900333399006666CC006666CC000000
      AA00000099000000AA0000000000000000000000000000000000000000000000
      000000000000FF5A1800FFFFBD00FFFF7B00FF7B180000000000000000000000
      000000000000000000000000000000000000CC6600FFF9F9F9FFB3B3B3FFB3B3
      B3FFB3B1AFFFA3A8AAFF507073FFECBE8FFFFFE9D4FFF9D0A8FFE2984EFFE29B
      54FFF2C18FFFFFDBB8FFCC6600FF0000000000000000EBCCA400FAE1B200FFF7
      D300FFE0B300FFD3A20040B34000009900000099000020A62000CFECC700FFFF
      DE006B6B6B00000000000000000000000000FF999900FF999900FFFFFF00FFCC
      CC00FFCCCC006633330055000000000000000099FF009999FF006666CC009999
      FF00000099000000AA0000000000000000000000000000000000000000000000
      0000FF5A1800FFFFBD00FFFF7B00FFBD1800FFBD1800FF7B1800000000000000
      000000000000000000000000000000000000CC6600FFF9F9F9FFF9F9F9FFF9F9
      F9FFF9F9F9FFF9F9F9FFF9F9F9FFECBF92FFDC9349FFECBE91FFFFECD9FFFCD9
      B6FF96806BFF8E8A86FFAC95A4FF0000000000000000F5C68A00F6BF8200F9CF
      9900FDE7BB00FFF3CE0040B340000099000050B95000EFF9E70040B34000FFE7
      C2006E6E6A00000000000000000000000000FFFFFF00FFCCCC00FFCCCC00FFCC
      CC00FFCCCC000000000000CCFF0000CCFF000099FF000099FF006666CC006666
      CC009999FF00000099000000000000000000000000000000000000000000FF5A
      1800FFFFBD00FFFF7B00FFBD1800FFBD1800FFBD1800FFBD1800FF7B18000000
      000000000000000000000000000000000000CC6600FFF9F9F9FF999999FF9999
      99FF999999FF999999FF999999FF999999FF999999FFA68C73FFC68545FFC69B
      71FFBCBCBCFF6B6BC1FF1337BEFF141899DF00000000FDC99400FDC99400FDC9
      9400FDC99400FFDFB30040B3400040B3400020A62000DFF2D4008FD28F00BFD8
      9B0086867B0068686400000000000000000000000000FFCCCC00FFCCCC00DDDD
      DD0000CCFF0000CCFF0000CCFF0000CCFF000099FF000099FF000099FF006666
      CC006666CC006666CC0000000000000000000000000000000000FF5A1800FFFF
      BD00FFFF7B00FFFF7B00FFFF7B00FFBD1800FF7B1800FF7B1800FF7B1800FF7B
      180000000000000000000000000000000000CC6600FFF9F9F9FFF2F2F2FFF2F2
      F2FFF2F2F2FFF2F2F2FFF2F2F2FFF2F2F2FFF2F2F2FFF2F2F2FFFFF5EBFFC2A9
      90FF838383FF323794FF2165DCFF0716A8DFFFDAAC00FFD3A200FFD3A200FFD3
      A200FFD3A200FFE9C70080CC8000FDF8DF0070C66F0040B3400040B34000DFE6
      BE00A4A494006E6E6A0000000000000000000000000000000000FFCCCC00FFCC
      CC0000CCFF0000CCFF0000CCFF0000CCFF000099FF000099FF000099FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFBD00FFBD1800FF7B180000000000000000000000
      000000000000000000000000000000000000CC6600FFF9F9F9FFB3B3B3FFB3B3
      B3FFB3B3B3FFB3B3B3FFB3B3B3FFB3B3B3FFB3B3B3FFB3B3B3FFB3B3B3FFB3B3
      B3FFB3B3B3FFFFE9D3FF998BB7FF00000000FFDAAC00FFDFB300FFDFB300FFDF
      B300FFDFB300FFE6BC0050B9500080CC800080CC80000099000040B34000FFE7
      C200A9A999006B6B6B0000000000000000000000000000000000000000000000
      000000CCFF0000CCFF0000CCFF0000CCFF000099FF000099FF000099FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF5A1800FFFF7B00FFBD1800FF7B180000000000000000000000
      000000000000000000000000000000000000CC6600FFF9F9F9FFF9F9F9FFF9F9
      F9FFF9F9F9FFF9F9F9FFF9F9F9FFF9F9F9FFF9F9F9FFF9F9F9FFFFF8F0FFFFF5
      EBFFFFF0E2FFFFEDDCFFCC6600FF00000000FFDAAC00FFEFC800FFEFC800FFEF
      C800FFEFC800FFEFC800DFE9C80020A62000009900000099000040B34000FFF5
      D700D1CDB1006B6B6B0000000000000000000000000000000000000000000000
      000000CCFF0000CCFF00FFFFFF0000FFFF0000FFFF000099FF000099FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF5A1800FFFF7B00FFBD1800FF7B180000000000000000000000
      000000000000000000000000000000000000CC6600FFF9F9F9FFB3B3B3FFB3B3
      B3FFB3B3B3FFB3B3B3FFB3B3B3FFB3B3B3FFB3B3B3FFB3B3B3FFB3B3B3FFB3B3
      B3FFB3B3B3FFFFF0E2FFCC6600FF00000000FFDAAC00FFFFDE00FFFFDE00FFFF
      DE00FFFFDE00FFFFDE00FFFFDE00EFF7DB00BFE6B600CFECC70040B34000FFFF
      E300DBDBC0006B6B6B0000000000000000000000000000000000000000000000
      0000FFFFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000099FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF5A1800FF7B1800FF7B1800FF7B180000000000000000000000
      000000000000000000000000000000000000CC6600FFF9F9F9FFF9F9F9FFF9F9
      F9FFF9F9F9FFF9F9F9FFF9F9F9FFF9F9F9FFF9F9F9FFF9F9F9FFF9F9F9FFFFFC
      F9FFFFF5EBFFFFF0E2FFCC6600FF00000000FFDAAC00FFFFDE00FFFFDE00FFFF
      DE00FFFFDE00FFFBD800FCEEC400FAE1B200FAE4B600FCF3CB00FFFFDE00FFFF
      DE00FFFFDE006B6B6B0000000000000000000000000000000000000000000000
      00000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CC6600FFDF7A00FFDF7A00FFDF7A
      00FFDF7A00FFDF7A00FFDF7A00FFDF7A00FFDF7A00FFDF7A00FFDF7A00FFDF7A
      00FFDF7A00FFDF7A00FFCC6600FF0000000000000000FFDAAC00FFDAAC00FFDA
      AC00EBCCA400ECB77300EFB56F00F1B67200F3BA7800F5BD7D00FAC88F00FFE8
      BF00FFFFDE006B6B6B0000000000000000000000000000000000000000000000
      0000000000000000000000FFFF0000FFFF0000FFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CE6800FFCF6900FFCF6900FFCF69
      00FFCF6900FFCF6900FFCF6900FFCF6900FFCF6900FFCF6900FFCF6900FFCF69
      00FFCF6900FFCF6900FFCE6800EF000000000000000000000000000000000000
      0000000000000000000000000000F5BD7D00F6BF8200F8C18500F9C38900FBC6
      8E00FFDDB0006B6B6B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CC660030D27313FFD27313FFD273
      13FFD27313FFD27313FFD27313FFD27313FFD27313FFD27313FFD27313FFD273
      13FFD27313FFD27313FFCC660040000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F5BD7D00F9C99700FDC9
      9400F7D1AA00000000000000000000000000424D3E000000000000003E000000
      2800000040000000300000000100010000000000800100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000081FFFFFF00000000801FFFFF00000000
      800F800100000000800780010000000080078001000000008007800100000000
      8003800100000000800380010000000080038001000000008001800100000000
      800080010000000083C3800100000000FFC3800100000000FC07800100000000
      FC0F800100000000FF3FFFFF00000000FFFFFFFFFFFFFFFFE0C3FFFFFFFFF0FF
      8001FFFF0001E03F0000FEFF0001C00F0001FC7F0001C0070001F83F00018007
      0001F01F000180070001E00F000080030001C007000000038007800300010003
      C00FF83F00010003F00FF83F00010003F00FF83F00010003F00FF83F00018003
      F83FFFFF0001FE03FCFFFFFF0001FF8700000000000000000000000000000000
      000000000000}
  end
  object taskListPopupMenu: TPopupMenu
    AutoHotkeys = maManual
    Left = 224
    Top = 320
    object delTasks_Menu: TMenuItem
      AutoHotkeys = maManual
      Caption = #21024#38500#36873#20013#30340#20219#21153'(&D)'
      OnClick = deltask_tbClick
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object ClearAlltasks_menu: TMenuItem
      Caption = #28165#31354#25152#26377#30340#20219#21153'(&C)'
      OnClick = ClearAlltasks_menuClick
    end
  end
  object FoundPopMenu: TPopupMenu
    AutoHotkeys = maManual
    Left = 256
    Top = 320
    object FoundMem_Memu: TMenuItem
      AutoHotkeys = maManual
      Caption = #26597#30475#19982#32534#36753#20869#23384'(&M)'
      OnClick = FoundMem_MemuClick
    end
    object N4: TMenuItem
      Caption = '-'
    end
    object FoundAdd_memu: TMenuItem
      Caption = #30452#25509#21152#20837#38145#23450#21015#34920'(&A)'
      OnClick = FoundAdd_memuClick
    end
    object N5: TMenuItem
      Caption = '-'
    end
    object EditLock_Memu: TMenuItem
      Caption = #32534#36753#21644#38145#23450'(&E)'
      OnClick = EditLock_MemuClick
    end
  end
  object LockPopMenu: TPopupMenu
    AutoHotkeys = maManual
    Left = 288
    Top = 320
    object LockAddress_menu: TMenuItem
      AutoHotkeys = maManual
      Caption = #26597#30475#19982#32534#36753#20869#23384'(&M)'
      OnClick = LockAddress_menuClick
    end
    object N9: TMenuItem
      Caption = '-'
    end
    object LockMod_memu: TMenuItem
      Caption = #20462#25913#38145#23450#25968#25454'(&M)'
      OnClick = Lock_LVDblClick
    end
    object N7: TMenuItem
      Caption = '-'
    end
    object Lockcopy_memu: TMenuItem
      Caption = #22797#21046#38145#23450#26465#30446'(&C)'
      OnClick = Lockcopy_memuClick
    end
    object Lockpaste_menu: TMenuItem
      Caption = #31896#36148#38145#23450#26465#30446'(&P)'
      OnClick = Lockpaste_menuClick
    end
    object N6: TMenuItem
      Caption = '-'
    end
    object LockRemove_menu: TMenuItem
      Caption = #21024#38500#38145#23450#22320#22336'(&D)'
      OnClick = LockRemove_menuClick
    end
    object Lock_Clear: TMenuItem
      Caption = #28165#31354#39033#30446'(&A)'
      OnClick = Lock_ClearClick
    end
  end
  object AddNew: TPopupMenu
    AutoHotkeys = maManual
    Left = 192
    Top = 320
    object New1_menu: TMenuItem
      Caption = #30456#21516#30340#36827#31243'(&S)'
      OnClick = New1_menuClick
    end
    object N3: TMenuItem
      Caption = '-'
    end
    object new2_menu: TMenuItem
      Caption = #19981#21516#30340#36827#31243'(&D)'
      OnClick = newtask_TBClick
    end
  end
  object openLockRecordDialog: TOpenDialog
    DefaultExt = 'GPX'
    Filter = #27743#28246#34892'II(Game Paladin II)'#30340#23384#26723#25991#20214'(*.gpx)|*.gpx|'#25152#26377#25991#20214#31867#22411'(*.*)|*.*'
    Options = [ofHideReadOnly, ofPathMustExist, ofFileMustExist, ofEnableSizing]
    Title = #36733#20837#27743#28246#34892'II(Game Paladin II)'#30340#23384#26723#25991#20214
    Left = 504
    Top = 320
  end
  object SaveLockRecordDialog: TSaveDialog
    DefaultExt = 'GPX'
    FileName = 'D:\Study\DelphiStudy\my projects\GamePaladin\CN\w.gpx'
    Filter = #27743#28246#34892'II(Game Paladin II)'#30340#23384#26723#25991#20214'|*.gpx|'#25152#26377#25991#20214'(*.*)|*.*'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Title = #20445#23384#23384#26723#25968#20540#25991#20214
    Left = 536
    Top = 320
  end
  object ImageList1: TImageList
    Left = 416
    Top = 320
    Bitmap = {
      494C01012F003100040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      000000000000360000002800000040000000D0000000010020000000000000D0
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000025A9D8FF25A9D8FF0099CC400000
      0000000000000000000000000000000000000000000000660060006600100000
      000000000000000000000000000000000000000000000000000025A9D8FF25A9
      D8FF25A9D8FF0099CC500099CC20000000000000000000000000000000000000
      00000000000000000000000000000000000025A9D8FF40B3D9BF0099CC8F0099
      CC500099CC100000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000025A9D8FFBFE6F2FF40BCE9FF24AD
      DCFF12A3D4CF0099CC8F0099CC500099CC2000000000006600BF006600CF0066
      00300000000000000000000000000000000000000000A67373FFA67373FFA673
      73FFA67373FFA67373FFA67373FFA67373FF0099CCAF0099CC700099CC300000
      00000000000000000000000000000000000025A9D8FF70C6E2FF87D6F5FF3AB9
      E6FF1DA9D9FF0099CCCF0099CC9F0099CC600099CC2000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000025A9D8FF86D0ECFFA0E6FFFF76DC
      FFFF76DCFFFF68D4F9FF52C8EFFF36B8E2FF1BA9D7DF007029EF0B9A14FF016E
      02EF0066006000000000000000000000000000000000BC8E7FFFFFE1D0FFFFDB
      C5FFFFD7BDFFCFBF94FF809A5BFF668049FF65CACFFF60D2F2FF48C4E9FF28B1
      DCFF19A7D6CC1BA5D559000000000000000025A9D8FF3FB3DCFFC3EFFFFF76DC
      FFFF76DCFFFF76DCFFFF5ACCF2FF44C0E9FF27B0DCFF099ECFEF0099CCAF0099
      CC700099CC300000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000025A9D8FF64C6EDFFCFF5FFFF80E5
      FFFF60C5BFFF08740EFF0F821CFF0D801AFF0B7E16FF0A8015FF15AE29FF0BA0
      14FF017402FF0066008F000000000000000000000000BC8E7FFFFFECD7FFFFE7
      CFFF80A361FF307D24FF207416FF026B03FF0A7D15FF2A8F50FF80E6EFFF89EF
      FFFF60CEF4FF29ADD9E8000000000000000025A9D8FF5AC3EFFFCFEFF9FF80E5
      FFFF80E5FFFF80E5FFFF80E5FFFF80E5FFFF3076FFFF1049FFFF70DCF9FF4DC5
      ECFF22A9D9F325A9D80E00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000025A9D8FF62C7F2FFC7EAF5FF89EF
      FFFF67CDBFFF157920FF42DB75FF38D16BFF32CB64FF28C152FF1FB83DFF15AE
      29FF0BA416FF028205FF006600CF0066001000000000C29581FFFFF3E7FFFFEC
      D7FFFFE7CFFFFFE0C2FFFFDCBAFFDBAD9EFF108620FF21A33DFF3FA570FF93F9
      FFFF7AE1FEFF2DAFDAFF14A2D23C0000000025A9D8FF7DD2FAFF8FD2E9FFA2F4
      FFFF8CF2FFFF8CF2FFFF8CF2FFFF4F9EFFFF0033FFFF0033FFFF72CEFFFF83E9
      FFFF43BCE5FF1BA5D5B100000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000025A9D8FF66C9F8FF90D4EDFFB4FA
      FFFF6ED4BFFF157920FF39C55FFF31BD57FF29B54FFF29B851FF28C152FF1FB8
      3DFF14AA28FF057E09FF006600AF0000000000000000C99A83FFFFF7EFFFFFF3
      E7FFFFECD7FFFFE7CFFFFFE0C2FFDBAD9EFF137920FF45DE78FF137F20FFA0FF
      FFFF83E6FFFF68CEE9FF3AB5DDBE0000000025A9D8FF7ED3FBFF4BBAE3FFD1FD
      FFFF96FCFFFF96FCFFFF5CAFFFFF0033FFFF1D59FFFF0033FFFF418BFFFF8AF0
      FFFF82DFFBFF27AAD8FB25A9D813000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000025A9D8FF78D2FFFF70C6EBFFD4FF
      FFFF8CECDFFF157920FF157920FF157920FF157920FF157920FF32CB64FF24B6
      48FF06750BFF2C9571DF000000000000000000000000D0A086FFFFFEFEFFFFF7
      EFFFFFF3E7FFFFECD7FFFFECD7FF006600FF4FE782FF4FE782FF2DAC46FF0066
      00FF64BFBFFFB5EEF7FF34B0DBFD0099CC1025A9D8FF8AD8FFFF40B9ECFFE2F9
      FCFFA0FFFFFF6CBFFFFF0033FFFF2059FFFF96F2FFFF1E59FFFF1D59FFFF91F2
      FFFF99E6FFFF5AC5E4FF1FA6D6A8000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000025A9D8FF88DFFFFFBC8E7FFF9DD6
      E9FFC1ECF5FFE7FFFFFFD9FFFFFFC8FFFFFFB9FFFFFF2E8C40FF28B14BFF0A73
      16FFAAD9BFFFC4F2F9FF25A9D8FF0000000000000000D7A788FFFFFFFFFFFFFE
      FEFFFFF7EFFFFFF3E7FFF4B9ADFFDBAD9EFF006600FF59F28CFF0C7812FF9FE6
      FFFF9FE6FFFFF2FFFFFF43B5DEFF25A9D8FF25A9D8FF96DFFFFF69D3FCFF67C3
      E2FFBBE6F2FFC6D9FFFF8099FFFFC9F2FFFFB9FFFFFF69A6FFFF0033FFFF81CC
      FFFFA2E6FFFFCEF7FBFF28AAD8F825A9D81C0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000025A9D8FF95EAFFFFC29581FFEEE9
      E4FF25A9D8FF25A9D8FF25A9D8FF25A9D8FFE2FFFFFF368C40FF298330FF8FDC
      EFFFF2FFFFFFF2FFFFFF25A9D8FF0000000000000000DDAD8BFFFFFFFFFFFFFF
      FFFFFFFEFEFFFFF7EFFFA67373FFA67373FFFCF0E6FF0C7812FFA67373FFA1DB
      E9FF57BFE1FF63C1E2FF44B5DDFF25A9D8FF25A9D8FFA5EAFFFF83E8FFFF83E8
      FFFF63D5F2FF4BC7E9FF5BCAE9FF81D1E9FFECFFFFFFBEE6FFFF0033FFFF4080
      FFFFACE6FFFFF2FFFFFF5CC0E1FF22A8D7A10000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000025A9D8FF97F9FFFFC99A83FFF2EF
      ECFFFFF5EBFFFFF1E3FFFFECD7FFCFDCD4FF25A9D8FF25A9D8FFAFDFEFFFACDF
      F2FFFFFFFFFFFFFFFFFFDFF2F9FF25A9D8FF00000000E2B18DFFE2B18DFFE2B1
      8DFFE2B18DFFE2B18DFFA67373FFFCF0E6FFFFF1E3FF9FB382FFA67373FF9EE0
      DDFF25A9D8FF00000000000000000000000025A9D8FFB0F4FFFF8FF5FFFF8FF5
      FFFF8FF5FFFF8FF5FFFF8FF5FFFF75E5F5FF76D2E9FF80CCE6FF104DF9FF1649
      FFFFECF9FFFFFFFFFFFFF3FAFDFF25A9D8FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000025A9D8FFA3FEFFFFD0A086FFF5F5
      F5FFFFFCF9FFFFF6ECFFFFF3E7FFFFECD7FFFFE9D2FFA67373FFA2E2DDFF25A9
      D8FF25A9D8FF25A9D8FF25A9D8FF25A9D8FF000000000000000025A9D8FFDCF9
      FCFFDDAD8BFFFFFFFFFFFFFFFFFFFFFDFBFFFFF6ECFFF4C496FFA67373FF25A9
      D8FF25A9D8FF00000000000000000000000025A9D8FFB2FDFFFF99FFFFFF99FF
      FFFF99FFFFFF99FFFFFF99FFFFFF99FFFFFF99FFFFFF99FFFFFF60B3FFFF0033
      FFFF0066E6BF25A9D8FF25A9D8FF25A9D8FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000025A9D8FFDAFEFFFFD7A788FFFAFA
      FAFFFFFFFFFFFFFDFBFFFFF6ECFFFFF3E7FFF3BAAFFFA67373FFC9E2DEFF25A9
      D8FF0000000000000000000000000000000000000000000000000000000025A9
      D8FFDDAD8BFFFFFFFFFFFCFCFCFFFAFAFAFFF8F6F4FFA67373FFA67373FF0000
      00000000000000000000000000000000000025A9D8FFCCF6FCFF99FFFFFF99FF
      FFFF99FFFFFFD7FCFFFFA2DBEFFF9CE3F2FFD7FCFFFFC7FEFFFFB8FFFFFF1A4D
      FFFF0033FFDF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000099CC1025A9D8FFDDAD8BFFFEFE
      FEFFFFFFFFFFFFFFFFFFFFFDFBFFFFF6ECFFA67373FFA67373FF25A9D8FF25A9
      D8FF000000000000000000000000000000000000000000000000000000000000
      0000E2B18DFFE2B18DFFE2B18DFFE2B18DFFE2B18DFFA67373FF000000000000
      0000000000000000000000000000000000000099CC1025A9D8FFB3E6F2FFD6F9
      FCFFDFFFFFFF77C9E4EF25A9D8FF25A9D8FF25A9D8FF25A9D8FF25A9D8FF25A9
      D8FF0033FFAF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E2B18DFFDCA9
      87FFDCA987FFDCA987FFDCA987FFDCA987FFA67373FFD5A28430000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000099CC3025A9D8FF25A9
      D8FF25A9D8FF0099CC3000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000090605DFF90605DFF90605DFF9060
      5DFF90605DFF90605DFF90605DFF90605DFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CC6600FFCC6600FFCC6600FFCC66
      00FFCC6600FFCC6600FFCC6600FFCC6600FFCC6600FFCC6600FFCC6600FFCC66
      00FFCC6600FFCC6600FFCC6600FF000000000000000000000000000000000000
      00000000000000000000A37774FFA37774FFA37774FFA37774FFA37774FFA377
      74FFA37774FFA37774FFA8766CFF000000000000000000000000000000000000
      000000000000000000000000000000000000BC8E7EFFF2E4D6FFFFE6CDFFFFE2
      C6FFFFDDBBFFFFD8B0FFFFD4A9FFA5736AFF000000000000000025A9D8FF25A9
      D8FF25A9D8FF0099CCAF0099CC800099CC400000000000000000000000000000
      000000000000000000000000000000000000CC6600FFFFFFFFFFFFFBF6FFFFF8
      F0FFFFF3E7FFFFF0E2FFFFECD9FFFFE9D3FFFFE5CAFFFFE2C5FFFFDEBCFFFFDB
      B6FFFFD6ADFFFFD3A7FFCC6600FF0000000000000000066F09FF066F09FF066F
      09FF066F09FF066F09FFBC8E7EFFE6DCD2FFFFE7CFFFFFE5CBFFFFDFBFFFFFDD
      BBFFFFD5AAFFFFD1A3FFA8766CFF0000000000000000066F09FF066F09FF066F
      09FF066F09FF066F09FF0000000000000000C39581FFF4E8DCFFFFECDAFFFFE6
      CDFFFFE2C6FFFFDDBBFFFFD8B0FFA5736AFF000000000000000025A9D8FF8FD2
      E9FF6FD2F5FF48C1ECFF2BB1DFFF16A5D6FF0099CCFF0099CCCF0099CC9F1EA6
      D6C50C9ED02C000000000000000000000000CC6600FFFFFFFFFFB3ADA8FFB3AD
      A8FFFFF3E7FFB3ADA8FFB3ADA8FFFFE9D3FFB3ADA8FFB3ADA8FFFFDEBCFFB3AD
      A8FFB3ADA8FFFFD4A9FFCC6600FF00000000000000000000000008740EFF35C1
      5BFF3CC862FF066F09FFC39581FFE9E0D8FFFFEDDCFFFFE7CFFFFFE5CCFFFFE0
      C1FFFFD9B3FFFFD5AAFFA8766CFF0000000000000000000000000C7C16FF48E1
      7BFF52EA85FF066F09FF90605DFF90605DFFCA9B84FFF5EFE8FFFFF0E0FFFFEC
      DAFFFFE6CDFFFFE2C6FFFFDDBBFFA5736AFF20A6D2FF15A2D0BF25A9D8FF48B7
      DFFFB8F0FFFF80E5FFFF80E5FFFF80E5FFFF80E5FFFF60D2F2FF40BFE6FF2AAD
      DCFF21A9D9EF000000000000000000000000CC6600FFFFFFFFFFFFFBF6FFFFF8
      F0FFFFF3E7FFFFF0E2FFFFECD9FFFFE9D3FFFFE5CAFFFFE2C5FFFFDEBCFFFFDB
      B6FFFFD6ADFFFFD3A7FFCC6600FF000000000000000000660080138C26FF3BD4
      6EFF45DE78FF066F09FFCA9B84FFECE7E2FFFFF0E0FFFFEEDDFFFFE8D2FFFFE5
      CCFFFFDDBBFFFFDAB5FFA8766CFF0000000000000000006600801EA03AFF3ED7
      71FF48E17BFF066F09FFD9A88AFFFFE2D2FFD2A187FFF7F3EEFFFFF6EDFFFFF0
      E0FFFFECDAFFFFE6CDFFFFE2C6FFA5736AFF20A6D2FFB5E5F5FF25A9D8FF4EBC
      E8FFCAF0F9FF8CF2FFFF8CF2FFFF8CF2FFFF8CF2FFFF8CF2FFFF8CF2FFFF70D9
      FBFF29ACDAFF079CCE6C0000000000000000CC6600FFFFFFFFFFB3ADA8FFB3AD
      A8FFFFF3E7FFB3ADA8FFB3ADA8FFFFE9D3FFB3ADA8FFB3ADA8FFFFDEBCFFB3AD
      A8FFB3ADA8FFFFDBB7FFCC6600FF0000000000000000026C04DF28C152FF1FA5
      3EFF0C7C16FF066F09FFD2A187FFEFEBE7FFFFF7EEFFFFF1E3FFFFEEDDFFFFEA
      D5FFFFE2C6FFFFDDBBFFA8766CFF0000000000000000036C06DF2BC456FF21A7
      41FF148A24FF066F09FFD9A88AFFFFEEDDFFD9A88AFFFAFAFAFFFFFAF4FFFFF6
      EDFFFFF0E0FFFFECDAFFFFE6CDFFA5736AFF25A9D8FFA7DEEFFF25A9D8FF76CF
      F7FF8FD2E9FFA6FFFFFF99FFFFFF99FFFFFF99FFFFFF99FFFFFF99FFFFFF80E6
      FFFF57C5EAFF2DAED9F00000000000000000CC6600FFFFFFFFFFFFFBF6FFFFF8
      F0FFFFF3E7FFFFF0E2FFFFECD9FFFFE9D3FFFFE5CAFFFFE2C5FFFFDEBCFFFFDB
      B6FFFFD6ADFFFFD3A7FFCC6600FF000000000000000006780BFF16A22BFF0066
      00CF00660040066F09FFD9A88AFFF2F2F1FFFFFAF4FFFFF7EEFFFFF2E4FFFFEE
      DDFFFFE5CCFFFFE4C9FFA8766CFF000000000000000007790DFF19A532FF0066
      00BF00000000066F09FFD9A88AFFFFF4E8FFDFAE8CFFFCFCFCFFFFFFFFFFFFFA
      F4FFFFF6EDFFFFF0E0FFFFDBCFFFA5736AFF25A9D8FF63CCFCFF25A9D8FF7ED7
      FFFF3CB5DFFFD2F2F9FFD7FFFFFFCEFFFFFFBBFFFFFFADFFFFFFADFFFFFF89E6
      FFFF94E0FBFF30AFDAFF099DCF7100000000CC6600FFFFFFFFFFFEC994FFFCC3
      88FFF8B978FFF5AF64FFF0A44FFFEB9839FFE88D26FFE48416FFE27E0AFFE27E
      0AFFE27E0AFFFFE3C8FFCC6600FF0000000000000000006600CF07830DFF0066
      00500000000000000000DFAE8CFFF7F7F7FFFFFFFFFFFFFBF5FFFFF7EEFFFFF4
      E8FFFFECD9FFFFE6CDFFA8766CFF0000000000000000026C04DF0B8A15FF0066
      00400000000000000000D9A88AFFFFF8EFFFE5B38FFFFDFDFDFFFFFFFFFFFFFF
      FFFFFFFAF4FF90605DFF90605DFF90605DFF25A9D8FF63CCFCFF25A9D8FF93E7
      FFFF79E1FCFF53CCECFF43C2E6FF53C2E2FF9FD9ECFFE6FFFFFFD9FFFFFF9FE6
      FFFFACE6FFFF86D2EBFF32AED9F200000000CC6600FFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBF6FFFFF8
      F0FFFFF3E7FFFFE9D2FFCC6600FF000000000000000000660050016A02FF0066
      00BF0000000000000000E5B38FFFEAEEFAFF0033FFFFBFCCFFFFCFD6F9FFFFF7
      EEFFA8766CFFA8766CFFA8766CFF00000000000000000066009F026E03FF0066
      00800000000000000000D9A88AFFFFFEFCFFEAB891FFFFFFFFFFFDFDFDFFFBFB
      FBFFF9F9F9FF90605DFFEDA754FFD5AB97FF25A9D8FF63CCFCFF25A9D8FFA8FA
      FFFF96FCFFFF96FCFFFF96FCFFFF96FCFFFF68DEEFFF66CCE6FF6CCCE6FF80CC
      E6FF8FD2E9FFB7E3F1FF25A9D8FF00000000CC6600FFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFB3ADA8FFB3ADA8FFFFFFFFFFB3ADA8FFB3ADA8FFFFFFFFFFB3AD
      A8FFB3ADA8FFFFEAD6FFCC6600FF000000000000000000000000006600600066
      00EF006600AF00660020EAB891FF305EFFFF0046FFFF1045FFFF1040FFFFFFFD
      FAFFA8766CFFF7AB42FFCF9166EF000000000000000000660010006600CF0066
      00EF0066003000000000D9A88AFF5073FFFF8F9CECFFDCA987FFDCA987FFDCA9
      87FFDCA987FF90605DFFD5AB97FF0000000025A9D8FF7ADFFFFF25A9D8FFC2FE
      FFFF99FFFFFF99FFFFFFBEFFFFFFC6F8FCFFCCFFFFFFAFF9FCFFB3FFFFFF39BF
      DFFF0099CC9F25A9D8FF25A9D8FF00000000CC6600FFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBF6FFFFF8
      F0FFFFF3E7FFFFF0E1FFCC6600FF000000000000000000000000000000000066
      0010006600600044AABF0033FFDF0C8DFFFF99EDFDFF0E93FFFF204DFFFF5E7E
      FDFFA8766CFFD29870FF00000000000000000000000000000000006600100066
      009F006600DF0044AABF0F3FFEFF204DFFFF5073FFFF1040FFFFFFFFFFFF9060
      5DFF90605DFF90605DFF000000000000000025A9D8FF93F9FFFF3CB5DFFF99D9
      ECFFA6E6F2FFD9FFFFFF9FD9ECFF25A9D8FF25A9D8FF25A9D8FF25A9D8FF25A9
      D8FF0099CC50000000000000000000000000CC6600FFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFFF9
      F3FFFFF8EFFFFFF2E5FFCC6600FF000000000000000000000000000000000000
      0000000000000033FF600033FFBF0588FFFF66E3FEFF0789FFFF0033FFCF0033
      FF70000000000000000000000000000000000000000000000000000000000000
      00000033FF100033FF500047FFEF23ADFFFF1A95FFFF305EFFFFFFFFFFFF9060
      5DFFEDA754FFCC998060000000000000000025A9D8FF99FFFFFF99FFFFFF25A9
      D8FF25A9D8FF25A9D8FF25A9D8FF99FFFFFF99FFFFFF0099CCFF000000000000
      000000000000000000000000000000000000CC6600FFDF7A00FFDF7A00FFDF7A
      00FFDF7A00FFDF7A00FFDF7A00FFDF7A00FFDF7A00FFDF7A00FFDF7A00FFDF7A
      00FFDF7A00FFDF7A00FFCC6600FF000000000000000000000000000000000000
      000000000000000000000033FFEF0033FF9F0041FFFF0036FFCF0033FFFF0000
      0000000000000000000000000000000000000000000000000000000000000000
      00000033FF400033FFFF0063FFFF70E6FEFF5ADCFEFF003DFFFF0033FFFF9060
      5DFFD9A6866000000000000000000000000025A9D8FFD2FFFFFFC6FFFFFFD2FF
      FFFF25A9D8FF25A9D8FF25A9D8FF25A9D8FF25A9D8FF25A9D8FF000000000000
      000000000000000000000000000000000000CE6800FFCF6900FFCF6900FFCF69
      00FFCF6900FFCF6900FFCF6900FFCF6900FFCF6900FFCF6900FFCF6900FFCF69
      00FFCF6900FFCF6900FFCE6800EF000000000000000000000000000000000000
      0000000000000000000000000000000000000033FFDF0033FF20000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000033FF400038FFFF007FFFFF006FFFFF0036FFEF0033FF200000
      0000000000000000000000000000000000000099CC5025A9D8FF25A9D8FF25A9
      D8FF0099CC300000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CC660030D27313FFD27313FFD273
      13FFD27313FFD27313FFD27313FFD27313FFD27313FFD27313FFD27313FFD273
      13FFD27313FFD27313FFCC660040000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000033FF500033FF8F0033FFBF0033FF8F0033FFAF0033FF200000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000033FF500033FF4000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007070
      709F948B8BBF9E8989AF6C5F5F70333333200000000000000000000000000000
      000000000000000000000000000000000000CC6600FFCC6600FFCC6600FFCC66
      00FFCC6600FFCC6600FFCC6600FFCC6600FFCC6600FFCC6600FFCC6600FFCC66
      00FFCC6600FFCC6600FFCC6600FF00000000CC6600FFCC6600FFCC6600FFCC66
      00FFCC6600FFCC6600FFCC6600FFCC6600FFCC6600FFCC6600FFCC6600FFCC66
      00FFCC6600FFCC6600FFCC6600FF00000000CC6600FFCC6600FFCC6600FFCC66
      00FFCC6600FFCC6600FFCC6600FFCC6600FFCC6600FFCC6600FFCC6600FFCC66
      00FFCC6600FFCC6600FFCC6600FF000000000000000000000000333333209E9E
      9EFFACA3A3FFAA9797FFD4B2B2FFCCA6A6FF0000000000000000000000000000
      000000000000000000000000000000000000CC6600FFFFFFFFFFFFFCF8FFFFF8
      F0FFFFF3E7FFFFF1E3FFFFECD9FFFFE9D3FFFFE5CAFFFFE2C5FFFFDDBBFFFFDB
      B5FFFFD5ABFFFFD3A7FFCC6600FF00000000CC6600FFFFFFFFFFFFFCF8FFFFF8
      F0FFFFF3E7FFFFF1E3FFFFECD9FFFFE9D3FFFFE5CAFFFFE2C5FFFFDDBBFFFFDB
      B5FFFFD5ABFFFFD3A7FFCC6600FF00000000CC6600FFFFFFFEFFFFF9F3FFFFF8
      EFFFFFF2E5FFFFF0E1FFFFEAD6FFFFE9D2FFFFE3C8FFFFE2C4FFFFDCB9FFFFDB
      B5FFFFD5ABFFFFD3A7FFCC6600FF0000000000000000000000009D9D9DFFA7A7
      A7FF979494FF464646FF484848FF978181FF3333331000000000000000000000
      000000000000000000000000000000000000CC6600FFFFFFFFFFFFFEFCFFFFF8
      F1FFFFF7EDFFFFF1E3FFFFEFDFFFFFE9D4FFFFE8D0FFB3ADA8FFB3ADA8FFB3AD
      A8FFFFDAB3FFFFD4A9FFCC6600FF00000000CC6600FFFFFFFFFFFFFFFFFFB3B1
      AFFFB3B1AFFFFFF3E7FFECE0D4FFB3ADA8FFB3ADA8FFFFE5CAFFFFE2C5FFB3AA
      A0FFB3AAA0FFFFD4A9FFCC6600FF00000000CC6600FFFFFFFFFFFFFFFEFFFFF9
      F3FFFFF8EFFFFFF2E5FFFFF0E1FFFFEAD6FFFFE9D2FFFFE3C8FFFFE2C4FFFFDC
      B9FFFFDBB5FFFFD5ABFFCC6600FF0000000000000000000000009D9D9DFFACAC
      ACFF989797FF4F4F4FFF605D5DFF938282FF29335C500033FF9F0033FF100000
      000000000000000000000000000000000000CC6600FFFFFFFFFFFFFFFFFFFFFE
      FCFFFFF8F1FFFFF7EDFFFFF1E3FFFFEFDFFFFFE9D4FFFFE9D4FFFFDDBBFFFFE1
      C2FFFFE1C2FFFFDAB3FFCC6600FF00000000CC6600FFFFFFFFFFFFFFFFFF4B79
      FFFF4B79FFFFFFF8F0FFF9EEE3FF993300FF993300FFFFE9D3FFFFE5CAFF0099
      CCFF0099CCFFFFDAB3FFCC6600FF00000000CC6600FFBF6010FFCC8C60FFFFFF
      FEFFECD4C6FFAE4800FFAB501CFFD9A98DFFBA5F1CFFB7560DFFB96633FFA648
      18FFBF7244FFFFDBB5FFCC6600FF000000000000000000000000757575FFB4B4
      B4FF7D7D7DFF515151FF6A6767FF978A8AFF0A33D6EF0033FFFF0033FF600000
      000000000000000000000000000000000000CC6600FFFFFFFFFFFFFFFFFFB3AC
      A5FFB3ACA5FFB3ACA5FFFFF7EDFFFFF1E3FFFFEFDFFF993300FF993300FF9933
      00FFFFE1C2FFFFDBB7FFCC6600FF00000000CC6600FFFFFFFFFFFFFFFFFF4B79
      FFFF4B79FFFFFFFBF6FFFFF8F0FF993300FF993300FFFFECD9FFFFE9D3FF0099
      CCFF0099CCFFFFDBB7FFCC6600FF00000000CC6600FFDFB99FFFC68050FFCC99
      80FFC28360FFB75100FFF2DFD1FFFFF2E6FFDAA071FFCC7A35FFFFE9D2FFDFAE
      8CFF993300FFE6B28BFFCC6600FF000000000000000000000000757575FFB9B9
      B9FF858585FF595959FF555555FF2544C3FF0033FFEF0033FFCF0033FF9F0000
      000000000000000000000000000000000000CC6600FFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFF8F1FFFFF7EDFFFFF1E3FF993300FF993300FF9933
      00FFFFE2C6FFFFE1C2FFCC6600FF00000000CC6600FFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFBF6FFFFFBF6FFFFF0E2FFFFF0E2FFFFECD9FFFFEC
      D9FFFFE2C5FFFFE1C2FFCC6600FF00000000CC6600FFFFFFFFFFB96630FFF9F2
      EFFFC66D20FFCC8C60FFFFFBF6FFFFF8F0FFDFA775FFCA6F1CFFD79A6AFFB15A
      28FFB36033FFF9D7B9FFCC6600FF000000000000000000000000757575FFC2C2
      C2FF7BA288FF3CD56FFF288EC1FF0E3EFDFF1433AD500033FF600033FFEF0000
      000000000000000000000000000000000000CC6600FFFFFFFFFFFFFFFFFF4B79
      FFFF4B79FFFF4B79FFFFFFFEFCFFFFF8F1FFFFF7EDFF993300FF993300FF9933
      00FFFFE8D0FFFFE3C8FFCC6600FF00000000CC6600FFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBF6FFFFF0E2FFFFF5EAFFFFF0E2FFFFEC
      D9FFFFE2C5FFFFE3C8FFCC6600FF00000000CC6600FFFFFFFFFFDFB99FFFB764
      30FFCA6500FFF2E6DFFFFFFFFFFFFFFBF6FFDFA978FFD27D2AFFE6C1AAFFB45F
      2AFFBB6935FFFFE5CAFFCC6600FF000000000000000000000000757575FFC7C7
      C7FF7CA288FF44DD77FF36C383FF777777FF000000000033FF200033FFFF0033
      FF5000000000000000000000000000000000CC6600FFFFFFFFFFFFFFFFFF4B79
      FFFF4B79FFFF4B79FFFFFFFFFFFFFFFEFDFFFFF9F3FFFFF9F3FFFFF8EFFFFFF2
      E5FFFFEAD6FFFFE9D2FFCC6600FF00000000CC6600FFFFFFFFFFFFFFFFFFB3AD
      A8FFB3ADA8FFFFFFFFFFFFFFFFFFB3ADA8FFB3ADA8FFFFF8F0FFFFF5EBFFB3AD
      A8FFB3ADA8FFFFE9D2FFCC6600FF00000000CC6600FFFFFFFFFFFFFFFFFFD279
      20FFD29360FFFFFFFFFFFFFFFFFFF9F2EFFFD2915DFFD27E2DFFE6C2ACFFC378
      47FFAE521AFFFFE9D3FFCC6600FF000000000000000000000000757575FFCFCF
      CFFF7EA48BFF55EE88FF3AD26AFF777777FF00000000000000000033FFAF0033
      FFAF00000000000000000000000000000000CC6600FFFFFFFFFFFFFFFFFF4B79
      FFFF4B79FFFF4B79FFFFFFFFFFFFFFFFFFFFFFFFFEFFFFF9F3FFFFF8EFFFFFF2
      E5FFFFF0E1FFFFEAD6FFCC6600FF00000000CC6600FFFFFFFFFFFFFFFFFFCC99
      99FFCC9999FFFFFFFFFFFFFFFFFFE27E0AFFE27E0AFFFFFCF9FFFFF8F0FF0099
      00FF009900FFFFEAD6FFCC6600FF00000000CC6600FFFFFFFFFFFFFFFFFFD279
      20FFF2E6DFFFFFFFFFFFFFFFFFFFF2E6DFFFE6B380FFD27E2DFFD27E2DFFD27E
      2DFFF9E4D4FFFFECD9FFCC6600FF0000000000000000000000009D9D9DFFD4D4
      D4FF919A94FF5CA870FF62C17EFF777777FF00000000000000000033FF600033
      FFFF0033FF20000000000000000000000000CC6600FFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFFF9F3FFFFF8
      EFFFFFF2E5FFFFF0E1FFCC6600FF00000000CC6600FFFFFFFFFFFFFFFFFFCC99
      99FFCC9999FFFFFFFFFFFFFFFFFFE27E0AFFE27E0AFFFFFFFFFFFFFCF9FF0099
      00FF009900FFFFF0E1FFCC6600FF00000000CC6600FFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBF6FFFFF8
      F0FFFFF3E7FFFFF0E2FFCC6600FF0000000000000000000000009D9D9DFF9D9D
      9DFFA0A0A0FF757575FF7B7B7BFF777777FF0000000000000000000000000033
      FFDF0033FF9F000000000000000000000000CC6600FFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFFF9
      F3FFFFF8EFFFFFF2E5FFCC6600FF00000000CC6600FFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFFF9
      F3FFFFF8EFFFFFF2E5FFCC6600FF00000000CC6600FFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFFF9
      F3FFFFF8EFFFFFF2E5FFCC6600FF00000000000000000000000077777740A0A0
      A0FF696161FF616161FF707070FF707070EF0000000000000000000000000033
      FF500033FF80000000000000000000000000CC6600FFDF7A00FFDF7A00FFDF7A
      00FFDF7A00FFDF7A00FFDF7A00FFDF7A00FFDF7A00FFDF7A00FFDF7A00FFDF7A
      00FFDF7A00FFDF7A00FFCC6600FF00000000CC6600FFDF7A00FFDF7A00FFDF7A
      00FFDF7A00FFDF7A00FFDF7A00FFDF7A00FFDF7A00FFDF7A00FFDF7A00FFDF7A
      00FFDF7A00FFDF7A00FFCC6600FF00000000CC6600FFDF7A00FFDF7A00FFDF7A
      00FFDF7A00FFDF7A00FFDF7A00FFDF7A00FFDF7A00FFDF7A00FFDF7A00FFDF7A
      00FFDF7A00FFDF7A00FFCC6600FF000000000000000000000000000000004343
      43CF412424EF3333331000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CE6800FFCF6900FFCF6900FFCF69
      00FFCF6900FFCF6900FFCF6900FFCF6900FFCF6900FFCF6900FFCF6900FFCF69
      00FFCF6900FFCF6900FFCE6800EF00000000CE6800FFCF6900FFCF6900FFCF69
      00FFCF6900FFCF6900FFCF6900FFCF6900FFCF6900FFCF6900FFCF6900FFCF69
      00FFCF6900FFCF6900FFCE6800EF00000000CE6800FFCF6900FFCF6900FFCF69
      00FFCF6900FFCF6900FFCF6900FFCF6900FFCF6900FFCF6900FFCF6900FFCF69
      00FFCF6900FFCF6900FFCE6800EF000000000000000000000000000000008484
      84BF7D7979BF0000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CC660030D27313FFD27313FFD273
      13FFD27313FFD27313FFD27313FFD27313FFD27313FFD27313FFD27313FFD273
      13FFD27313FFD27313FFCC66004000000000CC660030D27313FFD27313FFD273
      13FFD27313FFD27313FFD27313FFD27313FFD27313FFD27313FFD27313FFD273
      13FFD27313FFD27313FFCC66004000000000CC660030D27313FFD27313FFD273
      13FFD27313FFD27313FFD27313FFD27313FFD27313FFD27313FFD27313FFD273
      13FFD27313FFD27313FFCC660040000000000000000000000000000000004343
      43502B1A1A600000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CC6600FFCC6600FFCC66
      00FFCC6600FFCC6600FFCC6600FFCC6600FFCC6600FFCC6600FFCC6600FFCC66
      00FFCC6600FFCC6600FFCC6600FFCC6600FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000006699100774A5FF0570
      A1FF006699FF006699FF006699FF006699FF006699FF006699FF006699FF0066
      99FF006699FF006699FF006699400000000000000000CC6600FFFFFFFFFFFFFC
      F8FFFFF8F0FFFFF3E7FFFFF1E3FFFFECD9FFFFE9D3FFFFE5CAFFFFE2C5FFFFDD
      BBFFFFDBB5FFFFD5ABFFFFD3A7FFCC6600FFA37774FFA37774FFA37774FFA377
      74FF00000000000000000099003020A620FF000000000000000000000000A377
      74FFA37774FFA37774FFA37774FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000A37774FFA37774FFA37774FFA37774FF00000000268CB3FF43A9C6FF0073
      A6FF309FC2FF309FC2FF309FC2FF309FC2FF309FC2FF309FC2FF309FC2FF309F
      C2FF309FC2FF309FC2FF2693B9CF0000000000000000CC6600FFFFFFFFFFFFFF
      FFFFB3B1AFFFB3B1AFFFFFF3E7FFECE0D4FFB3ADA8FFB3ADA8FFFFE5CAFFFFE2
      C5FFB3AAA0FFB3AAA0FFFFD4A9FFCC6600FFAB7F77FFFFF0E0FFFFE5CCFFA377
      74FF0000000000990060009900FF009900DF000000000000000000000000AB7F
      77FFFFF0E0FFFFE5CCFFA37774FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000AB7F77FFFFF0E0FFFFE5CCFFA37774FF00000000268CB3FF4DB3CCFF0066
      99FF348AB2FF348AB2FF338AB2FF328AB2FF328AB2FF328AB2FF328AB2FF328A
      B2FF3089B2FF2380ABFF006699EF0000000000000000CC6600FFFFFFFFFFFFFF
      FFFF4B79FFFF4B79FFFFFFF8F0FFF9EEE3FF993300FF993300FFFFE9D3FFFFE5
      CAFF0099CCFF0099CCFFFFDAB3FFCC6600FFC39581FFFFFAF5FFFFF0E0FFA377
      74FF00000000009900BF009900FF009900FF009900FF009900FF00000000C395
      81FFFFFAF5FFFFF0E0FFA37774FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C39581FFFFFAF5FFFFF0E0FFA37774FF00000000268CB3FF5BC9DEFF2981
      ACFFD4F7FCFFD1F6FCFFC4E4E9FFA6B5B8FFB3CED4FFCBF5FCFFC9F4FCFFC7F4
      FCFFC7F4FCFF4A9BBEFF006699500000000000000000CC6600FFFFFFFFFFFFFF
      FFFF4B79FFFF4B79FFFFFFFBF6FFFFF8F0FF993300FF993300FFFFECD9FFFFE9
      D3FF0099CCFF0099CCFFFFDBB7FFCC6600FFDFAE8BFFFFFFFFFFA37774FFA377
      74FF00000000000000000099009F60BF60FF000000000000000000000000DFAE
      8BFFFFFFFFFFA37774FFA37774FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000DFAE8BFFFFFFFFFFA37774FFA37774FF00000000268CB3FF4EC0D9FF408C
      B3FFDCF8FDFFDCF8FDFFB9C7CAFF9E9E9EFF9D8989FF9A9495FFD1F6FCFFD1F6
      FCFFCFF6FCFF338AB2FF000000000000000000000000CC6600FFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBF6FFFFFBF6FFFFF0E2FFFFF0E2FFFFEC
      D9FFFFECD9FFFFE2C5FFFFE1C2FFCC6600FFEBB990FFDCA987FFA37774FFE2B0
      8B8F0000000000000000000000007FCC7FFF000000000000000000000000EBB9
      90FFDCA987FFA37774FFE2B08B8F000000000000000000000000000000000000
      00000000000000000000009900FF009900FF009900FF009900FF009900FF0000
      0000EBB990FFDCA987FFA37774FFE2B08B8F00000000268CB3FF43B9D5FF408C
      B3FFE5FAFDFFE3F9FDFF9D9D9DFFA3A1A1FF555555FF707779FFDBF8FDFFD8F7
      FDFFD6F7FCFF358AB2FF000000000000000000000000CC6600FFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBF6FFFFF0E2FFFFF5EAFFFFF0
      E2FFFFECD9FFFFE2C5FFFFE3C8FFCC6600FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000099008F009900FF009900FF009900FF0000
      000000000000000000000000000000000000000000002289B1FF3AB3D2FF408C
      B3FFEDFBFEFFEAFBFDFF757575FF878787FF505050FF666B6CFFE2F9FDFFDFF9
      FDFFDDF8FDFF378BB2FF000000000000000000000000CC6600FFFFFFFFFFFFFF
      FFFFB3ADA8FFB3ADA8FFFFFFFFFFFFFFFFFFB3ADA8FFB3ADA8FFFFF8F0FFFFF5
      EBFFB3ADA8FFB3ADA8FFFFE9D2FFCC6600FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000990020009900EF009900FF009900FF009900FF0000
      000000000000000000000000000000000000000000001D86AFFF2BA9CEFF408C
      B3FFF5FDFEFFF2FCFEFF757575FF7AB48DFF45AE68FF6C977EFFE9FBFDFFE6FA
      FDFFE6FAFDFF3A8BB2FF000000000000000000000000CC6600FFFFFFFFFFFFFF
      FFFFCC9999FFCC9999FFFFFFFFFFFFFFFFFFE27E0AFFE27E0AFFFFFCF9FFFFF8
      F0FF009900FF009900FFFFEAD6FFCC6600FFA37774FFA37774FFA37774FFA377
      74FF00000000000000000000000020A620FF009900300000000000000000A377
      74FFA37774FFA37774FFA37774FF00000000A37774FFA37774FFA37774FFA377
      74FF0000000000990010009900CF009900FF009900EF0099008F009900FF0000
      000000000000000000000000000000000000000000001380ACFF25A5CCFF408C
      B3FFFFFFFFFFFFFFFFFF757575FF81CD95FF48E17BFF71C08EFFF1FCFEFFF1FC
      FEFFEEFCFEFF3C8BB2FF000000000000000000000000CC6600FFFFFFFFFFFFFF
      FFFFCC9999FFCC9999FFFFFFFFFFFFFFFFFFE27E0AFFE27E0AFFFFFFFFFFFFFC
      F9FF009900FF009900FFFFF0E1FFCC6600FFAB7F77FFFFF0E0FFFFE5CCFFA377
      74FF000000000000000000000000009900EF009900EF0099005000000000AB7F
      77FFFFF0E0FFFFE5CCFFA37774FF00000000AB7F77FFFFF0E0FFFFE5CCFFA377
      74FF000000000099009F009900FF0099008F0099001000000000009900FF0000
      00000000000000000000000000000000000000000000117EABFF159AC7FF408C
      B3FFFFFFFFFFFFFFFFFF757575FF99C0A1FF4F9B69FF71A181FFFEFFFFFFFBFE
      FFFFF7FDFEFF3D8CB2FF000000000000000000000000CC6600FFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FEFFFFF9F3FFFFF8EFFFFFF2E5FFCC6600FFC39581FFFFFAF5FFFFF0E0FFA377
      74FF00000000009900DF009900DF009900FF009900FF009900FF00000000C395
      81FFFFFAF5FFFFF0E0FFA37774FF00000000C39581FFFFFAF5FFFFF0E0FFA377
      74FF00000000009900CF00990040000000000000000000000000000000000000
      000000000000000000000000000000000000000000000A79A9FF0F96C4FF408C
      B3FFFFFFFFFFFFFFFFFF9D9D9DFF7D7D7DFF787878FF969696FFFFFFFFFFFFFF
      FFFFFFFFFFFF408CB3FF000000000000000000000000CC6600FFDF7A00FFDF7A
      00FFDF7A00FFDF7A00FFDF7A00FFDF7A00FFDF7A00FFDF7A00FFDF7A00FFDF7A
      00FFDF7A00FFDF7A00FFDF7A00FFCC6600FFDFAE8BFFFFFFFFFFA37774FFA377
      74FF000000000000000000000000009900FF60BF60FF0000000000000000DFAE
      8BFFFFFFFFFFA37774FFA37774FF00000000DFAE8BFFFFFFFFFFA37774FFA377
      74FF000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000274A7FF008CBFFF408C
      B3FFFFFFFFFFFFFFFFFFD1D1D1FF6D6D6DFFCCCCCCFFE6E6E6FFFFFFFFFFFFFF
      FFFFFFFFFFFF408CB3FF000000000000000000000000CE6800FFCF6900FFCF69
      00FFCF6900FFCF6900FFCF6900FFCF6900FFCF6900FFCF6900FFCF6900FFCF69
      00FFCF6900FFCF6900FFCF6900FFCE6800EFEBB990FFDCA987FFA37774FFE2B0
      8B8F00000000000000000000000060BF60FF000000000000000000000000EBB9
      90FFDCA987FFA37774FFE2B08B8F00000000EBB990FFDCA987FFA37774FFE2B0
      8B8F000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000073A6FF008CBFFF408C
      B3FFFFFFFFFFFFFFFFFFE7E7E7FFAEAEAEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF408CB3FF000000000000000000000000CC660030D27313FFD273
      13FFD27313FFD27313FFD27313FFD27313FFD27313FFD27313FFD27313FFD273
      13FFD27313FFD27313FFD27313FFCC6600400000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000006C9FFF0089BCFF2079
      A6FF408CB3FF408CB3FF408CB3FF408CB3FF408CB3FF408CB3FF408CB3FF408C
      B3FF408CB3FF10709FFF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000669970006699FF4FC1
      D9FF60D9ECFF60D9ECFF60D9ECFF60D9ECFF60D9ECFF60D9ECFF60D9ECFF60D9
      ECFF60D9ECFF5BD5EAAF00000000000000000000000034AFDDFF34AFDDFF0099
      CC400099CC100000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D6AFAF1C00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000034AFDDFF9FD9ECFF16A5
      D6FF0099CCFF0099CCCF0099CC8F0099CC500099CC2000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B3808010C89F9F80CFAAAAE8AAA3A3EFA68D8D809F6C6C100000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000D6AFAF53D4ADADE8CDA9A9E1A88F8F809F6C6C100000
      0000000000000000000000000000000000000000000034AFDDFF34AFDDFF0099
      CC10000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000034AFDDFF78C9E6FFA0E6
      FFFF76DCFFFF5ACCF2FF3DBCE6FF109CB9FF0099CCFF0099CCDF0099CC9F0099
      CC5000000000000000000000000000000000000000000000000000000000C697
      972CD3AFAFBCD6B1B1FCD7B1B1FFD8B5B5FFABA8A8FFABA8A8FFA99B9BEFA384
      8480996666100000000000000000000000000000000000000000000000000000
      0000D2A9A952D4ADADE3D5AFAFF9D9B8B8FFC2B2B2FFAAAAAAFFA89E9EEFA48E
      8E70000000000000000000000000000000000000000034AFDDFF9EDAEFFF1DA9
      D9FF0099CCCF0099CC8F0099CC600099CC200000000000000000000000000000
      0000000000000000000000000000000000000000000034AFDDFF50BCE6FFC8F4
      FFFF83E8FFFF83E8FFFF83E8FFFF096F10FF288E50FF62D1E6FF4DC6ECFF29B1
      DDEF0099CC1000000000000000000000000000000000D3ACAC62D8B6B6DDD7B1
      B1FFDABABAFFDCBFBFFFD6B2B2FFCE9F9FFF9C6D6DFFA58787FFA0AE9BFF98BE
      9EFF996666400000000000000000000000000000000000000000D1A6A64DD6B2
      B2E5D7B2B2FFDDC3C3FFDDC3C3FFD6B1B1FFB98F8FFFA78A8AFFAFA0A0FF98BE
      9EFFA78B8BAF0000000000000000000000000000000034AFDDFFCEEEF9FF7ADF
      FFFF7ADFFFFF5DCFF2FF40BFE6FF28B1DCFF099ED0DF0099CC9F0099CC700099
      CC20000000000000000000000000000000000000000034AFDDFF56C0EAFFC1EA
      F5FF8CF2FFFF8CF2FFFF8CF2FFFF46AC80FF1A8C26FF1A8030FF7AE0EFFF78DF
      F5FF0099CC60000000000000000000000000D8B6B692D8B4B4FFE0C8C8FFDCC3
      C3FFD4AEAEFFCE9E9EFFD5AFAFFFD7B5B5FFAD8B8BFFA37878FF9C6C6CFFA77F
      7FFF99666640000000000000000000000000D6AFAF25D9B6B6EAD7B3B3FFE0CA
      CAFFE1CECEFFD5B0B0FFCFA1A1FFD1A6A6FFC19C9CFFA37878FF9C6D6DFFA093
      86FFAA8888BF0000000000000000000000000000000034AFDDFF93D4EAFF92EB
      FFFF83E8FFFF83E8FFFF83E8FFFF83E8FFFF83E8FFFF6BDAF5FF4DC6ECFF23AD
      DCCF000000000000000000000000000000000000000034AFDDFF83D4FCFF70C6
      E2FFACFFFFFF99FFFFFF99FFFFFF86ECDFFF1E942EFF3FC55FFF2D9360FFA9F2
      FFFF39B6DBDF000000000000000000000000D6AFAFFFDBBEBEFFD4ACACFFD7B5
      B5FFDEC6C6FFDFC9C9FFDCC1C1FFD9B9B9FFB58888FFC28F8FFFB78A8AFFA575
      75FF99666640000000000000000000000000D6AFAFFFE1CACAFFE0C8C8FFD1A6
      A6FFD3ACACFFDABDBDFFDDC3C3FFDABCBCFFC7A7A7FFB48383FFAE8282FFA477
      77FF9C6969BF0000000000000000000000000000000034AFDDFF4DBAE4FFBEF8
      FFFF8CF2FFFF8CF2FFFF8CF2FFFF8CF2FFFF8CF2FFFF8CF2FFFF83E9FFFF6BD9
      F2FF0099CC400000000000000000000000000000000034AFDDFF89DBFFFF42B8
      E2FFABDFEFFFE7FFFFFFD9FFFFFFC6FFFFFF168121FF5BF48EFF198B25FFAFE6
      DFFFA4E6F2FF0099CC500000000000000000D6AFAFFFE3D1D1FFEAE3E3FFE5D9
      D9FFE2D1D1FFDFC9C9FFDCC1C1FFD9B9B9FFB68585FFC28F8FFFCC9999FFBB89
      89FF99666640000000000000000000000000D6AFAFFFD5AEAEFFDFC9C9FFE6D9
      D9FFE4D6D6FFE1CECEFFDDC3C3FFDABCBCFFC9A3A3FFBF8C8CFFCC9999FFC693
      93FFA67676BF0000000000000000000000000000000034AFDDFF3DB7EAFFCCF2
      F9FF99FFFFFF99FFFFFF99FFFFFF99FFFFFF99FFFFFF99FFFFFF8CF2FFFFA4F2
      FFFF40B3E1BF0033FF1000000000000000000000000034AFDDFF95EAFFFF7BE4
      FCFF63D5F2FF43C2E6FF3BBADFFF9FD9ECFF3D8C40FF52EA85FF38BE58FF87BC
      8FFFF2FFFFFF3EB3D9BF0000000000000000D6AFAFFFEDEBEBFFEAE3E3FFE5D9
      D9FFE2D1D1FFDFC9C9FFDCC1C1FFD9B9B9FFB88181FFA67373FFA97676FFB580
      80FF99666640000000000000000000000000D6AFAFFFEEEEEEFFEBE6E6FFE8DE
      DEFFE4D6D6FFE1CECEFFDDC3C3FFDABCBCFFCB9E9EFFAC7979FFA97676FFBF8C
      8CFFA57070BF0000000000000000000000000000000034AFDDFF63CCFCFF8FD2
      E9FFD7FFFFFFC0FFFFFFB6FFFFFFADFFFFFFADFFFFFFADFFFFFF95E9FFFFA3DC
      FFFF6999FFFF0033FF800033FF200033FF100000000034AFDDFFA6F8FFFF93F9
      FFFF93F9FFFF93F9FFFF93F9FFFF34AFDDFF0A7936FF4BE37EFF46D873FF408F
      4DFF34AFDDFF34AFDDFF0000000000000000D6AFAFFFEDEBEBFFEAE3E3FFE5D9
      D9FFE2D1D1FFDFC9C9FFDCC1C1FFD8B5B5FFBA7C7CFFBC8989FFAF7C7CFF9B78
      9FFF3D47C250000000000000000000000000D6AFAFFFEEEEEEFFEBE6E6FFE8DE
      DEFFE4D6D6FFE1CECEFFDDC3C3FFDABCBCFFC69494FFB68383FFA67373FFB380
      80FFA66D6DBF0000000000000000000000000000000034AFDDFF7ADFFFFF5DCF
      F2FF68CDECFF70CCE9FF88D1E9FFE6F9FCFFD4FFFFFFD2FFFFFF8BBCFFFF0E40
      FFFF4881FFFF004FFBBF0033FFEF0033FF500000000034AFDDFFC7FEFFFF99FF
      FFFF99FFFFFFBEFFFFFFD1FFFFFFC6FFFFFF0B7B15FF41DA74FF4BE37EFF006A
      10CF00000000000000000000000000000000D6AFAFFFEDEBEBFFEAE3E3FFE5D9
      D9FFE2D1D1FFDFC9C9FFDCC1C1FFD4A7A7FFB97070FFAB7885FF736CC6FF6666
      CCFF0033FF800033FF700033FF1000000000D6AFAFFFEEEEEEFFEBE6E6FFE8DE
      DEFFE4D6D6FFE1CECEFFDDC3C3FFDABCBCFFC18484FF635AB3FF334DE6FFBC8F
      9CFFA76C6CBF000000000033FF9F0033FFAF0000000034AFDDFF89EFFFFF89EF
      FFFF89EFFFFF89EFFFFF89EFFFFF64CEE9FF8FD2E9FFBCDFF5FFA7C6FFFF3D8B
      FFFF30D1FFFF2DD0FFFF004FFFAF0033FF400000000034AFDDFF99D9ECFFCFF9
      FCFFBCF5EFFF34AFDDFF34AFDDFF34AFDDFF138C26FF38D16BFF41DA74FF0066
      00BF00000000000000000000000000000000D6AFAFFFEDEBEBFFEAE3E3FFE5D9
      D9FFE2D1D1FFDFC9C9FFE1C9C9FFE3C6C6FFD59494FFBC6A76FF2640E3FF0A66
      F5FF0066FFEF0036FFEF0033FF1000000000D6AFAFFFEEEEEEFFEBE6E6FFE8DE
      DEFFE4D6D6FFE1CECEFFDDC3C3FFDABCBCFFCC8282FFA2658BFF0C37F6FF2343
      E9FF906181CF0033FFAF0033FFEF0033FF600000000034AFDDFF99FFFFFF99FF
      FFFF99FFFFFFA3FEFFFF99FFFFFF99FFFFFF99FFFFFF60B9FCFF1D60FCFF006B
      F9FFC5F5FDFF94EBFDFF0057FFDF0033FFBF000000000000000034AFDDFF34AF
      DDFF34AFDDFF006600FF06780BFF087B10FF21AD42FF33CC66FF38D16BFF0066
      00DF087B10FF087B10FF0000000000000000D6AFAFFFEDEBEBFFECE4E4FFEBDE
      DEFFF0E4E4FFF5ECECFFF9F2F2FFF9F2F2FFE9E7F4FF4D69F5FF1A51ECFF6DE5
      FEFF6EE6FEFF004EFFDF0033FFAF0033FF10D6AFAFFFEEEEEEFFEBE6E6FFE8DE
      DEFFE8DADAFFEDE0E0FFF1E6E6FFFAF5F5FFFCF9F9FFF2DCDCFFBCA2C9FF0F3E
      FDFF0033FFFF0033FFEF0033FF30000000000000000034AFDDFFBFFFFFFF99FF
      FFFF9FFFFFFFC5EBF5FF82CEE7EF34AFDDFF34AFDDFF34AFDDFF34AFDDFF003E
      FCFF003EFCFF0577FFDF0036FFEF0033FF200000000000000000000000000000
      0000000000000066008F0A8C13FF1AB333FF24BD48FF2BC456FF33CC66FF1EA1
      3BFF046D07FF006600800000000000000000D6AFAFFFDCBABAFFDFC0C0FFDFC0
      C0FFDFC0C0FFDFC0C0FFDFC0C0FFD4B1B1FFD5B4B4CF807BC6AF254FDDCF34C5
      FEFF38C6FFFF0048FFAF0033FF4000000000D6AFAFFFE6D5D5FFE4CCCCFFE5CC
      CCFFE5CCCCFFE5CCCCFFE5CCCCFFE5CCCCFFE5CCCCFFDFC4C4FFCDB7C3FF2D53
      F9FF0033FFFF0033FFEF0033FF30000000000000000024A8D37034AFDDFF34AF
      DDFF34AFDDFF34AFDDFF00000000000000000000000000000000003EFCFF0033
      FF40003EFCFF0033FF800033FF600033FF300000000000000000000000000000
      00000000000000660010016B02DF0EA01BFF1AB333FF21B743FF138F26FF0066
      00CF006600300000000000000000000000000000000000000000C4919140C693
      9380C3909080C08D8D40B380802000000000000000000033FF300033FFEF003D
      FFAF003DFFAF0033FFEF0033FF3000000000CC999910CFA0A040D0A3A380CD9F
      9FAFCEA0A0BFCA9B9BBFCCA0A080CBA1A160AB7878400033FF300033FFDF0033
      FFCF0033FF300033FFCF0033FFEF0033FF300000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000033FF400033FF3000000000000000000000000000000000000000000000
      0000000000000000000000660040037607FF0C9818FF037007EF006600700000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000033FF200033
      FF700033FF800033FF2000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000033FF800033FFCF0033
      FF10000000000033FF100033FFAF0033FFAF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000066008F006600BF00660020000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000033
      FF100033FF100000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000099330020C66000FFC660
      00FFC66000FFC66000FFC66000FF000000000000000000000000000000000066
      009F000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000066
      009F000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000066009F0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000066009F0000000000000000000000000000000099330020C66000EFB24C
      00BF0000000000000000C66000FF0000000000000000000000000066009F0066
      00FF0066009F00000000000000000000000000000000A37774FFA37774FFA377
      74FFA37774FFA37774FFA37774FF0000000000000000000000000066009F0066
      00FF0066009F000000000000000000000000B99F9F9DBDA4A4DFB79B9B9EBFA5
      A541000000000000000000000000000000000000000000000000000000000066
      009F006600FF0066009F00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000066
      009F006600FF0066009F00000000000000000000000000000000A23C0070CE68
      00FFA23C0070000000009933002000000000000000000066007004710AFF14AE
      33FF016B04FF00660070000000000000000000000000A37774FFFFD9CCFFFFD6
      C7FFFFD3C0FFFFD0BBFFA37774FF00000000000000000066007004710AFF14AE
      33FF016B04FF006600700000000000000000B39797FFEDE6E6FFDBCBCBFFC5AD
      ADFFC0A6A6FCBEA19FDCB89794A8A87F7F470000000000000000006600700471
      0AFF14AE33FF016B04FF00660070000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000006600700471
      0AFF14AE33FF016B04FF0066007000000000000000000000000000000000BA54
      00CFC66000EF99330020000000000000000000660050006600FF1C9F41FF27BF
      5CFF129B2CFF006600FF006600500000000000000000AB7F77FFFFEDDCFFFFE5
      CCFFFFDEBCFFFFD9B3FFA37774FF0000000000660050006600FF1C9F41FF27BF
      5CFF129B2CFF006600FF0066005000000000B39797FFFCFBF7FFFFFFFFFFFFFF
      FFFFFAF8F8FFEAE0DEFFD7BDB5FFCAA093D30000000000660050006600FF1C9F
      41FF27BF5CFF129B2CFF006600FF006600500000000000000000A37774FFA377
      74FFA37774FFA37774FFA37774FFA37774FF0000000000660050006600FF1C9F
      41FF27BF5CFF129B2CFF006600FF006600500000000000000000000000009933
      0030C76100FFB24C00BF0000000000000000006600AF006600BF06720DFF2EC2
      6BFF036C07FF006600BF006600AF0000000000000000B7887BFFFFF2E5FFFFED
      DCFFFFE5CCFFFFDEBCFFA37774FF00000000006600AF006600BF06720DFF2EC2
      6BFF036C07FF006600BF006600AF00000000B39797FFE0C3B0FF9F4010FFE3C8
      B7FFCC9980FFE6CCBFFFF9F2EFFFE0CFCFEF00000000006600AF006600BF0672
      0DFF2EC26BFF036C07FF006600BF006600AF0000000000000000A37774FFFFD9
      CCFFFFD6C7FFFFD3C0FFFFD0BBFFA37774FF00000000006600AF006600BF0672
      0DFF2EC26BFF036C07FF006600BF006600AF0000000099330020993300200000
      0000A8420080CE6800FFA33D0060000000000000000000000000006600FF2EC2
      6BFF006600FF00000000000000000000000000000000C39581FFFFFAF5FFFFF2
      E5FFFFEDDCFFFFE5CCFFA37774FF000000000000000000000000006600FF2EC2
      6BFF006600FF000000000000000000000000B39797FFF6EEE1FF993300FFE6CC
      BFFFB97350FFB36640FFCC9980FFF9F6F6FFA3837CFF00000000000000000066
      00FF2EC26BFF006600FF00000000000000000000000000000000AB7F77FFFFED
      DCFFFFE5CCFFFFDEBCFFFFD9B3FFA37774FF0000000000000000000000000066
      00FF2EC26BFF006600FF00000000000000000000000099330040C66000FFC660
      00FFC66000FFC66000FFBE5800EF000000000000000000000000006600FF28B7
      5EFF006600EF00000000000000000000000000000000D1A286FFFFFFFFFFFFFA
      F5FFFFF2E5FFF2ACA5FFA37774FF000000000000000000000000006600FF28B7
      5EFF006600EF000000000000000000000000B39797FFDCBBA1FF993300FFE3C8
      B7FFF9F2EFFFA64D20FFF2E6DFFFB39696FF996D6D2000000000000000000066
      00FF28B75EFF006600EF0000000000000000A37774FFA37774FFB7887BFFFFF2
      E5FFFFEDDCFFFFE5CCFFFFDEBCFFA37774FF0000000000000000000000000066
      00FF28B75EFF006600EF00000000000000000000000099330010993300409933
      0040993300409933004099330040000000000000000000000000006600CF1794
      36FF308330FF00000000000000000000000000000000DFAE8BFFFFFFFFFFFFFF
      FFFFFFFAF5FFA37774FFA37774FF000000000000000000000000006600CF1794
      36FF308330FF000000000000000000000000B39797FFEBD8BEFFAA5529FFE3C8
      B7FFAC5930FFAC5930FFCC9980FFB39696FF0000000000000000000000000066
      00CF179436FF308330FF0000000000000000A37774FFFFD9CCFFC39581FFFFFA
      F5FFFFF2E5FFFFEDDCFFFFE5CCFFA37774FF0000000000000000000000000066
      00CF179436FF308330FF0000000000000000FF990020FFA620FFFFA620FF0000
      000000000000E58610FFE58610FFE58610FF9933002000000000308330FF148E
      2FFF308330FF00000000000000000000000000000000EBB990FFDCA987FFDCA9
      87FFDCA987FFA37774FFDAA7879F000000000000000000000000308330FF148E
      2FFF308330FF000000000000000000000000B39797FFEFE0C4FFF1E6D0FFF4EB
      DBFFE6CFBEFFCB977CFFF9F2EFFFB39696FF0000000000000000000000003083
      30FF148E2FFF308330FF0000000000000000AB7F77FFFFEDDCFFD1A286FFFFFF
      FFFFFFFAF5FFFFF2E5FFF2ACA5FFA37774FF0000000000000000000000003083
      30FF148E2FFF308330FF000000000000000000000000FF990080FFA620FF0000
      000000000000E5800060C66000FFB34D00600000000000000000006600AF0872
      0FFF006600800000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000006600AF0872
      0FFF006600800000000000000000000000003177FFFF0B48FFFF4A7BF1FF6B97
      F0FF8DB6F1FFB9D4F5FFCCE6FFFFB39696FF0000000000000000000000000066
      00AF08720FFF006600800000000000000000B7887BFFFFF2E5FFDFAE8BFFFFFF
      FFFFFFFFFFFFFFFAF5FFA37774FFA37774FF0000000000000000000000000066
      00AF08720FFF00660080000000000000000000000000FF990010FF9900DFE586
      10FFE58610FFE37E00EFC76100DF000000000000000000000000006600800066
      00FF006600800000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000006600800066
      00FF006600800000000000000000000000001A61FFFF1F67FFFF3A89FBFF358A
      FFFF2A7FFFFF2A82FFFF338DFFFF6688AABF0000000000000000000000000066
      0080006600FF006600800000000000000000C39581FFFFFAF5FFEBB990FFDCA9
      87FFDCA987FFDCA987FFA37774FFDAA7879F0000000000000000000000000066
      0080006600FF0066008000000000000000000000000000000000FF99009FFF99
      0060FF990040DF7A00FFCC660060000000000000000000000000006600800066
      00FF006600500000000000000000000000000000000000000000A67373FFA673
      73FFA67373FFA67373FF00000000000000000000000000000000006600800066
      00FF00660050000000000000000000000000256FFF25256FFF413974E9793D74
      E4A43577EFC92B73FAE62970FCF35370C3860000000000000000000000000066
      0080006600FF006600500000000000000000D1A286FFFFFFFFFFFFFAF5FFFFF2
      E5FFF2ACA5FFA37774FF00000000000000000000000000000000000000000066
      0080006600FF0066005000000000000000000000000000000000FF990020FF99
      00DFF69100BFDB7600EFFF990010000000000000000000000000006600500066
      00FF006600400000000000000000000000000000000000000000B7887BFFFFEA
      D5FFFFE1C3FFA67373FF00000000000000000000000000000000006600500066
      00FF006600400000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000066
      0050006600FF006600400000000000000000DFAE8BFFFFFFFFFFFFFFFFFFFFFA
      F5FFA37774FFA37774FF00000000000000000000000000000000000000000066
      0050006600FF006600400000000000000000000000000000000000000000FF99
      009FF79100FFE27D008000000000000000000000000000000000006600400066
      00FF006600200000000000000000000000000000000000000000C39581FFFFF3
      E7FFFFE7D1FFA67373FF00000000000000000000000000000000006600400066
      00FF006600200000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000066
      0040006600FF006600200000000000000000EBB990FFDCA987FFDCA987FFDCA9
      87FFA37774FFDAA7879F00000000000000000000000000000000000000000066
      0040006600FF006600200000000000000000000000000000000000000000FF99
      0040F38D00EFE580001000000000000000000000000000000000006600300066
      00FF000000000000000000000000000000000000000000000000DFAE8BFFFFFD
      FAFFA67373FFA67373FF00000000000000000000000000000000006600300066
      00FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000066
      0030006600FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000066
      0030006600FF0000000000000000000000000000000000000000000000000000
      0000F69100300000000000000000000000000000000000000000000000000066
      0040000000000000000000000000000000000000000000000000EBB990FFDCA9
      87FFDCA987FFE1B7936000000000000000000000000000000000000000000066
      0040000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000006600400000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000006600400000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CC6600FFCC6600FFCC66
      00FFCC6600FFCC6600FFCC6600FFCC6600FFCC6600FFCC6600FFCC6600FFCC66
      00FFCC6600FFCC6600FFCC6600FFCC6600FF00000000CC6600FFCC6600FFCC66
      00FFCC6600FFCC6600FFCC6600FFCC6600FFCC6600FFCC6600FFCC6600FFCC66
      00FFCC6600FFCC6600FFCC6600FFCC6600FF00000000CC6600FFCC6600FFCC66
      00FFCC6600FFCC6600FFCC6600FFCC6600FFCC6600FFCC6600FFCC6600FFCC66
      00FFCC6600FFCC6600FFCC6600FFCC6600FF00000000CC6600FFCC6600FFCC66
      00FFCC6600FFCC6600FFCC6600FFCC6600FFCC6600FFCC6600FFCC6600FFCC66
      00FFCC6600FFCC6600FFCC6600FFCC6600FF00000000CC6600FFFFFFFFFFFFFC
      F8FFFFF8F0FFFFF3E7FFFFF1E3FFFFECD9FFFFE9D3FFFFE5CAFFFFE2C5FFFFDD
      BBFFFFDBB5FFFFD5ABFFFFD3A7FFCC6600FF00000000CC6600FFFFFFFFFFFFFC
      F8FFFFF8F0FFFFF3E7FFFFF1E3FFFFECD9FFFFE9D3FFFFE5CAFFFFE2C5FFFFDD
      BBFFFFDBB5FFFFD5ABFFFFD3A7FFCC6600FF00000000CC6600FFFFFFFEFFFFF9
      F3FFFFF8EFFFFFF2E5FFFFF0E1FFFFEAD6FFFFE9D2FFFFE3C8FFFFE2C4FFFFDC
      B9FFFFDBB5FFFFD5ABFFFFD3A7FFCC6600FF00000000CC6600FFFFFFFFFFFFFB
      F6FFFFF8F0FFFFF3E7FFFFF0E2FFFFECD9FFFFE9D3FFFFE5CAFFFFE2C5FFFFDE
      BCFFFFDBB6FFFFD6ADFFFFD3A7FFCC6600FF00000000CC6600FFFFFFFFFFFFFE
      FCFFFFF8F1FFFFF7EDFFFFF1E3FFFFEFDFFFFFE9D4FFFFE8D0FFB3ADA8FFB3AD
      A8FFB3ADA8FFFFDAB3FFFFD4A9FFCC6600FF00000000CC6600FFFFFFFFFFFFFF
      FFFFB3B1AFFFB3B1AFFFFFF3E7FFECE0D4FFB3ADA8FFB3ADA8FFFFE5CAFFFFE2
      C5FFB3AAA0FFB3AAA0FFFFD4A9FFCC6600FF00000000CC6600FFFFFFFFFFFFFF
      FEFFFFF9F3FFFFF8EFFFFFF2E5FFFFF0E1FFFFEAD6FFFFE9D2FFFFE3C8FFFFE2
      C4FFFFDCB9FFFFDBB5FFFFD5ABFFCC6600FF00000000CC6600FFFFFFFFFFB3AD
      A8FFB3ADA8FFFFF3E7FFB3ADA8FFB3ADA8FFFFE9D3FFB3ADA8FFB3ADA8FFFFDE
      BCFFB3ADA8FFB3ADA8FFFFD4A9FFCC6600FF00000000CC6600FFFFFFFFFFFFFF
      FFFFFFFEFCFFFFF8F1FFFFF7EDFFFFF1E3FFFFEFDFFFFFE9D4FFFFE9D4FFFFDD
      BBFFFFE1C2FFFFE1C2FFFFDAB3FFCC6600FF00000000CC6600FFFFFFFFFFFFFF
      FFFF4B79FFFF4B79FFFFFFF8F0FFF9EEE3FF993300FF993300FFFFE9D3FFFFE5
      CAFF0099CCFF0099CCFFFFDAB3FFCC6600FF00000000CC6600FFBF6010FFCC8C
      60FFFFFFFEFFECD4C6FFAE4800FFAB501CFFD9A98DFFBA5F1CFFB7560DFFB966
      33FFA64818FFBF7244FFFFDBB5FFCC6600FF00000000CC6600FFFFFFFFFFFFFB
      F6FFFFF8F0FFFFF3E7FFFFF0E2FFFFECD9FFFFE9D3FFFFE5CAFFFFE2C5FFFFDE
      BCFFFFDBB6FFFFD6ADFFFFD3A7FFCC6600FF00000000CC6600FFFFFFFFFFFFFF
      FFFFB3ACA5FFB3ACA5FFB3ACA5FFFFF7EDFFFFF1E3FFFFEFDFFF993300FF9933
      00FF993300FFFFE1C2FFFFDBB7FFCC6600FF00000000CC6600FFFFFFFFFFFFFF
      FFFF4B79FFFF4B79FFFFFFFBF6FFFFF8F0FF993300FF993300FFFFECD9FFFFE9
      D3FF0099CCFF0099CCFFFFDBB7FFCC6600FF00000000CC6600FFDFB99FFFC680
      50FFCC9980FFC28360FFB75100FFF2DFD1FFFFF2E6FFDAA071FFCC7A35FFFFE9
      D2FFDFAE8CFF993300FFE6B28BFFCC6600FF00000000CC6600FFFFFFFFFFB3AD
      A8FFB3ADA8FFFFF3E7FFB3ADA8FFB3ADA8FFFFE9D3FFB3ADA8FFB3ADA8FFFFDE
      BCFFB3ADA8FFB3ADA8FFFFDBB7FFCC6600FF00000000CC6600FFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F1FFFFF7EDFFFFF1E3FF993300FF9933
      00FF993300FFFFE2C6FFFFE1C2FFCC6600FF00000000CC6600FFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBF6FFFFFBF6FFFFF0E2FFFFF0E2FFFFEC
      D9FFFFECD9FFFFE2C5FFFFE1C2FFCC6600FF00000000CC6600FFFFFFFFFFB966
      30FFF9F2EFFFC66D20FFCC8C60FFFFFBF6FFFFF8F0FFDFA775FFCA6F1CFFD79A
      6AFFB15A28FFB36033FFF9D7B9FFCC6600FF00000000CC6600FFFFFFFFFFFFFB
      F6FFFFF8F0FFFFF3E7FFFFF0E2FFFFECD9FFFFE9D3FFFFE5CAFFFFE2C5FFFFDE
      BCFFFFDBB6FFFFD6ADFFFFD3A7FFCC6600FF00000000CC6600FFFFFFFFFFFFFF
      FFFF4B79FFFF4B79FFFF4B79FFFFFFFEFCFFFFF8F1FFFFF7EDFF993300FF9933
      00FF993300FFFFE8D0FFFFE3C8FFCC6600FF00000000CC6600FFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBF6FFFFF0E2FFFFF5EAFFFFF0
      E2FFFFECD9FFFFE2C5FFFFE3C8FFCC6600FF00000000CC6600FFFFFFFFFFDFB9
      9FFFB76430FFCA6500FFF2E6DFFFFFFFFFFFFFFBF6FFDFA978FFD27D2AFFE6C1
      AAFFB45F2AFFBB6935FFFFE5CAFFCC6600FF00000000CC6600FFFFFFFFFFFEC9
      94FFFCC388FFF8B978FFF5AF64FFF0A44FFFEB9839FFE88D26FFE48416FFE27E
      0AFFE27E0AFFE27E0AFFFFE3C8FFCC6600FF00000000CC6600FFFFFFFFFFFFFF
      FFFF4B79FFFF4B79FFFF4B79FFFFFFFFFFFFFFFEFDFFFFF9F3FFFFF9F3FFFFF8
      EFFFFFF2E5FFFFEAD6FFFFE9D2FFCC6600FF00000000CC6600FFFFFFFFFFFFFF
      FFFFB3ADA8FFB3ADA8FFFFFFFFFFFFFFFFFFB3ADA8FFB3ADA8FFFFF8F0FFFFF5
      EBFFB3ADA8FFB3ADA8FFFFE9D2FFCC6600FF00000000CC6600FFFFFFFFFFFFFF
      FFFFD27920FFD29360FFFFFFFFFFFFFFFFFFF9F2EFFFD2915DFFD27E2DFFE6C2
      ACFFC37847FFAE521AFFFFE9D3FFCC6600FF00000000CC6600FFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB
      F6FFFFF8F0FFFFF3E7FFFFE9D2FFCC6600FF00000000CC6600FFFFFFFFFFFFFF
      FFFF4B79FFFF4B79FFFF4B79FFFFFFFFFFFFFFFFFFFFFFFFFEFFFFF9F3FFFFF8
      EFFFFFF2E5FFFFF0E1FFFFEAD6FFCC6600FF00000000CC6600FFFFFFFFFFFFFF
      FFFFCC9999FFCC9999FFFFFFFFFFFFFFFFFFE27E0AFFE27E0AFFFFFCF9FFFFF8
      F0FF009900FF009900FFFFEAD6FFCC6600FF00000000CC6600FFFFFFFFFFFFFF
      FFFFD27920FFF2E6DFFFFFFFFFFFFFFFFFFFF2E6DFFFE6B380FFD27E2DFFD27E
      2DFFD27E2DFFF9E4D4FFFFECD9FFCC6600FF00000000CC6600FFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFB3ADA8FFB3ADA8FFFFFFFFFFB3ADA8FFB3ADA8FFFFFF
      FFFFB3ADA8FFB3ADA8FFFFEAD6FFCC6600FF00000000CC6600FFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFFF9
      F3FFFFF8EFFFFFF2E5FFFFF0E1FFCC6600FF00000000CC6600FFFFFFFFFFFFFF
      FFFFCC9999FFCC9999FFFFFFFFFFFFFFFFFFE27E0AFFE27E0AFFFFFFFFFFFFFC
      F9FF009900FF009900FFFFF0E1FFCC6600FF00000000CC6600FFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB
      F6FFFFF8F0FFFFF3E7FFFFF0E2FFCC6600FF00000000CC6600FFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB
      F6FFFFF8F0FFFFF3E7FFFFF0E1FFCC6600FF00000000CC6600FFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FEFFFFF9F3FFFFF8EFFFFFF2E5FFCC6600FF00000000CC6600FFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FEFFFFF9F3FFFFF8EFFFFFF2E5FFCC6600FF00000000CC6600FFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FEFFFFF9F3FFFFF8EFFFFFF2E5FFCC6600FF00000000CC6600FFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FEFFFFF9F3FFFFF8EFFFFFF2E5FFCC6600FF00000000CC6600FFDF7A00FFDF7A
      00FFDF7A00FFDF7A00FFDF7A00FFDF7A00FFDF7A00FFDF7A00FFDF7A00FFDF7A
      00FFDF7A00FFDF7A00FFDF7A00FFCC6600FF00000000CC6600FFDF7A00FFDF7A
      00FFDF7A00FFDF7A00FFDF7A00FFDF7A00FFDF7A00FFDF7A00FFDF7A00FFDF7A
      00FFDF7A00FFDF7A00FFDF7A00FFCC6600FF00000000CC6600FFDF7A00FFDF7A
      00FFDF7A00FFDF7A00FFDF7A00FFDF7A00FFDF7A00FFDF7A00FFDF7A00FFDF7A
      00FFDF7A00FFDF7A00FFDF7A00FFCC6600FF00000000CC6600FFDF7A00FFDF7A
      00FFDF7A00FFDF7A00FFDF7A00FFDF7A00FFDF7A00FFDF7A00FFDF7A00FFDF7A
      00FFDF7A00FFDF7A00FFDF7A00FFCC6600FF00000000CE6800FFCF6900FFCF69
      00FFCF6900FFCF6900FFCF6900FFCF6900FFCF6900FFCF6900FFCF6900FFCF69
      00FFCF6900FFCF6900FFCF6900FFCE6800EF00000000CE6800FFCF6900FFCF69
      00FFCF6900FFCF6900FFCF6900FFCF6900FFCF6900FFCF6900FFCF6900FFCF69
      00FFCF6900FFCF6900FFCF6900FFCE6800EF00000000CE6800FFCF6900FFCF69
      00FFCF6900FFCF6900FFCF6900FFCF6900FFCF6900FFCF6900FFCF6900FFCF69
      00FFCF6900FFCF6900FFCF6900FFCE6800EF00000000CE6800FFCF6900FFCF69
      00FFCF6900FFCF6900FFCF6900FFCF6900FFCF6900FFCF6900FFCF6900FFCF69
      00FFCF6900FFCF6900FFCF6900FFCE6800EF00000000CC660030D27313FFD273
      13FFD27313FFD27313FFD27313FFD27313FFD27313FFD27313FFD27313FFD273
      13FFD27313FFD27313FFD27313FFCC66004000000000CC660030D27313FFD273
      13FFD27313FFD27313FFD27313FFD27313FFD27313FFD27313FFD27313FFD273
      13FFD27313FFD27313FFD27313FFCC66004000000000CC660030D27313FFD273
      13FFD27313FFD27313FFD27313FFD27313FFD27313FFD27313FFD27313FFD273
      13FFD27313FFD27313FFD27313FFCC66004000000000CC660030D27313FFD273
      13FFD27313FFD27313FFD27313FFD27313FFD27313FFD27313FFD27313FFD273
      13FFD27313FFD27313FFD27313FFCC6600400000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000996666309966666000000000000000000000000000000000993300209933
      0080993300600000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007D8091AFA7899AEFCC9999300000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000093939320838383400000000083838340B5B5B5FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000996666AFC6A996FFA77A75EF996666500000000000000000993300EFC660
      00FF9F3900FF99330060000000000000000084848480787485DFBB929CCFCC99
      9910000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000004BABF8BF6A75ADFFB9919CEFCC99
      9920000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000003333
      3310A3A3A3FFA3A3A3FFC3C3C3FF9E9E9EEF917272CFC5ACACFFB5B5B5FFB5B5
      B5FFB5B5B5FF0000000000000000000000009966661099666610000000009966
      6610AC837CFFFFFFDDFFBF9F93FF996666500000000099330030993300FFFF99
      00FFCC6600FF9933008000000000000000005F92B8BF4979C7FF837CA4FFBB92
      9CCFCC9999100000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000004DB3FF304EA5EFEF6C76ADFFB690
      9CCFCC9999100000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000A3A3A3FFA3A3
      A3FFF4F4F4FFEDEDEDFFBBBBBBFFB3B3B3FF544D4DFF666666FF888888FFC7C7
      C7FFD0D0D0FFB5B5B5FFB5B5B5FF00000000AE7B70FF996666AF000000009966
      6670D2BCADFFFFFFE6FFA0716FDF000000000000000000000000993300CFAC46
      00FF9F3900FF99330040000000000000000050B6FF8F4FB4FEFF4B7AC7FF837C
      A4FFBB929CCFCC99991000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000004DB3FF304EA5EFEF6977
      B0FFB99488B0C79881D7C99A82FCCC9E87E0C595817400000000000000000000
      00000000000000000000000000000000000000000000A3A3A3FFFEFEFEFFF4F4
      F4FFEDEDEDFFE3E3E3FFB4B4B4FFABABABFF9B9B9BFF7D7D7DFF727272FF8888
      88FFABABABFFC2C2C2FF8E8E8EFF00000000AE7B70FFAC8379FF996666709966
      66CFF9F5E1FFD9C6BEFF9966668F000000000000000000000000993300409933
      004099330040000000000000000000000000000000004EB4FF9F52B7FEFF4B7A
      C7FF837CA4FFBB929CCFCC999910000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000004DB3FF30A6A4
      AAD7CEA38BFFF0DAB1FFFDFBDAFFF0E3C8FFD2AD9AF9C3927F74000000000000
      00000000000000000000000000000000000000000000A3A3A3FFF4F4F4FFE5E5
      E5FFB5B5B5FF999999FF888888FF868686FF8F8F8FFFA9A9A9FFBBBBBBFFAFAF
      AFFF828282FF8E8E8EFF0000000000000000AE7B70FFE6D9B3FFC6A996FFCCB3
      A4FFFFFFEEFFB99692FF99666620996666309966668000000000993300BFBD57
      00FF993300FF99330040000000000000000000000000000000004EB4FF9F53B7
      FEFF4A7DCBFF837CA4FFB996A08F000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000CC9C
      85E0F0D6ACFFFFF3C4FFFFFFE4FFFFFFFAFFF0E2CFFFC89B85E4000000000000
      00000000000000000000000000000000000000000000A3A3A3FFABABABFFA3A3
      A3FFCBCBCBFFD1D1D1FFD7D7D7FFB1B1B1FFAAAAAAFF8F8F8FFF8D8D8DFF8D8D
      8DFF9EB1A4FF8E8E8EFF0000000000000000AE7B70FFE6D8B2FFFFFFD6FFFFFF
      DEFFFFFFEAFFBF9F9BFFB38C89FF9F706FFF996666AF00000000993300BFDF79
      00FFAB4500FF9933004000000000000000000000000000000000000000004BB1
      FF9F53B7FEFF568BD0FF8C8F95BFC09386AEC99982F4CA9981FFCB9B83FFCFA2
      8CF4C18E81AEC9967E010000000000000000000000000000000000000000CA9A
      82FCFDE6B5FFFFEFBEFFFFFFDEFFFFFFECFFFDFBD9FFCA9A82FC000000000000
      00000000000000000000000000000000000000000000A3A3A3FFDCDCDCFFDADA
      DAFFD1D1D1FFD9D9D9FFB1B1B1FFB5B5B5FFB5B5B5FFD8D8D8FFD0D0D0FFC5C5
      C5FFA4A4A4FF8E8E8EFF0000000000000000AE7B70FFE6D3ADFFFFFFD1FFFFFF
      D9FFFFFFE1FFFFFFE7FFECE2D0FF996666CF9966661000000000993300BFD771
      00FFB65000FF9933008000000000000000000000000000000000000000000000
      00004EB4FF80B1BAC0AFB98F81FFD7AB8EFFEDD6AFFFFAF4CCFFFAF5D4FFEDDC
      BDFFD9B6A1FFC69887D7C9967E0100000000000000000000000000000000CFA1
      89E9F0DEBEFFFFEDC1FFFFFAC9FFFFFDD1FFF0E0B6FFCCA086ED000000000000
      00000000000000000000000000000000000000000000A3A3A3FFDBDBDBFFD1D1
      D1FFD4D4D4FFB1B1B1FFE3E3E3FFEFEFEFFFE3E3E3FFB5B5B5FFB5B5B5FFB5B5
      B5FFC4C4C4FF8E8E8EFF0000000000000000AE7B70FFE6C9A3FFFFFDCAFFFFFF
      D3FFFFFFD9FFF9F5D4FFA0706EEF99666630000000000000000099330080A842
      00FFE07A00FF9F3900FF99330060000000000000000000000000000000000000
      000000000000C8988BA4D8A98CFFFFF5C4FFFFF6C3FFFFFFD9FFFFFFE9FFFFFF
      F8FFFFFFFFFFD9B6A0FFB68376AE00000000000000000000000000000000CC9D
      8A92DAB9A6FFF0DED0FFFDE4B3FFF0D2A7FFDBB594FFC08F7D9C006600200066
      00300000000000000000000000000000000000000000D9D9D930B1B1B1FFB1B1
      B1FFB1B1B1FFCCCCCCFFDFDFDFFFECECECFFEFEFEFFFEDEDEDFFE8E8E8FFE6E6
      E6FFB5B5B5FFC2C2C28F0000000000000000AE7B70FFE6C49EFFFFEBB8FFFFFD
      CAFFFFFFCEFFAC837CFF99666650000000000000000000000000000000009933
      00CFB85200FFE27C00FF9F3900FF993300500000000000000000000000000000
      000000000000D09F89EFEDD3AAFFFFE5B3FFFFF9C6FFFFFFDCFFFFFFECFFFFFF
      FBFFFFFFF6FFEDDCBDFFC89B85F4000000000000000000000000000000000000
      0000CA9E8DB0D0A890FFCA9C83FFD3A98FFF116B0BFC0066004007770EFF0066
      00FF006600AF000000000000000000000000000000000000000000000000DDDD
      DDBFDCA987FFC1C1C1FFC1C1C1FFC1C1C1FFC1C1C1FFC1C1C1FFCFCFCFFFB6B6
      B6FFB0B0B08F000000000000000000000000AE7B70FFE6BD97FFFFE1AFFFFFE7
      B5FFBF9C89FF9966668000000000000000000000000000000000000000009933
      0010993300CFBE5800FFD16B00FF993300DF0000000000000000000000000000
      000000000000CC9A82FFFAEFC4FFFFDBA8FFFFF2BFFFFFFFD6FFFFFFE4FFFFFF
      EBFFFFFFE5FFFAF5D1FFC99981FF000000000000000000000000000000000000
      000000000000BC898940BC898940BC8989400F7F19FF1E9B35FF006600400000
      000000000000000000000000000000000000000000000000000000000000B399
      9960DCA987FFFFD6ADFFFFE3C6FFFFE7D0FFF5E2CFFFDCA987FF9E9E9E700000
      000000000000000000000000000000000000AE7B70FFE6B58FFFFFD7A4FFD9B0
      90FF996666AF0000000000000000000000000000000000000000993300200000
      000099330030993300FFEC8600FF993300FF0000000000000000000000000000
      000000000000CC9A82FFFAEFC4FFFFE7BCFFFFF3C1FFFFFFCDFFFFFFD4FFFFFF
      D6FFFFFFD5FFFAF3C9FFC99880FF000000000000000000000000000000000000
      0000000000000000000000000000000000000B7812FF0F7F19FF006600EF0000
      000000000000000000000000000000000000000000000000000000000000DCA9
      87FFFFDFC0FFFFDFC0FFFFDFC0FFFFDFC0FFFFDFC0FFDCA987FF000000000000
      000000000000000000000000000000000000AE7B70FFE6BA94FFECBB91FF9966
      66CF996666100000000000000000000000000000000099330060993300FF9933
      007099330050993300FFE88200FF993300FF0000000000000000000000000000
      000000000000CD9D87E5EDD8B6FFFFF2DBFFFFE1B9FFFFEFBDFFFFF1BFFFFFF5
      C3FFFFF4C1FFEDD5ACFFC6967FEF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000066
      00EF0F7F19FF0B7812FF0000000000000000000000000000000000000000DCA9
      87FFFFE8D2FFFFE8D2FFFFE8D2FFFFE8D2FFFFE8D2FFDCA987FF000000000000
      000000000000000000000000000000000000AE7B70FFDFBD9AFFA06E6AEF9966
      66300000000000000000000000000000000099330050993300FFB34D00FFA33D
      00FFA13B00FFC35D00FFC15B00FF993300BF0000000000000000000000000000
      000000000000C794858FD7B097FFFFFFFFFFFFF9EEFFFFF1C8FFFFDAA7FFFFE6
      B4FFFFF5C6FFD6A88AFFB9867899000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000066
      00401E9B35FF0F7F19FF0000000000000000000000000000000099666610DCA9
      87FFFFF2E5FFFFF2E5FFFFF2E5FFFFF2E5FFFFF2E5FFDCA987FF000000000000
      000000000000000000000000000000000000AE7B70FF9F6F6CFF996666500000
      00000000000000000000000000000000000099330030993300EFA94300FFC25C
      00FFC96300FFB85200FF993300EF993300300000000000000000000000000000
      000000000000C9967E01C79684C7D6AF9BFFEDD8BFFFFAF1CCFFFAEDC2FFEDD5
      AEFFD6A68AFFC18E7DCFC9967E01000000000000000000000000000000000000
      00000000000000000000000000000000000000000000006600AF006600FF0777
      0EFF00660040006600DF00000000000000000000000000000000DCA987FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDCA987FF00000000000000000000
      000000000000000000000000000000000000AE7B70FF99666660000000000000
      00000000000000000000000000000000000000000000993300109933009F9933
      00DF993300EF993300AF99330030000000000000000000000000000000000000
      00000000000000000000C9967E01C08D7D85C69580E5C99880FDCB9A81FDCC9A
      85E5C390808FC9967E0100000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000006600300066
      0020000000000000000000000000000000000000000099666610DCA987FFDCA9
      87FFDCA987FFDCA987FFDCA987FFDCA987FFBB99993000000000000000000000
      00000000000000000000000000000000000000000000109FCFFF109FCFFF0099
      CCEF0099CCAF0099CC700099CC30000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000004EBBE4FFA7DDEFFF65D1
      F9FF48C1ECFF2BB1DFFF0EA1D2FF0099CCEF0099CCAF0099CC700099CC300000
      00000000000000000000000000000000000000000000000000307A3D3DEF994D
      4DFF994646FFB3B3B3FFB3B3B3FFB3B3B3FFB3B3B3FFB3B3B3FFB3B3B3FF9933
      33FF993333FF994D4DFF994D4DFF00000000000000000000000000000000A377
      74FFA37774FFA37774FFA37774FFA37774FFA37774FFA37774FFA37774FFA377
      74FFA37774FFA37774FF885856FF00000000000000000000000000000000A377
      74FFA37774FFA37774FFA37774FFA37774FFA37774FFA37774FFA37774FFA377
      74FFA37774FFA37774FF885856FF00000000000000004EBBE4FF67C3E2FFA8ED
      FFFF80E5FFFF80E5FFFF80E5FFFF70DCF9FF50C9ECFF30B6DFFF1BA7D9FF0B9F
      D28F0000000000000000000000000000000000000000B98675FFCC6666FFCC66
      66FF994D4DFFAF9C9CFFC27575FFDAB4B4FFFBFBFBFFF0F0F0FFE4E4E4FF9933
      33FF993333FFCC6666FF994D4DFF00000000000000007A7A7A3073718C9FA377
      74FFF5D7CEFFFFDACEFFFFD8C9FFFFD6C7FFFFD5C4FFFFD3C1FFFFD2BEFFFFD0
      BAFFFFD1AEFFFFCEAAFF8A5A59FF000000000000000000000000000000009E6B
      66FFFFE1D1FFFFE0CEFFFFDDC8FFFFDCC5FFFFD9BFFFFFD7BBFFFFD4B7FFFFD2
      B3FFFFD1AEFFFFCEAAFF8A5A59FF00000000000000004EBBE4FF4EBBE4FFCDF9
      FFFF8CF2FFFF8CF2FFFF8CF2FFFF8CF2FFFF8CF2FFFF8CF2FFFF70D6FFFF30B4
      E0EF0099CC1000000000000000000000000000000000B98675FFCC6666FFCC66
      66FF994D4DFFCFB6B6FFB75151FFBF8C8CFFD9D9D9FFFBFBFBFFF0F0F0FF9933
      33FF993333FFCC6666FF994D4DFF000000000000000066A5CD804882D2FF8B7F
      A3FFE3C7BFFFFFE8D2FFFFE6CEFFFFE3C6FFFFDFBFFFFFDDBBFFFFD9B4FFFFD7
      AFFFFFD4A9FFFFD2A4FF8E5E5CFF00000000000000000000000000000000A371
      69FFFFECD9FFFFE8D2FFFFE6CEFFFFE3C6FFFFE1C2FFFFDDBBFFFFD9B4FFFFD7
      B0FFFFD4A9FFFFD2A4FF8E5E5CFF00000000000000004EBBE4FF4ABCEAFFC2EB
      F5FF96FCFFFF96FCFFFF96FCFFFF96FCFFFF96FCFFFF96FCFFFF72D8FFFF89E6
      F9FF0099CC6000000000000000000000000000000000B98675FFCC6666FFCC66
      66FF994D4DFFE1C7C7FFA84242FFA97676FFB3B3B3FFD9D9D9FFFBFBFBFF9933
      33FF993333FFCC6666FF994D4DFF000000000000000040A6FF1058BCFDCF4980
      CFFF8B7FA3FFE6C9C0FFFFE8D2FFFFE6CEFFFFE3C6FFFFDFBFFFFFDDBBFFFFD9
      B4FFFFD7B0FFFFD4A9FF916260FF00000000000000000000000000000000AB77
      6EFFFFEEDEFFFFECD9FFFFE8D2FFEFDBD0FF8F96DFFFEFD6C5FFFFDDBBFFFFD9
      B4FFFFD7B0FFFFD4A9FF916260FF00000000000000004EBBE4FF71CFFCFF80CC
      E6FFC4FFFFFFA6FFFFFFA6FFFFFFA6FFFFFFA6FFFFFFA6FFFFFF76D9FFFFB3F2
      FFFF3AB6DBDF00000000000000000000000000000000B98675FFCC6666FFCC66
      66FF994D4DFFDCC8C8FFCA9797FFCAB1B1FFA9A9A9FFB3B3B3FFD6CFCFFF9933
      33FF9C3636FFCC6666FF994D4DFF00000000000000000000000066CCFF106BB3
      E4FF4C7BC7FF9181A2FFFAE6D5FFF2D8C5FFEECEBBFFF8D9C0FFFFDFBFFFFFDD
      BAFFFFD9B4FFFFD7B0FF956664FF00000000000000000000000000000000B17E
      71FFFFF3E6FFFFEEDEFFAFB2E4FF204AF9FF0033FFFF808BE3FFFFE1C2FFFFDD
      BBFFFFD9B4FFFFD7B0FF956664FF00000000000000004EBBE4FF88DFFFFF4DC2
      E9FF70C6E2FF8FD2E9FFB6E6F2FFE2FFFFFFC6FFFFFFC6FFFFFF7ED9FFFFA4DF
      DFFF8CD6DFFF0099CC40000000000000000000000000B98675FFCC6666FFCC66
      66FFCC6666FFCC6666FFCC6666FFCC6666FFCC6666FFCC6666FFCC6666FFCC66
      66FFCC6666FFCC6666FF994D4DFF00000000000000000000000000000000C18E
      79FF77C1F4FF808DA7FFD4AA94FFD7AB8DFFD3A284FFD9AF93FFDCB49EFFFFDF
      BFFFFFDDBBFFFFD9B4FF996B68FF00000000000000000000000000000000B986
      75FFFFF4E9FF607BF6FF0033FFFF103FFDFF204AF9FF0033FFFFDFCDCDFFFFE1
      C2FFFFDDBBFFFFD9B4FF996B68FF00000000000000004EBBE4FF99EDFFFF86EC
      FFFF86ECFFFF76E2F9FF56D2E9FF39BCD2FFDAF2F9FFF4FFFFFFA9DFEFFF0D76
      1AFF2D8330FF179EBEAF000000000000000000000000B98675FFCC6666FFCC66
      66FFBF8C8CFFBF8C8CFFBF8C8CFFBF8C8CFFBF8C8CFFBF8C8CFFBF8C8CFFBF8C
      8CFFCC6666FFCC6666FF994D4DFF00000000000000000000000000000000C18E
      79FFFFF8F2FFDCB4A0FFE2BC98FFF2E0B5FFFDFBDEFFF2E3D5FFE0BFAAFFD7AF
      98FFFFE0C0FFFFDDBBFF9C706CFF00000000000000000000000000000000C18E
      79FFFFF8F2FFBFC4EFFF607BF6FFEFE2DFFFCFCAE1FF0033FFFF405FF1FFFFE3
      C6FFFFE0C0FFFFDDBBFF9C706CFF00000000000000004EBBE4FF96FCFFFF96FC
      FFFF96FCFFFF96FCFFFF96FCFFFF84F1F9FF56D2E9FF39BCD2FF207C2DFF3DC6
      60FF3DC35DFF006E1FCF000000000000000000000000B98675FFCC6666FFBF8C
      8CFFFAFAFAFFFAFAFAFFFAFAFAFFFAFAFAFFFAFAFAFFFAFAFAFFFAFAFAFFFAFA
      FAFFBF8C8CFFCC6666FF994D4DFF00000000000000000000000000000000C996
      7EFFFFF9F5FFD9AD90FFF2D3A7FFFFF9C9FFFFFFE4FFFFFFF6FFF2E3C7FFD5AA
      8EFFFFE3C6FFFFDFBFFFA07471FF00000000000000000000000000000000C996
      7EFFFFF9F5FFFFF8F2FFFFF4E9FFFFF2E4FFFFEEDDFF7085F0FF0033FFFFAFAE
      DCFFFFE3C6FFFFDFBFFFA07471FF00000000000000004EBBE4FFBDFEFFFF99FF
      FFFF99FFFFFFCAF7FCFFA0E4F2FFC6F8FCFFCCFFFFFF399F60FF29AB46FF50E8
      83FF5AF38DFF249D37FF0066008F0000000000000000B98675FFCC6666FFBF8C
      8CFFFAFAFAFFC1C1C1FFC3C3C3FFC3C3C3FFC5C5C5FFC5C5C5FFC7C7C7FFFAFA
      FAFFBF8C8CFFCC6666FF994D4DFF00000000000000000000000000000000D19E
      81FFFFFEFDFFD2A183FFFDE5B6FFFFFAC7FFFFFFD8FFFFFFDFFFFDFAD3FFD19F
      82FFEFDBD0FFFFE3C6FFA47974FF00000000000000000000000000000000D19E
      81FFFFFEFDFFFFF9F5FFFFF8F2FFFFF4E9FFFFF2E4FFEFE2DFFF103FFDFF204A
      F9FFEFDBD0FFFFE3C6FFA47974FF00000000000000004EBBE4FF9FD9ECFFACE6
      F2FFDCF9FCFF66C2E0EF4EBBE4FF4EBBE4FF006600FF006600FF10831DFF45DA
      75FF42D06BFF178A24FF006600FF006600FF00000000B98675FFCC6666FFBF8C
      8CFFFAFAFAFFFAFAFAFFFAFAFAFFFAFAFAFFFAFAFAFFFAFAFAFFFAFAFAFFFAFA
      FAFFBF8C8CFFCC6666FF994D4DFF00000000000000000000000000000000D8A6
      86FFFFFFFFFFD9AD90FFF2DDC8FFFFE3BCFFFFF7C4FFFFF2C0FFF2DFB2FFD5A6
      8AFFDFD1D8FFFFE6CEFFA67C77FF00000000000000000000000000000000D8A6
      86FFFFFFFFFFFFFEFDFFFFF9F5FFFFF8F2FFFFF4E9FFFFF2E4FF9FA8EAFF4061
      F6FFDFD1D8FFFFE6CEFFA67C77FF00000000000000000099CC104EBBE4FF4EBB
      E4FF4EBBE4FF0099CC30000000000000000000000000000000000066008031BD
      57FF33BB56FF00660080000000000000000000000000B98675FFCC6666FFBF8C
      8CFFFAFAFAFFBFBFBFFFC0C0C0FFC2C2C2FFC3C3C3FFC4C4C4FFC5C5C5FFFAFA
      FAFFBF8C8CFFCC6666FF994D4DFF00000000000000000000000000000000E0AD
      89FFFFFFFFFFE2C4B7FFDFBCA8FFF2E0CBFFFDECBCFFF2DBAEFFDCAF8DFFDFBC
      AAFFFFE3D2FFFFDAC9FFAA7E7AFF00000000000000000000000000000000E0AD
      89FFFFFFFFFFFFFFFFFFFFFEFDFFFFF9F5FFFFF8F2FFFFF4E9FFFFF2E4FFFFEE
      DDFFFFE3D2FFFFDAC9FFAA7E7AFF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000006600CF34CA
      64FF10831DFF00660040000000000000000000000000B98675FFCC6666FFBF8C
      8CFFFAFAFAFFFAFAFAFFFAFAFAFFFAFAFAFFFAFAFAFFFAFAFAFFFAFAFAFFFAFA
      FAFFBF8C8CFFCC6666FF994D4DFF00000000000000000000000000000000E7B3
      8DFFFFFFFFFFFFFFFFFFE2C6B9FFD6AB90FFD2A083FFD9AC91FFE2C2B1FFF3DC
      CBFFF3BCB1FFF2A29CFFAB817CFF00000000000000000000000000000000E7B3
      8DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFDFFFFF9F5FFFFF8F2FFFFF4E9FFF9E6
      D5FFF3BCB1FFF2A29CFFAB817CFF000000000000000000000000000000000000
      00000000000000000000006600600066004000660050006600AF138F26FF138C
      26FF0066009F00000000000000000000000000000000B98675FF994D4DFFBF8C
      8CFFC4C4C4FFC4C4C4FFC4C4C4FFC4C4C4FFC4C4C4FFC4C4C4FFC4C4C4FFC4C4
      C4FFBF8C8CFF994D4DFF0000003000000000000000000000000000000000ECBA
      90FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFDFFFFF9F5FFFFF8F2FFB27F
      73FFB27F73FFB27F73FFB27F73FF00000000000000000000000000000000ECBA
      90FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFDFFFFF9F5FFFFF8F2FFB27F
      73FFB27F73FFB27F73FFB27F73FF000000000000000000000000000000000000
      0000000000000000000000660080006600EF006600FF07790DFF05720AEF0066
      0080000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F1BE
      93FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFDFFFFF9F5FFB27F
      73FFF0CE9DFFDAB19AFF0000000000000000000000000000000000000000F1BE
      93FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFDFFFFF9F5FFB27F
      73FFF0CE9DFFD29F82CF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000066004000660040000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F5C2
      95FFDCA987FFDCA987FFDCA987FFDCA987FFDCA987FFDCA987FFDCA987FFB27F
      73FFE2B89EFF000000000000000000000000000000000000000000000000F5C2
      95FFDCA987FFDCA987FFDCA987FFDCA987FFDCA987FFDCA987FFDCA987FFB27F
      73FFDBA887CF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000993300109D3700BF993300500000
      0000000000000000000000000000000000000000000000000000000000000000
      000099330010993300BF99330050000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000002AD160002AD1AF0000000000000000A37774FFA377
      74FFA37774FFA37774FFA37774FFA37774FFA37774FFA37774FFA37774FFA377
      74FFA37774FF90605DFF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000009E3800AFC25C00FFAC4600FF9933
      0060000000000000000000000000000000000000000000000000000000009933
      0010A53F00CFC96300FFAD4700EF993300300000000000000000000000000000
      00000000000000000000000000000000000000000000002AD140002AD1BF002A
      D160000000000000000000000000000000000000000000000000000000000000
      000000000000002AD39F002AD2FF002AD2BF0000000000000000A67B75FFFFCE
      C2FFFFCEC2FFFFCEC2FFFFCEC2FFFFCEC2FFFFCEC2FFFFCEC2FFFFCEC2FFFFCE
      C2FFFFCEC2FF93635FFF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000009D3700CFC25C00FFCC6600FFAD47
      00EF99330030000000000000000000000000000000000000000099330010A13B
      00CFC96300FFCC6600FFAD4700EF993300300000000000000000000000000000
      00000000000000000000000000000000000000000000002AD3BF002AD3FF002A
      D3FF002AD49F000000000000000000000000000000000000000000000000002B
      D610002BD6AF002BD6FF002BD6BF002BD6100000000000000000AB7F77FFF3E5
      D7FFFFE8D3FFFFE6CEFFFFE3C6FFFFE1C2FFFFDDBBFFFFD9B4FFFFD7B0FFFFD4
      A9FFFFD2A3FF966662FF00000000000000000000000000000000000000000000
      000000000000000000000000000000000000993300109D3700CFC96300FFCC66
      00FFA43E00DF99330010000000000000000000000000000000009F39008FC25C
      00FFCC6600FFAD4700EF99330030000000000000000000000000000000000000
      00000000000000000000000000000000000000000000002BD830002BD8EF002B
      D8FF002BD8FF002BD89F00000000000000000000000000000000002CDB20002C
      DBCF002CDBFF002CDB9F00000000000000000000000000000000B08379FFF4E7
      DBFFFFEDDBFFFFE8D3FFFFE6CEFFFFE3C6FFFFE1C2FFFFDDBBFFFFD9B4FFFFD7
      B0FFFFD4A9FF9A6964FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000099330010A43E00DFCC66
      00FFC66000FF9E38009F00000000000000000000000099330040B65000FFCC66
      00FFB34D00FF9933004000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000002CDE10002C
      DEBF002CDEFF002CDEFF002CDEAF002CDE1000000000002DE030002DDEEF002D
      DEFF002CDD9F0000000000000000000000000000000000000000B6897CFFF5EC
      E2FFFFEEDEFFFFEDDBFFFFE8D3FFFFE6CEFFFFE3C6FFFFE1C2FFFFDDBBFFFFD9
      B4FFFFD7B0FF9E6C66FF0000000000000000AD4700FFBF5900FFBF5900FFBF59
      00FFBF5900FFBF5900FFBF5900FFBC5600FF9E38009F0000000099330030AF49
      00FFCC6600FFB34D00FF993300200000000000000000A03A00DFCC6600FFBF59
      00FF993300800000000099330040B34D00FFBF5900FFBF5900FFBF5900FFBF59
      00FFBF5900FFBF5900FFBF5900FF000000000000000000000000000000000000
      0000002DE280002EE3FF002EE3FF002EE4CF002EE370002DE1EF002DE1FF002D
      E19F000000000000000000000000000000000000000000000000BC8E7EFFF7EF
      E6FFFFF3E6FFFFEEDEFFFFEDDBFFFFE8D3FFFFE6CEFFFFE3C6FFFFE1C2FFFFDD
      BBFFFFD9B4FFA26F68FF0000000000000000B95300FFD56F00FFCD6700FFCC66
      00FFCC6600FFCC6600FFCC6600FFC96300FFA23C00BF00000000000000009933
      0080C66000FFC96300FF9E38009F0000000099330040C35D00FFD46E00FFA842
      00DF000000000000000099330040B34D00FFBF5900FFBF5900FFBF5900FFC660
      00FFCC6600FFCC6600FFCC6600FF000000000000000000000000000000000000
      000000000000002EE530002EE6DF002EE5FF002EE5FF002EE5FF002EE59F0000
      0000000000000000000000000000000000000000000000000000C39581FFF8F3
      EFFFFFF5EAFFFFF3E6FFFFEEDEFFFFEDDBFFFFE8D3FFFFE6CEFFFFE3C6FFFFE1
      C2FFFFDDBBFFA5736AFF0000000000000000BF5A00FFDF7A00FFD97300FFCB65
      00FF9C3600EF9933008099330080993300809933002000000000000000009933
      0010AF4900FFCC6600FFAD4700EF000000009933008FE98400FFD46E00FF9933
      0060000000000000000000000000993300309933004099330040993300AFB953
      00FFCC6600FFCC6600FFCC6600FF000000000000000000000000000000000000
      00000000000000000000002FEB9F002FEBFF002FEBFF002FEBFF002FEB300000
      0000000000000000000000000000000000000000000000000000CA9B84FFF9F5
      F1FFFFF9F3FFFFF5EAFFFFF3E6FFFFEEDEFFFFEDDBFFFFE8D3FFFFE6CEFFFFE3
      C6FFFFE1C2FFA8766CFF0000000000000000C55F00FFEB8500FFCC6600FFDC76
      00FFCC6600FF9F39009F00000000000000000000000000000000000000000000
      0000AA4400BFCC6600FFB34D00FF99330010BA5400BFF89200FFC96400FF9933
      002000000000000000000000000000000000000000009933009FB95300FFCC66
      00FFB95300FFC25C00FFCC6600FF000000000000000000000000000000000000
      00000030F0100030EECF0030EEFF0030EEFF0030EE9F0030F2FF0030F2EF0030
      F230000000000000000000000000000000000000000000000000D2A187FFFAF9
      F9FFFFFAF6FFFFF9F3FFFFF5EAFFFFF3E6FFFFEEDEFFFFEDDBFFFFE8D3FFFFE6
      CEFFFFE3C6FFAC796EFF0000000000000000CB6500FFF69000FFB14B00EFB650
      00FFE17C00FFCF6900FF9F3900AF993300100000000000000000000000000000
      0000AA4400BFCC6600FFB34D00FF99330010AA4400BFFF9B05FFD87200FF9933
      0030000000000000000000000000000000009E38009FB95300FFCC6600FFB953
      00FF9933009FBF5900FFCC6600FF000000000000000000000000000000000031
      F3300030F1DF0030F1FF0030F1FF0030F060000000000031F4300031F6CF0032
      F7EF0032F8500000000000000000000000000000000000000000D9A88AFFFBFB
      FBFFFFFFFEFFFFFAF6FFFFF9F3FFFFF5EAFFFFF3E6FFFFEEDEFFFFEDDBFFFFE8
      D3FFFFE6CEFFAE7B71FF0000000000000000CC6A0CFFFF9C0AFFBB5500BF9933
      0060B65000FFE58000FFD26D00FFA84200CF9933003000000000000000009933
      0030B34D00FFCC6600FFAD4700EF0000000099330070F29926FFF99913FFA23C
      00AF993300100000000099330040AB4500CFCD6700FFD16B00FFB95300FF9933
      006099330040BF5900FFCC6600FF0000000000000000000000000031F5400031
      F5EF0031F5FF0031F5FF0031F5600000000000000000000000000032F8100032
      FA9F0033FCFF0033FE6000000000000000000000000000000000DFAE8CFFFCFC
      FCFFFFFFFFFFFFFFFEFFFFFAF6FFFFF9F3FFFFF5EAFFFFF3E6FFFFEEDEFFFFD7
      CEFFFFB0B0FFB07D72FF0000000000000000CC7224FFFFAB35FFBB580ABF0000
      000099330060BB5500EFE98400FFE37E00FFBB5500FFA53F00AF9933008FAA44
      00EFC96300FFC96300FF9E38009F0000000099330010BB5E1CEFFFB146FFEC92
      24FFC25F0AEFB65000DFD67000FFEF8900FFE68100FFB34D00FF993300600000
      000099330040BF5900FFCC6600FF00000000000000000032FA600032FAFF0032
      FAFF0032FAEF0032FA6000000000000000000000000000000000000000000000
      00000033FF600033FFCF00000000000000000000000000000000E5B38FFFFDFD
      FDFFFFFFFFFFFFFFFFFFFFFFFEFFFFFAF6FFFFF9F3FFFFF5EAFFF4DECEFFB27F
      73FFB27F73FFB27F73FF0000000000000000CC7A3CFFFFB960FFB35313BF0000
      00000000000099330030AC4600DFE37D00FFE78200FFE07A00FFD97300FFD26C
      00FFC96300FFA33D00EF99330010000000000000000099330060BF6729FFFFB8
      5EFFFFAD3AFFFFA21AFFFF9A02FFE27C00FFAC4600DF99330030000000000000
      000099330030B65000FFC25C00FF00000000000000000033FDEF0033FDFF0032
      FCEF0032FA300000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000EAB891FFFEFE
      FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFFFAF6FFFFF9F3FFF5E1D2FFB27F
      73FFEDA754FFCB987FCF0000000000000000A444118FB35720BF993300500000
      000000000000000000009933001099330080BC5600EFCF6900FFD16B00FFBE58
      00FFA33D00BF993300300000000000000000000000000000000099330030A240
      0AAFC56C26DFC2641AEFB3500ABF993300600000000000000000000000000000
      000000000000993300609933007000000000000000000033FF800033FFBF0033
      FF30000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000EFBC92FFFFFF
      FFFFFCFCFCFFFAFAFAFFF7F7F7FFF5F5F5FFF2F1F1FFF0EDEAFFE9DAD0FFB27F
      73FFD4A183CFD09D811000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000099330040993300409933
      0020000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000F2BF94FFDCA9
      87FFDCA987FFDCA987FFDCA987FFDCA987FFDCA987FFDCA987FFDCA987FFB27F
      73FFD8A585100000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000A67A75FFA37774FFA37774FFA37774FFA37774FFA37774FFA377
      74FFA37774FFA37774FFAF7C72FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CC6600FFCC6600FFCC66
      00FFCC6600FFCC6600FFCC6600FFCC6600FFCC6600FFCC6600FFCC6600FFCC66
      00FFCC6600FFCC6600FFCC6600FFCC6600FF0000000000000000000000000000
      00009C36008FA84200BF9933008F0000000000000000000000009933008FA842
      00BF9C36008F0000000000000000000000000000000000000000000000000000
      000000000000A97D77FFFFD4C2FFFFD8CBFFFFD7C9FFFFD4C2FFFFD4C1FFFFD0
      BBFFFFCFB9FFFFCCB3FFAF7C72FF000000000000000000000000000000000000
      00000000000000000000A97D77FFAF7C72FFAF7C72FFAF7C72FFAF7C72FFAF7C
      72FFAF7C72FFAF7C72FFAF7C72FF0000000000000000CC6600FFFFFFFFFFFFFC
      F8FFFFF8F0FFFFF3E7FFCC6600FFFFECD9FFFFE9D3FFFFE5CAFFFFE2C5FFFFDD
      BBFFFFDBB5FFFFD5ABFFFFD3A7FFCC6600FF0000000000000000000000009933
      0030AB4500FFA94300CFA74100FF993300800000000099330080A33D00FFA943
      00CFB14B00FF9933003000000000000000000000000000000000000000000000
      000000000000AD8078FFFFE2C5FFFFD3A7FFFFD2A4FFFFD1A2FFFFD0A0FFFFCF
      9FFFFFCE9DFFFFC2BAFFAF7C72FF0000000000000000000000000099CC400099
      CCFF0099CCFF0099CCFFAD8078FFFFD2A6FFFFD2A5FFFFD0A2FFFFD0A0FFFFCE
      9DFFFFCE9CFFFFCEB6FFAF7C72FF0000000000000000CC6600FFFFFFFFFFFFFF
      FFFFFFFBF6FFFFF8F0FFCC6600FFFFECD9FFFFECD9FFFFE9D3FFFFE5CAFFFFE2
      C4FFFFDCB9FFFFDBB5FFFFD5ABFFCC6600FF0000000000000000000000009933
      0040A64000FF000000009933008FB04B00CF00000000993300CF993300809933
      0020A64000FF9933004000000000000000000000000000000000000000000000
      000000000000B2857AFFFFE2C5FFFFE2C5FFFFE2C5FFFFE2C5FFFFE2C5FFFFE2
      C5FFFFE2C5FFFFC2BAFFAF7C72FF00000000000000000099CC200099CCFF6BDE
      F2FF69DBF2FF69DBF2FFB2857AFFFFF2E5FFFFF2E5FFFFF2E5FFFFF2E5FFFFF2
      E5FFFFF2E5FFFFD1BBFFAF7C72FF0000000000000000CC6600FFFFFBF6FF9999
      99FF999999FFFFFBF6FFCC6600FFFFECD9FF999999FF999999FF999999FF9999
      99FF999999FF999999FFFFDBB5FFCC6600FF0000000000000000000000009933
      0020A94300FF993300809933009FBD5800FF00000000A74100FF9933008F9933
      009FAF4900FF99330020000000000000000000000000AA7D77FFA67A75FFA67A
      75FFA67A75FFB78A7DFFFFE5CAFFFFD5ABFFFFD4A9FFFFD3A8FFFFD2A6FFFFD2
      A4FFFFD0A1FFFFC2BAFFAF7C72FF000000000000000040B3D9FF8FF5FFFF70D6
      FFFF70D6FFFF70D6FFFFB78A7DFFFFF2E5FFFFF2E5FFFFF2E5FFFFF2E5FFFFF2
      E5FFFFF2E5FFFFD2BEFFAF7C72FF0000000000000000CC6600FFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFCC6600FFFFECD9FFFFECD9FFFFECD9FFFFECD9FFFFEC
      D9FFFFECD9FFFFECD9FFFFECD9FFCC6600FF0000000000000000000000000000
      00009F39008FB44E00FFBC5600FFB14B00FF99330040AF4900FFBE5800FFB650
      00FF9F39008F00000000000000000000000000000000AF8279FFFFD8CBFFFFD8
      CBFFFFD8CBFFC29480FFFFE8D1FFFFE8D1FFFFE8D1FFFFE8D1FFFFE8D1FFFFE8
      D1FFFFE8D1FFFFC2BAFFAF7C72FF000000000000000040B3D9FF8FF5FFFF7AE0
      FFFF7AE0FFFF7AE0FFFFC29480FFFFF2E5FFFFD5AAFFFFD4A9FFFFD2A6FFFFD2
      A5FFFFD0A2FFFFD5C4FFAF7C72FF0000000000000000CC6600FFFFFFFFFF9999
      99FF999999FFFFFFFFFFCC6600FFFFEEDEFF999999FF999999FF999999FF9999
      99FF999999FF999999FFFFECD9FFCC6600FF0000000000000000000000000000
      000000000000993300509933008099471CFF815036DF9A481DFF9933008F9933
      00500000000000000000000000000000000000000000B4877BFFFFE2C5FFFFD3
      A7FFFFD3A7FFC29480FFFFECD9FFFFD2A6FFFFD2A6FFFFD2A6FFFFD2A6FFFFD2
      A6FFFFD2A6FFFFC2BAFFAF7C72FF000000000000000040B3D9FF8FF5FFFF82E8
      FFFF82E8FFFF82E8FFFFC29480FFFFF2E5FFFFF2E5FFFFF2E5FFFFF2E5FFFFF2
      E5FFFFF2E5FFFFD6C7FFAF7C72FF0000000000000000CC6600FFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFCC6600FFFFF2E4FFFFF2E4FFFFF2E4FFFFF2E4FFFFF2
      E4FFFFF2E4FFFFF2E4FFFFF2E4FFCC6600FF0000000000000000000000000000
      00000000000000000000000000007A5F4FDFC3B7B0FF7F6455DF000000000000
      00000000000000000000000000000000000000000000B98C7DFFFFE4CAFFFFE4
      CAFFFFE4CAFFC99A83FFFFF1E2FFFFF1E2FFFFF1E2FFFFF1E2FFFFF1E2FFFFF1
      E2FFFFF1E2FFFFC2BAFFAF7C72FF000000000000000040B3D9FF97F6FFFF8AF0
      FFFF8AF0FFFF8AF0FFFFC99A83FFFFF2E5FFFFD8B1FFFFD7AEFFFFD6ADFFFFD5
      AAFFFFD4A9FFFFD2C6FFAF7C72FF0000000000000000CC6600FFFFFFFFFF9999
      99FF999999FFFFFFFFFFCC6600FFFFF6ECFF999999FF999999FF999999FF9999
      99FF999999FF999999FFFFF9F4FFCC6600FF0000000000000000000000000000
      00000000000000000000775B4B80B1A199FF988377FFA39085FF775B4B800000
      00000000000000000000000000000000000000000000BF917FFFFFE8D1FFFFD4
      A8FFFFD4A8FFCE9E85FFFFF5EBFFFFFFFFFFFFFCF9FFFFF8F0FFFFF3E7FFFFF0
      E1FFFFE1D2FFFFC2BAFFAF7C72FF000000000000000040B3D9FFA3F7FFFF92F8
      FFFF92F8FFFF92F8FFFFCE9E85FFFFF2E5FFFFF2E5FFFFF2E5FFFFF2E5FFFFF2
      E5FFFFD6CCFFFFA8A5FFAF7C72FF0000000000000000CC6600FFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFCC6600FFFFF9F4FFFFF9F4FFFFF9F4FFFFF9F4FFFFF9
      F4FFFFF9F4FFFFF9F4FFFFF9F4FFCC6600FF0000000000000000000000000000
      000000000000000000008E7A6EDFA79D97FF775B4BAFAC9B92FF998478EF775B
      4B100000000000000000000000000000000000000000C59781FFFFECD9FFFFEC
      D9FFFFECD9FFD4A487FFFFF9F4FFFFFFFFFFFFFFFFFFFFFCF9FFFFF8F0FFFFF3
      E7FFB27F73FFB27F73FFB27F73FF000000000000000040B3D9FFB1F8FFFF99FF
      FFFF99FFFFFF99FFFFFFD4A487FFFFFAF4FFFFFFFFFFFFFFFFFFFFFAF4FFFFF7
      EEFFAF7C72FFAF7C72FFAF7C72FF0000000000000000CC6600FFFFFFFFFF9999
      99FF999999FFFFFFFFFFCC6600FFFFFDFBFF999999FF999999FF999999FF9999
      99FF999999FF999999FFFFF9F4FFCC6600FF0000000000000000000000000000
      000000000000775B4B60BCB3ADFF866F61BF000000007E6454BFB5AAA4FF775B
      4B600000000000000000000000000000000000000000CC9D84FFFFF0E2FFFFD2
      A6FFFFD2A6FFD9A98AFFFFFDFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCF9FFFFF8
      F0FFB27F73FFDBA378EFCC998030000000000000000040B3D9FFC0FAFFFFA0FF
      FFFFA0FFFFFFA0FFFFFFD9A98AFFFFFFFFFFFCFCFCFFFAFAFAFFF8F8F8FFF9F4
      EEFFAF7C72FFD29F829F000000000000000000000000CC6600FFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFCC6600FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FEFFFFF9F3FFFFF8EFFFFFF2E5FFCC6600FF0000000000000000000000000000
      0000000000008B7366AFAF9F96FF775B4B2000000000775B4B20B3A49BEF8971
      64BF0000000000000000000000000000000000000000D2A286FFFFF5EBFFFFF5
      EBFFFFF5EBFFDFAE8CFFDCA987FFDCA987FFDCA987FFDCA987FFDCA987FFDCA9
      87FFB27F73FFD6A3853000000000000000000000000040B3D9FFD0FBFFFFB9FF
      FFFFB9FFFFFFC3F9F2FFDFAE8CFFDCA987FFDCA987FFDCA987FFDCA987FFDCA9
      87FFAF7C72FF00000000000000000000000000000000CC6600FFDF7A00FFDF7A
      00FFDF7A00FFDF7A00FFDF7A00FFDF7A00FFDF7A00FFDF7A00FFDF7A00FFDF7A
      00FFDF7A00FFDF7A00FFDF7A00FFCC6600FF0000000000000000000000000000
      0000775B4B10887366FF775B4B80000000000000000000000000775B4B80836C
      5FFF775B4B1000000000000000000000000000000000D8A789FFFFF9F3FFFFFF
      FFFFFFFEFCFFFFF8F1FFFFF7EDFFFAE7D7FFEFB18BFFB27F73FF000000000000
      0000000000000000000000000000000000000000000040B3D9FFDEFCFFFFD2FF
      FFFF99E6F2FF99E6F2FF99E6F2FF99E6F2FF99E6F2FF99E6F2FFB6F2F9FFD2FF
      FFFF0099CCFF00000000000000000000000000000000CE6800FFCF6900FFCF69
      00FFCF6900FFCF6900FFCF6900FFCF6900FFCF6900FFCF6900FFCF6900FFCF69
      00FFCF6900FFCF6900FFCF6900FFCE6800EF0000000000000000000000000000
      0000775B4B40775B4BDF775B4B10000000000000000000000000000000007A60
      50DF775B4B4000000000000000000000000000000000DDAD8CFFFFFCFAFFFFFF
      FFFFFFFFFFFFFFFEFCFFFFF8F1FFB27F73FFB27F73FFB27F73FF000000000000
      0000000000000000000000000000000000000000000040B3D9FFEAFDFFFFD1E0
      DDFFA08C81FFA08C81FFA08C81FFA08C81FFA08C81FFA08C81FF87A8AFFFCDF2
      F9FF0099CCFF00000000000000000000000000000000CC660030D27313FFD273
      13FFD27313FFD27313FFD27313FFD27313FFD27313FFD27313FFD27313FFD273
      13FFD27313FFD27313FFD27313FFCC6600400000000000000000000000000000
      0000775B4B50775B4B500000000000000000000000000000000000000000775B
      4B40775B4B6000000000000000000000000000000000E3B28DFFFFFFFFFFFCFC
      FCFFF8F8F8FFF5F5F5FFF1F0EFFFB27F73FFE5BE97FFD4A18460000000000000
      000000000000000000000000000000000000000000000000000023B1D8CF60D1
      E3FF73999EFFCABFB9FFDDD6D2FFDDD6D2FFDDD6D2FF879596FF2D9BBFFF20A6
      D2FF0099CC500000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E7B590FFDCA987FFDCA9
      87FFDCA987FFDCA987FFDCA987FFB27F73FFDEAB895000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000A28E83FFAA998FFFAA998FFFAA998FFF99847880000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000600360015F05CF026909FF026407FF005E04FF004D03DF003D028F003D
      0220000000000000000000000000000000000000000000000000000000000000
      00000000000000540330004B025000460280003D0240003D0220000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000006B03300271
      08CF0C9822FF11B62FFF0DB425FF09B21CFF06B016FF01AE0BFF009107FF005B
      04EF003D02600000000000000000000000000000000000000000000000000069
      0360036B09DF057E10FF069314FF049610FF007E06FF006705FF003D02BF003D
      0230000000000000000000000000000000000000000000000000006699100066
      998000669920000000000000000000000000000000000000000000669910408C
      B380006699300000000000000000000000000000000000000000006699100066
      998000669920000000000000000000000000000000000000000000669910408C
      B380006699300000000000000000000000000000000000760320078414EF1CB6
      45FF1BBA44FF17B83AFF12B630FF3CC352FF1AB72DFF08B21BFF04AF11FF00AD
      09FF006705FF003D026000000000000000000000000000000000006F039F0F97
      28FF14B735FF12B630FF0EB426FF09B21CFF07B117FF02AE0DFF009F08FF0060
      04FF003D026000000000000000000000000000000000000000000066998092DD
      F2FF008FC2EF00669950000000000000000000000000006699306DA8C5DFE0FB
      FFFF0A73A2AF00000000000000000000000000000000000000000066998092DD
      F2FF008FC2EF00669950000000000000000000000000006699306DA8C5DFE0FB
      FFFF0A73A2AF0000000000000000000000000000000004860BBF23B753FF24BE
      58FF21BD51FF1CBA45FF6FD388FFFFFFFFFFB5E8BEFF0EB426FF0AB21DFF07B1
      18FF02AE0DFF005F04EF004302200000000000000000007A039F16A337FF1EBB
      4AFF1BBA44FF18B93DFF5DCD72FF79D588FF0BB321FF09B21CFF05B013FF01AD
      0AFF006705FF003D02400000000000000000000000000000000000669920BFD9
      E6FF32D6FFFF15A7D2FF006699800000000000669960AACCDDEFAFEFFFFF2FC0
      E6FF00669960000000000000000000000000000000000000000000669920BFD9
      E6FF32D6FFFF15A7D2FF006699800000000000669960AACCDDEFAFEFFFFF2FC0
      E6FF00669960000000000000000000000000008C024017A437FF2EC26BFF2CC1
      66FF25BF5AFF76D695FFFFFFFFFFFFFFFFFF9AE0ABFF13B631FF11B62EFF0BB3
      21FF09B21CFF059712FF0049029F000000000084024017A237FF28C060FF24BE
      58FF22BD53FF1CBB47FFD4F2DCFFFFFFFFFFA6E4B1FF0FB52AFF0AB21DFF08B1
      1AFF02A80DFF005503DF00000000000000000000000000000000000000005599
      BBBF9FECFFFF15D3FFFF32BDDFFF1F7EAABFBFD9E6FFB3F5FFFF0ED1FFFF0389
      BBEF000000000000000000000000000000000000000000000000000000005599
      BBBF9FECFFFF15D3FFFF32BDDFFF1F7EAABFBFD9E6FFB3F5FFFF0ED1FFFF0389
      BBEF000000000000000000000000000000000091028F28BB5EFF2EC26BFF2EC2
      6BFF7CD9A1FFFFFFFFFFFFFFFFFFACE6BFFF1CBB47FF1ABA43FF15B838FF12B6
      30FF0FB52AFF0AB21DFF026708DF00000000008C02AF2BBF64FF2EC26BFF2CC1
      67FF26BF5CFF23BE57FF75D694FFFFFFFFFFFFFFFFFFA6E4B1FF11B62FFF0DB4
      25FF09B21CFF058B11FF004B0260000000000000000000000000000000000066
      9950DFECF2FF25D4FFFF3ADFFFFF86F2FFFFBFFFFFFF6EF0FFFF29CDF2FF0066
      9980000000000000000000000000000000000000000000000000000000000066
      9950DFECF2FF25D4FFFF3ADFFFFF86F2FFFFBFFFFFFF6EF0FFFF29CDF2FF0066
      998000000000000000000000000000000000009701BF2EC26BFF2EC26BFF7CD9
      A3FFFFFFFFFFFFFFFFFFF1FBF5FF92DFACFF92DFACFF8EDDA3FF8DDDA2FF8BDC
      9DFF14B734FF11B62FFF057710FF000000000C9F1CFF2EC26BFF2EC26BFF2EC2
      6BFF2EC26BFF2AC063FF25BE59FF76D697FFFFFFFFFFFFFFFFFFA6E4B1FF12B6
      30FF10B52BFF0AA71DFF0054039F000000000000000000000000000000000000
      000055A0C2EF70E2FFFF1AD5FFFF59E9FFFF90FCFFFF8BFAFFFF29A6CCFF0066
      9930000000000000000000000000000000000000000000000000000000000000
      000055A0C2EF70E2FFFF1AD5FFFF59E9FFFF90FCFFFF8BFAFFFF29A6CCFF0066
      99300000000000000000000000000000000000A001BF2EC26BFF48CA7EFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF1BBA44FF17B83AFF0A8D1BFF00A2012017AD36FF2EC26BFF62D190FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA8E5
      B6FF14B735FF12B630FF005E03BF000000000000000000000000006699400095
      C8CF05C7F9FF13D3FFFF07CEFFFF3CE0FFFF78F4FFFF99FFFFFF5EDEF2FF128E
      BBEF006699700000000000000000000000000000000000000000006699400095
      C8CF05C7F9FF13D3FFFF07CEFFFF3CE0FFFF037607FF037607FF037607FF128E
      BBEF0066997000000000000000000000000000A401BF33C36EFF2EC26BFF7CD9
      A3FFFFFFFFFFFFFFFFFFFFFFFFFFA4E4BEFF97E1B5FF97E1B5FF95E0B1FF92DF
      ACFF21BD51FF1CBA45FF077F13FF00A2013017B236FF2EC26BFF62D190FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD5F3
      DEFF29BE50FF18B93DFF006803BF0000000000669920008FC29F00B9ECFF3EE1
      FFFF59E9FFFF30DCFFFF05CEFFFF21D7FFFF60ECFFFF94FDFFFF86F9FFFF43E2
      FFFF07B5E6FF0076A9CF006699400000000000669920008FC29F00B9ECFF3EE1
      FFFF59E9FFFF30DCFFFF05CEFFFF21D7FFFF037607FF51E984FF037607FF43E2
      FFFF07B5E6FF0076A9CF006699400000000000AD008044C665FF3FC776FF2EC2
      6BFF7CD9A3FFFFFFFFFFFFFFFFFFD8F4E3FF3BC674FF2EC26BFF2EC26BFF2CC1
      66FF25BF5AFF23BE57FF047E0DCF0000000010AF1EFF35C470FF3BC674FF62D1
      90FF62D190FF62D190FF62D190FF89DDACFFFFFFFFFFFFFFFFFFD7F3E2FF32C2
      62FF22BD53FF1AB642FF006B039F000000002499C5DF80E6FFFFABF4FFFFCCFF
      FFFFDAFBFFFFCEF7FFFF64E1FFFF0CD0FFFF41E1FFFFBBF9FFFFE3FEFFFFADF4
      FFFF89E9FFFF87E8FFFF3999BFFF006699202499C5DF80E6FFFFABF4FFFFCCFF
      FFFFDAFBFFFFCEF7FFFF037607FF037607FF037607FF51E984FF037607FF0376
      07FF037607FF87E8FFFF3999BFFF0066992000AD002031BE3CFF72D595FF52CC
      82FF35C470FF7CD9A3FFFFFFFFFFFFFFFFFFA4E4BEFF2EC26BFF2EC26BFF2EC2
      6BFF2DC26AFF1AA73EFF007803700000000008B00CAF5ECF84FF44C879FF30C3
      6DFF2EC26BFF2EC26BFF55CD87FFF2FBF6FFFFFFFFFFD8F4E3FF3BC674FF2CC1
      67FF27BF5DFF17A338FF00760360000000003988B08F5599BBBF329DC5FF329D
      C5FF329DC5FF329DC5FFC6F5FFFF02CDFFFF2BDAFFFF0671A2BF329DC5FF329D
      C5FF329DC5FF329DC5FF5D9EBEAF006699103988B08F5599BBBF329DC5FF329D
      C5FF329DC5FF329DC5FF037607FF119022FF24AD46FF42DA75FF26A640FF219B
      35FF037607FF329DC5FF5D9EBEAF006699100000000000B7008F75D683FF82DA
      A0FF66D28EFF44C879FF7FDAA4FFF2FBF6FF89DDACFF2EC26BFF2EC26BFF2EC2
      6BFF2BBF64FF03870ADF008102100000000000B1005045C652FF74D697FF57CE
      85FF3AC573FF2EC26BFFBEECD1FFFFFFFFFFD8F4E3FF3BC674FF2EC26BFF2EC2
      6BFF2BBE64FF05870FEF00760310000000000000000000000000000000000000
      00000000000000669930329DC5FF0ED1FFFF07BBECFF00669960000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000669930037607FF037607FF037607FF35CE67FF037607FF0376
      07FF037607FF0000000000000000000000000000000000B800100FBC10CF77D7
      80FF98E0ADFF76D798FF5ACE86FF3AC573FF2EC26BFF2EC26BFF2EC26BFF28BD
      5EFF099817EF008C023000000000000000000000000000B700AF84DA91FF8CDC
      A6FF68D38FFF4BCA7DFF67D393FF97E1B5FF3BC674FF2EC26BFF2EC26BFF2EC2
      6BFF119F29FF0083025000000000000000000000000000000000000000000000
      00000000000000000000329DC5FF58E1FFFF009FD2FF00669920000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000329DC5FF58E1FFFF037607FF26BF4DFF037607FF0000
      000000000000000000000000000000000000000000000000000000B8001000B8
      008F47CB49FF84DA91FF8CDCA6FF6AD391FF4ECB7FFF2DBF61FF17B136FF049C
      0ABF009701300000000000000000000000000000000000B800100FBC10CF62D2
      69FF9BE0AFFF7ED99DFF5ED089FF3FC776FF2EC26BFF2EC26BFF2BBF64FF11A6
      29FF008E02600000000000000000000000000000000000000000000000000000
      00000000000000000000329DC5FFA0EEFFFF0B8EBDDF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000329DC5FFA0EEFFFF037607FF037607FF037607FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000B8002000B8008000B600BF00AE00BF00AD00BF00A6018F00A201400000
      00000000000000000000000000000000000000000000000000000000000000B8
      008026C227EF5BD065FF66D07AFF50CA6DFF33C056FF14B02FFF04A10ABF0097
      0140000000000000000000000000000000000000000000000000000000000000
      00000000000000000000247CA8708CCADFFF0472A39F00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000247CA8708CCADFFF0472A39F00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000B8004000B7008000AD008000AD006000A60130000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000009FD2FF0066991000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000009FD2FF0066991000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000D00000000100010000000000800600000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFFFFFFFFF00001F9FC1FF07FF0000
      008F801F007F0000000780030007000000038003000300000000800100030000
      0001800100010000000380000001000000018000000000000001800000000000
      00008007000000000000C00700000000000FE01F00070000000FF03F00070000
      C03FFFFF83FF0000FFFFFFFFFFFF0000FFFFFFFFFF00FFFF0001FC01FF00C0FF
      000180018300C0070001C001C000000700018001800000030001800180000003
      000180018800000100018C018C00000100018C018C0000010001C00184010001
      0001E003C00300070001F80FF003003F0001FC1FF007003F0001FF3FF81F07FF
      0001FFFFF81FFFFFFFFFFFFFFE7FFFFFFFFFFFFFFFFFFFFFE0FF000100010001
      C0FF000100010001C07F000100010001C01F000100010001C01F000100010001
      C01F000100010001C01F000100010001C08F000100010001C0CF000100010001
      C0C7000100010001C0E7000100010001C0E7000100010001E3FF000100010001
      E7FF000100010001E7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8000FFFFFFFF8001
      80000CE1FFF08001800008E1FFF0800180000821FFF0800180000CE1FFF08003
      80000EE1FC1080038000FFFFFE1F80038000FFFFFC1F800380000E61081F8003
      80000E21085F80038000082109FF800380000E610FFF800380000EE10FFF8003
      8000FFFFFFFF8003FFFFFFFFFFFF800387FFFFFFFF7FFFFF807FF81FFC1F8FFF
      800FE007F00F80FF80078007C007800F800700070007800F8007000700078007
      800300070007800380030007000780008003000700078000800F000100048000
      800F000100008000C003000000018000F8030001000183C0F807C1810000FFF3
      FC1FFFC3FF88FFFFFE3FFFE7FFFFFFFF81EFFFEFFFF7FFF78DC781C70FE3FFE3
      C583818300C1FFC1E30181010080C080E30181010080C08091C781C70063C0E3
      81C781C7006300E381C781C700E300E3184781C700E300E398C7FFC700E300E3
      81C7FFC700E300E3C1C7C3C700E303E3C1C7C3C7FFE303E3E3C7C3C7FFE303E3
      E3CFC3CFFFE7FFE7F7EFC3EFFFF7FFF7FFFFFFFFFFFFFFFF8000800080008000
      8000800080008000800080008000800080008000800080008000800080008000
      8000800080008000800080008000800080008000800080008000800080008000
      8000800080008000800080008000800080008000800080008000800080008000
      8000800080008000FFFFFFFFFFFFFFFFF3C7FFFF0000F93FF0C30FFF0000E007
      208307FF0000C00121C303FF0000800101C781FF000080030043C1FF00008003
      0043E003000080030043F0010000800300C1F8010000800301E0F8010000E007
      03E0F8010000E01F07D0F8010000E03F0780F8010000E03F0F00F8010000C03F
      1F00F8010000C07F3F81FC030000807F81FFFFFFFFFFFFFF801F8001E001E001
      800F80018001E001800780018001E001800780018001E00180078001C001E001
      80038001E001E00180038001E001E00180038001E001E00180018001E001E001
      80008001E001E00183C38001E001E001FFC38001E001E001FC078001E001E001
      FC0FFFFFE003E003FF3FFFFFE007E007FFFFFFFFFFFFFFFFFF1FF1FFFFFCC003
      FF0FE0FF8FF8C003FF07C0FF87E0C003FF03C1FF83C3C003FF8383FFC087C003
      00418401F00FC00300610C01F81FC00300610E01FC1FC00303F00F81F00FC003
      00F00F01E087C00300610401C1C3C0031001001183F3C0031801803187FFC003
      1C03C0F98FFFC003FF8FFFFFFFFFC007FFFFFFFFF801FFFF8000F1C7F801FC01
      8000E083F801C0018000E483F80180018000E083800180018000F00780018001
      8000F80F800180018000FE3F800180018000FC1F800180018000FC0F80018001
      8000F88F800180038000F88F800380078000F1C7803F80078000F1E7803F8007
      8000F3E7803FC007FFFFFFFF807FF83FF00FF83FFFFFFFFFC007E00FC7C7C7C7
      8003C007C387C38780018003C107C10700010003E00FE00F00010001E00FE00F
      00010001F00FF00F00000001C007C00700000001000100010001000100000000
      000100010000000080010001F83FF80780038003FC3FFC1FC0078007FC7FFC1F
      F01FE00FFC7FFC7FFFFFF83FFE7FFE7F00000000000000000000000000000000
      000000000000}
  end
  object DisplayProcess: TTimer
    Interval = 200
    OnTimer = DisplayProcessTimer
    Left = 324
    Top = 320
  end
  object XPManifest1: TXPManifest
    Left = 473
    Top = 320
  end
  object Option_ImageList: TImageList
    Left = 444
    Top = 320
    Bitmap = {
      494C010104000900040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000003000000001002000000000000030
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007B7B7B00BDBD
      BD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBD
      BD00BDBDBD00BDBDBD00000000000000000000000000000000007B7B7B00BDBD
      BD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBD
      BD00BDBDBD00BDBDBD0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007B7B7B000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000BDBDBD00000000000000000000000000000000007B7B7B000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000BDBDBD0000000000000000007B7B7B007B7B7B007B7B7B007B7B
      7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B
      7B007B7B7B007B7B7B00000000000000000000000000000000007B7B7B007B7B
      7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B
      7B007B7B7B007B7B7B00000000000000000000000000000000007B7B7B000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000BDBDBD00000000000000000000000000000000007B7B7B000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000BDBDBD0000000000000000007B7B7B000000000000FFFF00BDBD
      BD0000FFFF00BDBDBD0000FFFF00BDBDBD0000FFFF00BDBDBD0000FFFF00BDBD
      BD0000FFFF007B7B7B00000000000000000000000000000000007B7B7B000000
      000000FFFF00BDBDBD0000FFFF00BDBDBD0000FFFF00BDBDBD0000FFFF00BDBD
      BD0000FFFF007B7B7B00000000000000000000000000000000007B7B7B000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000BDBDBD00000000000000000000000000000000007B7B7B000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000BDBDBD0000000000000000007B7B7B0000000000BDBDBD0000FF
      FF00BDBDBD0000FFFF00BDBDBD0000FFFF00BDBDBD0000FFFF00BDBDBD0000FF
      FF00BDBDBD007B7B7B000000000000000000000000007B7B7B000000000000FF
      FF00BDBDBD0000FFFF00BDBDBD0000FFFF00BDBDBD0000FFFF00BDBDBD0000FF
      FF00BDBDBD00000000007B7B7B000000000000000000000000007B7B7B000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000BDBDBD00000000000000000000000000000000007B7B7B000000
      0000000000000000000000000000000000000000FF0000000000000000000000
      000000000000BDBDBD0000000000000000007B7B7B000000000000FFFF00BDBD
      BD0000FFFF00BDBDBD0000FFFF00BDBDBD0000FFFF00BDBDBD0000FFFF00BDBD
      BD0000FFFF007B7B7B000000000000000000000000007B7B7B0000000000BDBD
      BD0000FFFF00BDBDBD0000FFFF00BDBDBD0000FFFF00BDBDBD0000FFFF00BDBD
      BD007B7B7B00000000007B7B7B000000000000000000000000007B7B7B000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000BDBDBD00000000000000000000000000000000007B7B7B000000
      0000000000000000000000000000000000000000FF000000FF00000000000000
      000000000000BDBDBD0000000000000000007B7B7B0000000000BDBDBD0000FF
      FF00BDBDBD0000FFFF00BDBDBD0000FFFF00BDBDBD0000FFFF00BDBDBD0000FF
      FF00BDBDBD007B7B7B0000000000000000007B7B7B0000000000BDBDBD0000FF
      FF00BDBDBD0000FFFF00BDBDBD0000FFFF00BDBDBD0000FFFF00BDBDBD0000FF
      FF00000000007B7B7B007B7B7B000000000000000000000000007B7B7B000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000BDBDBD00000000000000000000000000000000007B7B7B000000
      0000000000000000FF000000FF000000FF000000FF000000FF000000FF000000
      000000000000BDBDBD0000000000000000007B7B7B000000000000FFFF00BDBD
      BD0000FFFF00BDBDBD0000FFFF00BDBDBD0000FFFF00BDBDBD0000FFFF00BDBD
      BD0000FFFF007B7B7B0000000000000000007B7B7B0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007B7B
      7B0000000000BDBDBD007B7B7B000000000000000000000000007B7B7B000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000BDBDBD00000000000000000000000000000000007B7B7B000000
      0000000000000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF0000000000BDBDBD0000000000000000007B7B7B0000000000BDBDBD0000FF
      FF00BDBDBD0000FFFF00BDBDBD0000FFFF00BDBDBD0000FFFF00BDBDBD0000FF
      FF00BDBDBD007B7B7B0000000000000000007B7B7B007B7B7B007B7B7B007B7B
      7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B
      7B007B7B7B0000FFFF007B7B7B000000000000000000000000007B7B7B000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000BDBDBD00000000000000000000000000000000007B7B7B000000
      0000000000000000FF000000FF000000FF000000FF000000FF000000FF000000
      000000000000BDBDBD0000000000000000007B7B7B000000000000FFFF00BDBD
      BD0000FFFF00BDBDBD0000FFFF00BDBDBD0000FFFF00BDBDBD0000FFFF00BDBD
      BD0000FFFF007B7B7B000000000000000000000000007B7B7B0000000000BDBD
      BD0000FFFF00BDBDBD0000FFFF00BDBDBD0000FFFF00BDBDBD0000FFFF00BDBD
      BD0000FFFF00BDBDBD007B7B7B000000000000000000000000007B7B7B000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000BDBDBD00000000000000000000000000000000007B7B7B000000
      0000000000000000000000000000000000000000FF000000FF00000000000000
      000000000000BDBDBD0000000000000000007B7B7B0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000007B7B7B000000000000000000000000007B7B7B000000000000FF
      FF00BDBDBD0000FFFF00BDBDBD0000FFFF00BDBDBD0000000000000000000000
      000000000000000000007B7B7B000000000000000000000000007B7B7B000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000BDBDBD00000000000000000000000000000000007B7B7B000000
      0000000000000000000000000000000000000000FF0000000000000000000000
      000000000000BDBDBD0000000000000000007B7B7B00BDBDBD0000FFFF00BDBD
      BD0000FFFF00BDBDBD0000FFFF00BDBDBD007B7B7B007B7B7B007B7B7B007B7B
      7B007B7B7B007B7B7B000000000000000000000000007B7B7B0000000000BDBD
      BD0000FFFF00BDBDBD0000FFFF00BDBDBD00000000007B7B7B007B7B7B007B7B
      7B007B7B7B007B7B7B007B7B7B000000000000000000000000007B7B7B000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007B7B7B000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007B7B7B00BDBDBD0000FF
      FF00BDBDBD0000FFFF00BDBDBD007B7B7B000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007B7B7B000000
      0000000000000000000000000000000000007B7B7B0000000000000000000000
      00000000000000000000000000000000000000000000000000007B7B7B000000
      000000000000000000000000000000000000000000000000000000000000BDBD
      BD00000000007B7B7B00000000000000000000000000000000007B7B7B000000
      000000000000000000000000000000000000000000000000000000000000BDBD
      BD00000000007B7B7B00000000000000000000000000000000007B7B7B007B7B
      7B007B7B7B007B7B7B007B7B7B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007B7B
      7B007B7B7B007B7B7B007B7B7B007B7B7B000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007B7B7B000000
      000000000000000000000000000000000000000000000000000000000000BDBD
      BD007B7B7B0000000000000000000000000000000000000000007B7B7B000000
      000000000000000000000000000000000000000000000000000000000000BDBD
      BD007B7B7B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007B7B7B007B7B
      7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B
      7B000000000000000000000000000000000000000000000000007B7B7B007B7B
      7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B
      7B0000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000300000000100010000000000800100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFFFFFC001C001FFFFFFFFC001C001
      8001E000DFF9DFF90001C000DFF9DFF94001D000DFF9DFF94001A000DFF9DF79
      4001A000DFF9DF3940014000DFF9D81940017FE0DFF9D80940010000DFF9D819
      4001A000DFF9DF397FF9A07CDFF9DF790003A081DFE1DFE180FFDF7FDFEBDFEB
      C1FFE0FFDFE7DFE7FFFFFFFFC00FC00F00000000000000000000000000000000
      000000000000}
  end
  object Help_popMenu: TPopupMenu
    Left = 569
    Top = 324
    object Content1: TMenuItem
      Caption = #20869#23481
      OnClick = Help_TBClick
    end
    object Homepage1: TMenuItem
      Caption = #20027#39029
      OnClick = Homepage1Click
    end
    object Support1: TMenuItem
      Caption = #25903#25345
      OnClick = Support1Click
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object About1: TMenuItem
      Caption = #20851#20110
      OnClick = About1Click
    end
  end
end
