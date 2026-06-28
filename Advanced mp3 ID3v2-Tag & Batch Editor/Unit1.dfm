object Form1: TForm1
  Left = 1725
  Top = 161
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Advanced mp3 Tagger'
  ClientHeight = 625
  ClientWidth = 680
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 606
    Width = 680
    Height = 19
    Panels = <
      item
        Text = 'mp3 :'
        Width = 40
      end
      item
        Width = 250
      end
      item
        Text = 'Size :'
        Width = 40
      end
      item
        Text = '0 kb'
        Width = 80
      end
      item
        Text = 'Cover :'
        Width = 50
      end
      item
        Text = '0 kb - 0x0'
        Width = 50
      end>
    ExplicitTop = 605
    ExplicitWidth = 676
  end
  object PageControl1: TPageControl
    Left = 8
    Top = 8
    Width = 665
    Height = 585
    ActivePage = TabSheet1
    TabOrder = 1
    TabStop = False
    object TabSheet1: TTabSheet
      Caption = 'File Tag'
      object Label1: TLabel
        Left = 62
        Top = 19
        Width = 22
        Height = 13
        Caption = 'File :'
      end
      object Label2: TLabel
        Left = 58
        Top = 73
        Width = 26
        Height = 13
        BiDiMode = bdLeftToRight
        Caption = 'Title :'
        ParentBiDiMode = False
      end
      object Label3: TLabel
        Left = 49
        Top = 97
        Width = 35
        Height = 13
        BiDiMode = bdLeftToRight
        Caption = 'Album :'
        ParentBiDiMode = False
      end
      object Label4: TLabel
        Left = 55
        Top = 121
        Width = 29
        Height = 13
        BiDiMode = bdLeftToRight
        Caption = 'Artist :'
        ParentBiDiMode = False
      end
      object Label5: TLabel
        Left = 49
        Top = 145
        Width = 35
        Height = 13
        BiDiMode = bdLeftToRight
        Caption = 'Genre :'
        ParentBiDiMode = False
      end
      object Label6: TLabel
        Left = 50
        Top = 169
        Width = 34
        Height = 13
        BiDiMode = bdLeftToRight
        Caption = 'Track :'
        ParentBiDiMode = False
      end
      object Label7: TLabel
        Left = 56
        Top = 193
        Width = 28
        Height = 13
        BiDiMode = bdLeftToRight
        Caption = 'Year :'
        ParentBiDiMode = False
      end
      object Label8: TLabel
        Left = 34
        Top = 218
        Width = 50
        Height = 13
        BiDiMode = bdLeftToRight
        Caption = 'Comment :'
        ParentBiDiMode = False
      end
      object Label9: TLabel
        Left = 51
        Top = 242
        Width = 33
        Height = 13
        BiDiMode = bdLeftToRight
        Caption = 'Lyrics :'
        ParentBiDiMode = False
      end
      object Label10: TLabel
        Left = 56
        Top = 266
        Width = 28
        Height = 13
        BiDiMode = bdLeftToRight
        Caption = 'URL :'
        ParentBiDiMode = False
      end
      object Label11: TLabel
        Left = 47
        Top = 290
        Width = 37
        Height = 13
        BiDiMode = bdLeftToRight
        Caption = 'Rating :'
        ParentBiDiMode = False
      end
      object Label12: TLabel
        Left = 41
        Top = 314
        Width = 43
        Height = 13
        BiDiMode = bdLeftToRight
        Caption = 'Counter :'
        ParentBiDiMode = False
      end
      object Label13: TLabel
        Left = 31
        Top = 338
        Width = 53
        Height = 13
        BiDiMode = bdLeftToRight
        Caption = 'Composer :'
        ParentBiDiMode = False
      end
      object Label14: TLabel
        Left = 239
        Top = 73
        Width = 67
        Height = 13
        Caption = 'Original Artist :'
      end
      object Label15: TLabel
        Left = 256
        Top = 97
        Width = 50
        Height = 13
        Caption = 'Copyright :'
      end
      object Label16: TLabel
        Left = 257
        Top = 121
        Width = 49
        Height = 13
        Caption = 'Encoded :'
      end
      object Label17: TLabel
        Left = 247
        Top = 145
        Width = 59
        Height = 13
        Caption = 'Languages :'
      end
      object Label18: TLabel
        Left = 258
        Top = 169
        Width = 48
        Height = 13
        Caption = 'Software :'
      end
      object Label19: TLabel
        Left = 250
        Top = 193
        Width = 56
        Height = 13
        Caption = 'Media Typ :'
      end
      object Label20: TLabel
        Left = 267
        Top = 217
        Width = 39
        Height = 13
        Caption = 'Length :'
      end
      object Label21: TLabel
        Left = 257
        Top = 241
        Width = 49
        Height = 13
        Caption = 'Publisher :'
      end
      object Label22: TLabel
        Left = 258
        Top = 265
        Width = 48
        Height = 13
        Caption = 'Filename :'
      end
      object Label23: TLabel
        Left = 268
        Top = 289
        Width = 38
        Height = 13
        Caption = 'Lyricist :'
      end
      object Label24: TLabel
        Left = 236
        Top = 313
        Width = 70
        Height = 13
        Caption = 'Release Year :'
      end
      object Label25: TLabel
        Left = 248
        Top = 337
        Width = 58
        Height = 13
        Caption = 'Album Titel :'
      end
      object Label26: TLabel
        Left = 21
        Top = 46
        Width = 63
        Height = 13
        Caption = 'Tag Version :'
      end
      object Edit1: TEdit
        Left = 88
        Top = 16
        Width = 476
        Height = 21
        TabStop = False
        TabOrder = 0
      end
      object Button1: TButton
        Left = 570
        Top = 16
        Width = 21
        Height = 21
        Caption = '...'
        TabOrder = 1
        TabStop = False
        OnClick = Button1Click
      end
      object Button2: TButton
        Left = 597
        Top = 16
        Width = 57
        Height = 21
        Caption = 'Reload'
        Enabled = False
        TabOrder = 2
        TabStop = False
        OnClick = Button2Click
      end
      object GroupBox6: TGroupBox
        Left = 453
        Top = 62
        Width = 196
        Height = 227
        Caption = ' Cover Tag '
        TabOrder = 3
        object Bevel2: TBevel
          Left = 14
          Top = 27
          Width = 171
          Height = 172
          Shape = bsFrame
        end
        object Image1: TImage
          Left = 17
          Top = 30
          Width = 165
          Height = 166
          Center = True
          PopupMenu = PopupMenu1
          Proportional = True
          Stretch = True
          OnDblClick = Image1DblClick
        end
        object Label51: TLabel
          Left = 16
          Top = 205
          Width = 9
          Height = 13
          Caption = '...'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label54: TLabel
          Left = 83
          Top = 107
          Width = 28
          Height = 13
          Caption = 'Cover'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clSilver
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
      end
      object Edit2: TEdit
        Left = 88
        Top = 70
        Width = 121
        Height = 21
        TabStop = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
      end
      object Edit3: TEdit
        Left = 88
        Top = 94
        Width = 121
        Height = 21
        TabStop = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
      end
      object Edit4: TEdit
        Left = 88
        Top = 118
        Width = 121
        Height = 21
        TabStop = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 6
      end
      object Edit5: TEdit
        Left = 88
        Top = 142
        Width = 121
        Height = 21
        TabStop = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 7
      end
      object Edit6: TEdit
        Left = 88
        Top = 166
        Width = 121
        Height = 21
        TabStop = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 8
      end
      object Edit7: TEdit
        Left = 88
        Top = 190
        Width = 121
        Height = 21
        TabStop = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 9
      end
      object Edit8: TEdit
        Left = 88
        Top = 214
        Width = 121
        Height = 21
        TabStop = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 10
      end
      object Edit9: TEdit
        Left = 88
        Top = 238
        Width = 121
        Height = 21
        TabStop = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 11
      end
      object Edit10: TEdit
        Left = 88
        Top = 262
        Width = 121
        Height = 21
        TabStop = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 12
      end
      object Edit11: TEdit
        Left = 88
        Top = 286
        Width = 121
        Height = 21
        TabStop = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 13
        OnKeyPress = Edit11KeyPress
      end
      object Edit12: TEdit
        Left = 88
        Top = 310
        Width = 121
        Height = 21
        TabStop = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 14
        OnKeyPress = Edit12KeyPress
      end
      object Edit13: TEdit
        Left = 88
        Top = 334
        Width = 121
        Height = 21
        TabStop = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 15
      end
      object Edit14: TEdit
        Left = 312
        Top = 70
        Width = 121
        Height = 21
        TabStop = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 16
      end
      object Edit15: TEdit
        Left = 312
        Top = 94
        Width = 121
        Height = 21
        TabStop = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 17
      end
      object Edit16: TEdit
        Left = 312
        Top = 118
        Width = 121
        Height = 21
        TabStop = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 18
      end
      object Edit17: TEdit
        Left = 312
        Top = 142
        Width = 121
        Height = 21
        TabStop = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 19
      end
      object Edit18: TEdit
        Left = 312
        Top = 166
        Width = 121
        Height = 21
        TabStop = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 20
      end
      object Edit19: TEdit
        Left = 312
        Top = 190
        Width = 121
        Height = 21
        TabStop = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 21
      end
      object Edit20: TEdit
        Left = 312
        Top = 214
        Width = 121
        Height = 21
        TabStop = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 22
      end
      object Edit21: TEdit
        Left = 312
        Top = 238
        Width = 121
        Height = 21
        TabStop = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 23
      end
      object Edit22: TEdit
        Left = 312
        Top = 262
        Width = 121
        Height = 21
        TabStop = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 24
      end
      object Edit23: TEdit
        Left = 312
        Top = 286
        Width = 121
        Height = 21
        TabStop = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 25
      end
      object Edit24: TEdit
        Left = 312
        Top = 310
        Width = 121
        Height = 21
        TabStop = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 26
      end
      object Edit25: TEdit
        Left = 312
        Top = 334
        Width = 121
        Height = 21
        TabStop = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 27
      end
      object CheckBox3: TCheckBox
        Left = 467
        Top = 494
        Width = 65
        Height = 17
        TabStop = False
        Caption = 'Stay Top'
        TabOrder = 28
        OnClick = CheckBox3Click
      end
      object Memo1: TMemo
        Left = 87
        Top = 370
        Width = 345
        Height = 184
        TabStop = False
        Alignment = taCenter
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = [fsBold]
        Lines.Strings = (
          ''
          'Type'
          'or'
          'Copy'
          'Song'
          'Lyrics'
          'here')
        ParentFont = False
        ScrollBars = ssVertical
        TabOrder = 29
      end
      object CheckBox4: TCheckBox
        Left = 8
        Top = 370
        Width = 73
        Height = 17
        Caption = 'Edit Lyrics :'
        TabOrder = 30
        OnClick = CheckBox4Click
      end
      object Button4: TButton
        Left = 566
        Top = 529
        Width = 75
        Height = 25
        Caption = 'Save Tag'
        TabOrder = 31
        TabStop = False
        OnClick = Button4Click
      end
      object CheckBox5: TCheckBox
        Left = 467
        Top = 392
        Width = 97
        Height = 17
        Caption = 'Intigrate Lyrics'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 32
        OnClick = CheckBox5Click
      end
      object CheckBox1: TCheckBox
        Left = 467
        Top = 335
        Width = 105
        Height = 17
        TabStop = False
        Caption = 'Save id3v2 Tags'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 33
        OnClick = CheckBox1Click
      end
      object CheckBox2: TCheckBox
        Left = 467
        Top = 358
        Width = 113
        Height = 17
        TabStop = False
        Caption = 'Save Cover Image'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 34
      end
      object RadioButton1: TRadioButton
        Left = 483
        Top = 415
        Width = 53
        Height = 17
        Caption = 'UTF-8'
        Enabled = False
        TabOrder = 35
      end
      object RadioButton2: TRadioButton
        Left = 483
        Top = 438
        Width = 49
        Height = 17
        Caption = 'Ansi'
        Enabled = False
        TabOrder = 36
      end
      object RadioButton3: TRadioButton
        Left = 551
        Top = 415
        Width = 86
        Height = 17
        Caption = 'UTF-8 Boom'
        Enabled = False
        TabOrder = 37
      end
      object RadioButton4: TRadioButton
        Left = 551
        Top = 438
        Width = 67
        Height = 17
        Caption = 'Unicode'
        Enabled = False
        TabOrder = 38
      end
      object Edit26: TEdit
        Left = 88
        Top = 43
        Width = 57
        Height = 21
        TabStop = False
        Color = clSilver
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 39
      end
      object Edit27: TEdit
        Left = 151
        Top = 43
        Width = 58
        Height = 21
        TabStop = False
        Color = clSilver
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 40
      end
      object CheckBox7: TCheckBox
        Left = 467
        Top = 312
        Width = 104
        Height = 17
        Caption = 'Save id3v1 Tags'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 41
        OnClick = CheckBox7Click
      end
      object Button3: TButton
        Left = 457
        Top = 529
        Width = 103
        Height = 25
        Caption = 'Remove all Tags'
        TabOrder = 42
        OnClick = Button3Click
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Batch Tag'
      ImageIndex = 1
      object GroupBox2: TGroupBox
        Left = 167
        Top = 0
        Width = 474
        Height = 121
        Caption = ' Options '
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object Bevel1: TBevel
          Left = 367
          Top = 16
          Width = 98
          Height = 93
          Shape = bsFrame
        end
        object Label50: TLabel
          Left = 266
          Top = 41
          Width = 53
          Height = 14
          Caption = 'into all files'
        end
        object BatchImage1: TImage
          Left = 370
          Top = 18
          Width = 92
          Height = 89
          Stretch = True
        end
        object Label48: TLabel
          Left = 402
          Top = 56
          Width = 29
          Height = 14
          Caption = 'Cover'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clSilver
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object BatchCheckBox1: TCheckBox
          Left = 27
          Top = 18
          Width = 103
          Height = 17
          TabStop = False
          Caption = 'Upper Title Case'
          TabOrder = 0
        end
        object BatchCheckBox3: TCheckBox
          Left = 27
          Top = 41
          Width = 201
          Height = 17
          TabStop = False
          Caption = 'Change Filename for all Tracks: :'
          TabOrder = 1
          OnClick = BatchCheckBox3Click
        end
        object BatchEditRename: TEdit
          Left = 50
          Top = 64
          Width = 185
          Height = 22
          TabStop = False
          Enabled = False
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clTeal
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          Text = 'Track'
        end
        object BatchButton2: TButton
          Left = 285
          Top = 82
          Width = 68
          Height = 25
          Caption = 'Image'
          Enabled = False
          TabOrder = 3
          TabStop = False
          OnClick = BatchButton2Click
        end
        object BatchCheckBox2: TCheckBox
          Left = 250
          Top = 18
          Width = 97
          Height = 17
          TabStop = False
          Caption = 'Intigrate Cover'
          TabOrder = 4
          OnClick = BatchCheckBox2Click
        end
        object CheckBox6: TCheckBox
          Left = 27
          Top = 93
          Width = 115
          Height = 17
          TabStop = False
          Caption = 'Save / Load Tags'
          TabOrder = 5
        end
      end
      object GroupBox3: TGroupBox
        Left = 167
        Top = 129
        Width = 474
        Height = 424
        Caption = ' Batch Tag  ID3v2 (Empty Boxes Import ID3v1 Automatic) '
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        object Label27: TLabel
          Left = 57
          Top = 85
          Width = 32
          Height = 14
          Caption = 'Artist :'
          Layout = tlCenter
        end
        object Label28: TLabel
          Left = 53
          Top = 56
          Width = 36
          Height = 14
          Caption = 'Album :'
          Layout = tlCenter
        end
        object Label29: TLabel
          Left = 60
          Top = 173
          Width = 29
          Height = 14
          Caption = 'Year :'
          Layout = tlCenter
        end
        object Label30: TLabel
          Left = 50
          Top = 113
          Width = 36
          Height = 14
          Caption = 'Genre :'
          Layout = tlCenter
        end
        object Label31: TLabel
          Left = 29
          Top = 202
          Width = 50
          Height = 14
          Caption = 'Comment :'
          Layout = tlCenter
        end
        object Label32: TLabel
          Left = 25
          Top = 318
          Width = 55
          Height = 14
          Caption = 'Composer :'
          Layout = tlCenter
        end
        object Label33: TLabel
          Left = 286
          Top = 86
          Width = 46
          Height = 14
          Caption = 'Encoder :'
          Layout = tlCenter
        end
        object Label34: TLabel
          Left = 280
          Top = 57
          Width = 52
          Height = 14
          Caption = 'Copyright :'
          Layout = tlCenter
        end
        object Label35: TLabel
          Left = 276
          Top = 114
          Width = 54
          Height = 14
          Caption = 'Language :'
          Layout = tlCenter
        end
        object Label36: TLabel
          Left = 61
          Top = 231
          Width = 25
          Height = 14
          Caption = 'Link :'
          Layout = tlCenter
        end
        object TitleLabel: TLabel
          Left = 61
          Top = 27
          Width = 25
          Height = 14
          Caption = 'Title :'
          Layout = tlCenter
        end
        object TrackLabel: TLabel
          Left = 18
          Top = 144
          Width = 64
          Height = 14
          Caption = 'Track Count :'
          Layout = tlCenter
        end
        object Label37: TLabel
          Left = 48
          Top = 260
          Width = 36
          Height = 14
          Caption = 'Rating :'
        end
        object Label38: TLabel
          Left = 40
          Top = 289
          Width = 44
          Height = 14
          Caption = 'Counter :'
        end
        object Label39: TLabel
          Left = 260
          Top = 28
          Width = 70
          Height = 14
          Caption = 'Original Artist :'
        end
        object Label40: TLabel
          Left = 236
          Top = 143
          Width = 94
          Height = 14
          Caption = 'Software Settings :'
        end
        object Label41: TLabel
          Left = 278
          Top = 173
          Width = 54
          Height = 14
          Caption = 'Media Typ :'
        end
        object Label42: TLabel
          Left = 294
          Top = 202
          Width = 39
          Height = 14
          Caption = 'Length :'
        end
        object Label43: TLabel
          Left = 279
          Top = 231
          Width = 50
          Height = 14
          Caption = 'Publisher :'
        end
        object Label44: TLabel
          Left = 294
          Top = 260
          Width = 41
          Height = 14
          Caption = 'Lyricist :'
        end
        object Label45: TLabel
          Left = 258
          Top = 289
          Width = 71
          Height = 14
          Caption = 'Release Year :'
        end
        object Label46: TLabel
          Left = 33
          Top = 356
          Width = 50
          Height = 14
          Caption = 'Progress :'
        end
        object Label47: TLabel
          Left = 271
          Top = 318
          Width = 58
          Height = 14
          Caption = 'Album Titel :'
        end
        object Label49: TLabel
          Left = 18
          Top = 400
          Width = 6
          Height = 14
          Caption = '0'
        end
        object BatchEdit1: TEdit
          Left = 96
          Top = 82
          Width = 129
          Height = 22
          TabStop = False
          Ctl3D = True
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 250
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 0
        end
        object BatchEdit2: TEdit
          Left = 96
          Top = 53
          Width = 129
          Height = 22
          TabStop = False
          Ctl3D = True
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 250
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 1
        end
        object BatchEdit3: TEdit
          Left = 96
          Top = 170
          Width = 129
          Height = 22
          TabStop = False
          Ctl3D = True
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 250
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 2
        end
        object BatchEdit4: TEdit
          Left = 96
          Top = 111
          Width = 129
          Height = 22
          TabStop = False
          Ctl3D = True
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 250
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 3
        end
        object BatchEdit5: TEdit
          Left = 96
          Top = 199
          Width = 129
          Height = 22
          TabStop = False
          Ctl3D = True
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 250
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 4
        end
        object BatchEdit6: TEdit
          Left = 96
          Top = 315
          Width = 129
          Height = 22
          TabStop = False
          Ctl3D = True
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 250
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 5
        end
        object BatchEdit7: TEdit
          Left = 344
          Top = 83
          Width = 121
          Height = 22
          TabStop = False
          Ctl3D = True
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 250
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 6
        end
        object BatchEdit8: TEdit
          Left = 344
          Top = 54
          Width = 121
          Height = 22
          TabStop = False
          Ctl3D = True
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 250
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 7
        end
        object BatchEdit9: TEdit
          Left = 344
          Top = 112
          Width = 121
          Height = 22
          TabStop = False
          Ctl3D = True
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 250
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 8
        end
        object BatchEdit10: TEdit
          Left = 96
          Top = 228
          Width = 129
          Height = 22
          TabStop = False
          Ctl3D = True
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 250
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 9
        end
        object BatchButton1: TButton
          Left = 342
          Top = 388
          Width = 121
          Height = 27
          Caption = 'Save Tags to Files'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 10
          TabStop = False
          OnClick = BatchButton1Click
        end
        object BatchEdit: TEdit
          Left = 96
          Top = 24
          Width = 129
          Height = 22
          TabStop = False
          Ctl3D = True
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 250
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 11
        end
        object BatchTrackEdit: TEdit
          Left = 96
          Top = 140
          Width = 129
          Height = 22
          TabStop = False
          Ctl3D = True
          Enabled = False
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 250
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 12
        end
        object BatchEdit13: TEdit
          Left = 96
          Top = 257
          Width = 129
          Height = 22
          TabStop = False
          Enabled = False
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 13
        end
        object BatchEdit14: TEdit
          Left = 96
          Top = 286
          Width = 129
          Height = 22
          TabStop = False
          Enabled = False
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 14
        end
        object BatchEdit15: TEdit
          Left = 344
          Top = 24
          Width = 121
          Height = 22
          TabStop = False
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 15
        end
        object BatchEdit16: TEdit
          Left = 344
          Top = 141
          Width = 121
          Height = 22
          TabStop = False
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 16
        end
        object ProgressBar1: TProgressBar
          Left = 96
          Top = 352
          Width = 369
          Height = 22
          TabOrder = 17
        end
        object BatchEdit17: TEdit
          Left = 344
          Top = 170
          Width = 121
          Height = 22
          TabStop = False
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 18
        end
        object BatchEdit18: TEdit
          Left = 344
          Top = 199
          Width = 121
          Height = 22
          TabStop = False
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 19
        end
        object BatchEdit19: TEdit
          Left = 344
          Top = 228
          Width = 121
          Height = 22
          TabStop = False
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 20
        end
        object BatchEdit20: TEdit
          Left = 344
          Top = 257
          Width = 121
          Height = 22
          TabStop = False
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 21
        end
        object BatchEdit21: TEdit
          Left = 344
          Top = 286
          Width = 121
          Height = 22
          TabStop = False
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 22
        end
        object BatchEdit22: TEdit
          Left = 344
          Top = 315
          Width = 121
          Height = 22
          TabStop = False
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 23
        end
        object Button5: TButton
          Left = 288
          Top = 388
          Width = 48
          Height = 25
          Caption = 'Clear'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 24
          TabStop = False
          OnClick = Button5Click
        end
      end
      object ListBox1: TListBox
        Left = 3
        Top = 44
        Width = 158
        Height = 510
        TabStop = False
        Style = lbOwnerDrawFixed
        ItemHeight = 13
        MultiSelect = True
        PopupMenu = PopupMenu2
        TabOrder = 2
        OnClick = ListBox1Click
        OnDrawItem = ListBox1DrawItem
      end
      object Button6: TButton
        Left = 3
        Top = 13
        Width = 75
        Height = 25
        Caption = 'Open'
        TabOrder = 3
        TabStop = False
        OnClick = Button6Click
      end
    end
  end
  object OpenDialog1: TOpenDialog
    Filter = 'Mp3-Dateien|*.mp3'
    Left = 48
    Top = 480
  end
  object OpenPictureDialog1: TOpenPictureDialog
    Filter = 'Alle unterst'#252'tzten Formate (*.jpg;*.jpeg;)|*.jpg;*.jpeg;'
    Left = 48
    Top = 432
  end
  object OpenDialog2: TOpenDialog
    Left = 232
    Top = 429
  end
  object PopupMenu1: TPopupMenu
    Left = 148
    Top = 432
    object Open1: TMenuItem
      Caption = 'Open'
      Enabled = False
      OnClick = Open1Click
    end
    object Remove1: TMenuItem
      Caption = 'Remove'
      Enabled = False
      OnClick = Remove1Click
    end
    object N1: TMenuItem
      Caption = '-'
      Enabled = False
    end
    object Export1: TMenuItem
      Caption = 'Export'
      Enabled = False
      OnClick = Export1Click
    end
    object Grayscale1: TMenuItem
      AutoCheck = True
      Caption = 'Grayscale'
      Enabled = False
      OnClick = Grayscale1Click
    end
    object Invert1: TMenuItem
      AutoCheck = True
      Caption = 'Invert'
      Enabled = False
      OnClick = Invert1Click
    end
    object N2: TMenuItem
      Caption = '-'
      Enabled = False
    end
    object SetOptimalSize1: TMenuItem
      Caption = 'Set Optimal Size'
      Enabled = False
      OnClick = SetOptimalSize1Click
    end
  end
  object SaveDialog1: TSaveDialog
    Filter = 'Jpg / Jpeg (*.jpg)|*.jpg'
    Left = 148
    Top = 496
  end
  object PopupMenu2: TPopupMenu
    Left = 219
    Top = 497
    object Clear1: TMenuItem
      Caption = 'Clear'
      OnClick = Clear1Click
    end
    object Remove2: TMenuItem
      Caption = 'Remove'
      OnClick = Remove2Click
    end
  end
end
