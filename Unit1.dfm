object Form1: TForm1
  Left = 1725
  Top = 161
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Advanced mp3 Tagger'
  ClientHeight = 619
  ClientWidth = 719
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
    Top = 600
    Width = 719
    Height = 19
    Panels = <>
    SimplePanel = True
    ExplicitTop = 599
    ExplicitWidth = 715
  end
  object PageControl1: TPageControl
    Left = 8
    Top = 8
    Width = 705
    Height = 585
    ActivePage = TabSheet1
    TabOrder = 1
    TabStop = False
    object TabSheet1: TTabSheet
      Caption = 'File Tag'
      object Label1: TLabel
        Left = 58
        Top = 18
        Width = 22
        Height = 13
        Caption = 'File :'
      end
      object Label2: TLabel
        Left = 56
        Top = 68
        Width = 26
        Height = 13
        BiDiMode = bdLeftToRight
        Caption = 'Title :'
        ParentBiDiMode = False
      end
      object Label3: TLabel
        Left = 48
        Top = 92
        Width = 35
        Height = 13
        BiDiMode = bdLeftToRight
        Caption = 'Album :'
        ParentBiDiMode = False
      end
      object Label4: TLabel
        Left = 52
        Top = 116
        Width = 29
        Height = 13
        BiDiMode = bdLeftToRight
        Caption = 'Artist :'
        ParentBiDiMode = False
      end
      object Label5: TLabel
        Left = 46
        Top = 140
        Width = 35
        Height = 13
        BiDiMode = bdLeftToRight
        Caption = 'Genre :'
        ParentBiDiMode = False
      end
      object Label6: TLabel
        Left = 47
        Top = 164
        Width = 34
        Height = 13
        BiDiMode = bdLeftToRight
        Caption = 'Track :'
        ParentBiDiMode = False
      end
      object Label7: TLabel
        Left = 52
        Top = 188
        Width = 28
        Height = 13
        BiDiMode = bdLeftToRight
        Caption = 'Year :'
        ParentBiDiMode = False
      end
      object Label8: TLabel
        Left = 33
        Top = 212
        Width = 50
        Height = 13
        BiDiMode = bdLeftToRight
        Caption = 'Comment :'
        ParentBiDiMode = False
      end
      object Label9: TLabel
        Left = 48
        Top = 236
        Width = 33
        Height = 13
        BiDiMode = bdLeftToRight
        Caption = 'Lyrics :'
        ParentBiDiMode = False
      end
      object Label10: TLabel
        Left = 52
        Top = 260
        Width = 28
        Height = 13
        BiDiMode = bdLeftToRight
        Caption = 'URL :'
        ParentBiDiMode = False
      end
      object Label11: TLabel
        Left = 43
        Top = 284
        Width = 37
        Height = 13
        BiDiMode = bdLeftToRight
        Caption = 'Rating :'
        ParentBiDiMode = False
      end
      object Label12: TLabel
        Left = 39
        Top = 308
        Width = 43
        Height = 13
        BiDiMode = bdLeftToRight
        Caption = 'Counter :'
        ParentBiDiMode = False
      end
      object Label13: TLabel
        Left = 29
        Top = 332
        Width = 53
        Height = 13
        BiDiMode = bdLeftToRight
        Caption = 'Composer :'
        ParentBiDiMode = False
      end
      object Label14: TLabel
        Left = 240
        Top = 68
        Width = 67
        Height = 13
        Caption = 'Original Artist :'
      end
      object Label15: TLabel
        Left = 256
        Top = 92
        Width = 50
        Height = 13
        Caption = 'Copyright :'
      end
      object Label16: TLabel
        Left = 256
        Top = 116
        Width = 49
        Height = 13
        Caption = 'Encoded :'
      end
      object Label17: TLabel
        Left = 248
        Top = 140
        Width = 59
        Height = 13
        Caption = 'Languages :'
      end
      object Label18: TLabel
        Left = 256
        Top = 164
        Width = 48
        Height = 13
        Caption = 'Software :'
      end
      object Label19: TLabel
        Left = 248
        Top = 188
        Width = 56
        Height = 13
        Caption = 'Media Typ :'
      end
      object Label20: TLabel
        Left = 264
        Top = 212
        Width = 39
        Height = 13
        Caption = 'Length :'
      end
      object Label21: TLabel
        Left = 256
        Top = 236
        Width = 49
        Height = 13
        Caption = 'Publisher :'
      end
      object Label22: TLabel
        Left = 256
        Top = 260
        Width = 48
        Height = 13
        Caption = 'Filename :'
      end
      object Label23: TLabel
        Left = 264
        Top = 284
        Width = 38
        Height = 13
        Caption = 'Lyricist :'
      end
      object Label24: TLabel
        Left = 232
        Top = 308
        Width = 70
        Height = 13
        Caption = 'Release Year :'
      end
      object Label25: TLabel
        Left = 248
        Top = 332
        Width = 58
        Height = 13
        Caption = 'Album Titel :'
      end
      object Label26: TLabel
        Left = 88
        Top = 48
        Width = 59
        Height = 13
        Caption = 'id3v2 Tags :'
      end
      object Edit1: TEdit
        Left = 88
        Top = 16
        Width = 519
        Height = 21
        TabStop = False
        TabOrder = 0
      end
      object Button1: TButton
        Left = 613
        Top = 15
        Width = 21
        Height = 21
        Caption = '...'
        TabOrder = 1
        TabStop = False
        OnClick = Button1Click
      end
      object Button2: TButton
        Left = 637
        Top = 15
        Width = 57
        Height = 21
        Caption = 'Reload'
        TabOrder = 2
        TabStop = False
        OnClick = Button2Click
      end
      object GroupBox6: TGroupBox
        Left = 448
        Top = 56
        Width = 246
        Height = 293
        Caption = ' Cover Tag '
        TabOrder = 3
        object Image1: TImage
          Left = 32
          Top = 36
          Width = 177
          Height = 173
          Center = True
          Proportional = True
          Stretch = True
        end
        object Bevel2: TBevel
          Left = 30
          Top = 33
          Width = 181
          Height = 178
          Shape = bsFrame
        end
        object Button3: TButton
          Left = 139
          Top = 225
          Width = 75
          Height = 21
          Caption = 'Image'
          TabOrder = 0
          TabStop = False
          OnClick = Button3Click
        end
      end
      object Edit2: TEdit
        Left = 88
        Top = 64
        Width = 121
        Height = 21
        TabOrder = 4
      end
      object Edit3: TEdit
        Left = 88
        Top = 88
        Width = 121
        Height = 21
        TabOrder = 5
      end
      object Edit4: TEdit
        Left = 88
        Top = 112
        Width = 121
        Height = 21
        TabOrder = 6
      end
      object Edit5: TEdit
        Left = 88
        Top = 136
        Width = 121
        Height = 21
        TabOrder = 7
      end
      object Edit6: TEdit
        Left = 88
        Top = 160
        Width = 121
        Height = 21
        TabOrder = 8
      end
      object Edit7: TEdit
        Left = 88
        Top = 184
        Width = 121
        Height = 21
        TabOrder = 9
      end
      object Edit8: TEdit
        Left = 88
        Top = 208
        Width = 121
        Height = 21
        TabOrder = 10
      end
      object Edit9: TEdit
        Left = 88
        Top = 232
        Width = 121
        Height = 21
        TabOrder = 11
      end
      object Edit10: TEdit
        Left = 88
        Top = 256
        Width = 121
        Height = 21
        TabOrder = 12
      end
      object Edit11: TEdit
        Left = 88
        Top = 280
        Width = 121
        Height = 21
        TabOrder = 13
        OnKeyPress = Edit11KeyPress
      end
      object Edit12: TEdit
        Left = 88
        Top = 304
        Width = 121
        Height = 21
        TabOrder = 14
        OnKeyPress = Edit12KeyPress
      end
      object Edit13: TEdit
        Left = 88
        Top = 328
        Width = 121
        Height = 21
        TabOrder = 15
      end
      object Edit14: TEdit
        Left = 312
        Top = 64
        Width = 121
        Height = 21
        TabStop = False
        TabOrder = 16
      end
      object Edit15: TEdit
        Left = 312
        Top = 88
        Width = 121
        Height = 21
        TabStop = False
        TabOrder = 17
      end
      object Edit16: TEdit
        Left = 312
        Top = 112
        Width = 121
        Height = 21
        TabStop = False
        TabOrder = 18
      end
      object Edit17: TEdit
        Left = 312
        Top = 136
        Width = 121
        Height = 21
        TabStop = False
        TabOrder = 19
      end
      object Edit18: TEdit
        Left = 312
        Top = 160
        Width = 121
        Height = 21
        TabStop = False
        TabOrder = 20
      end
      object Edit19: TEdit
        Left = 312
        Top = 184
        Width = 121
        Height = 21
        TabStop = False
        TabOrder = 21
      end
      object Edit20: TEdit
        Left = 312
        Top = 208
        Width = 121
        Height = 21
        TabStop = False
        TabOrder = 22
      end
      object Edit21: TEdit
        Left = 312
        Top = 232
        Width = 121
        Height = 21
        TabStop = False
        TabOrder = 23
      end
      object Edit22: TEdit
        Left = 312
        Top = 256
        Width = 121
        Height = 21
        TabStop = False
        TabOrder = 24
      end
      object Edit23: TEdit
        Left = 312
        Top = 280
        Width = 121
        Height = 21
        TabStop = False
        TabOrder = 25
      end
      object Edit24: TEdit
        Left = 312
        Top = 304
        Width = 121
        Height = 21
        TabStop = False
        TabOrder = 26
      end
      object Edit25: TEdit
        Left = 312
        Top = 328
        Width = 121
        Height = 21
        TabStop = False
        TabOrder = 27
      end
      object CheckBox3: TCheckBox
        Left = 464
        Top = 463
        Width = 65
        Height = 17
        TabStop = False
        Caption = 'Stay Top'
        TabOrder = 28
        OnClick = CheckBox3Click
      end
      object Memo1: TMemo
        Left = 87
        Top = 360
        Width = 345
        Height = 194
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
          ''
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
        Top = 364
        Width = 73
        Height = 17
        Caption = 'Edit Lyrics :'
        TabOrder = 30
        OnClick = CheckBox4Click
      end
      object Button4: TButton
        Left = 462
        Top = 528
        Width = 232
        Height = 26
        Caption = 'Save Tag'
        TabOrder = 31
        TabStop = False
        OnClick = Button4Click
      end
      object CheckBox5: TCheckBox
        Left = 464
        Top = 392
        Width = 97
        Height = 17
        Caption = 'Intigrate Lyrics'
        TabOrder = 32
        OnClick = CheckBox5Click
      end
      object CheckBox1: TCheckBox
        Left = 464
        Top = 369
        Width = 105
        Height = 17
        TabStop = False
        Caption = 'Save id3v2 Tags'
        Checked = True
        State = cbChecked
        TabOrder = 33
        OnClick = CheckBox1Click
      end
      object CheckBox2: TCheckBox
        Left = 464
        Top = 486
        Width = 113
        Height = 17
        TabStop = False
        Caption = 'Save Cover Image'
        Checked = True
        State = cbChecked
        TabOrder = 34
        OnClick = CheckBox2Click
      end
      object RadioButton1: TRadioButton
        Left = 480
        Top = 415
        Width = 53
        Height = 17
        Caption = 'UTF-8'
        Enabled = False
        TabOrder = 35
      end
      object RadioButton2: TRadioButton
        Left = 480
        Top = 438
        Width = 49
        Height = 17
        Caption = 'Ansi'
        Enabled = False
        TabOrder = 36
      end
      object RadioButton3: TRadioButton
        Left = 587
        Top = 415
        Width = 86
        Height = 17
        Caption = 'UTF-8 Boom'
        Enabled = False
        TabOrder = 37
      end
      object RadioButton4: TRadioButton
        Left = 587
        Top = 438
        Width = 67
        Height = 17
        Caption = 'Unicode'
        Enabled = False
        TabOrder = 38
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Batch Tag'
      ImageIndex = 1
      object DriveList: TDriveComboBox
        Left = 3
        Top = 8
        Width = 195
        Height = 21
        DirList = DirectoryListBox1
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        TabStop = False
        TextCase = tcUpperCase
      end
      object DirectoryListBox1: TDirectoryListBox
        Left = 3
        Top = 35
        Width = 195
        Height = 235
        TabStop = False
        FileList = FileList
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
      object FileList: TFileListBox
        Left = 3
        Top = 278
        Width = 195
        Height = 275
        TabStop = False
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ItemHeight = 15
        Mask = '*.mp?;*.ape;*.aac;*.flac;'
        ParentFont = False
        TabOrder = 2
        OnChange = FileListChange
      end
      object GroupBox2: TGroupBox
        Left = 215
        Top = 2
        Width = 474
        Height = 121
        Caption = ' Options '
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        object BatchImage1: TImage
          Left = 369
          Top = 18
          Width = 89
          Height = 89
          Stretch = True
        end
        object Bevel1: TBevel
          Left = 367
          Top = 16
          Width = 93
          Height = 93
          Shape = bsFrame
        end
        object Label50: TLabel
          Left = 266
          Top = 41
          Width = 62
          Height = 15
          Caption = 'into all files'
        end
        object BatchCheckBox1: TCheckBox
          Left = 27
          Top = 18
          Width = 113
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
          Height = 23
          TabStop = False
          Enabled = False
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
        Left = 215
        Top = 129
        Width = 474
        Height = 424
        Caption = ' Batch Tag  ID3v2 (Empty Boxes Import ID3v1 Automatic) '
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        object Label27: TLabel
          Left = 57
          Top = 85
          Width = 33
          Height = 15
          Caption = 'Artist :'
          Layout = tlCenter
        end
        object Label28: TLabel
          Left = 53
          Top = 56
          Width = 41
          Height = 15
          Caption = 'Album :'
          Layout = tlCenter
        end
        object Label29: TLabel
          Left = 60
          Top = 173
          Width = 30
          Height = 15
          Caption = 'Year :'
          Layout = tlCenter
        end
        object Label30: TLabel
          Left = 50
          Top = 113
          Width = 40
          Height = 15
          Caption = 'Genre :'
          Layout = tlCenter
        end
        object Label31: TLabel
          Left = 29
          Top = 202
          Width = 61
          Height = 15
          Caption = 'Comment :'
          Layout = tlCenter
        end
        object Label32: TLabel
          Left = 25
          Top = 318
          Width = 65
          Height = 15
          Caption = 'Composer :'
          Layout = tlCenter
        end
        object Label33: TLabel
          Left = 286
          Top = 86
          Width = 52
          Height = 15
          Caption = 'Encoder :'
          Layout = tlCenter
        end
        object Label34: TLabel
          Left = 280
          Top = 57
          Width = 58
          Height = 15
          Caption = 'Copyright :'
          Layout = tlCenter
        end
        object Label35: TLabel
          Left = 276
          Top = 114
          Width = 62
          Height = 15
          Caption = 'Language :'
          Layout = tlCenter
        end
        object Label36: TLabel
          Left = 61
          Top = 231
          Width = 29
          Height = 15
          Caption = 'Link :'
          Layout = tlCenter
        end
        object TitleLabel: TLabel
          Left = 61
          Top = 27
          Width = 29
          Height = 15
          Caption = 'Title :'
          Layout = tlCenter
        end
        object TrackLabel: TLabel
          Left = 18
          Top = 144
          Width = 72
          Height = 15
          Caption = 'Track Count :'
          Layout = tlCenter
        end
        object Label37: TLabel
          Left = 48
          Top = 260
          Width = 42
          Height = 15
          Caption = 'Rating :'
        end
        object Label38: TLabel
          Left = 40
          Top = 289
          Width = 50
          Height = 15
          Caption = 'Counter :'
        end
        object Label39: TLabel
          Left = 260
          Top = 28
          Width = 78
          Height = 15
          Caption = 'Original Artist :'
        end
        object Label40: TLabel
          Left = 236
          Top = 143
          Width = 102
          Height = 15
          Caption = 'Software Settings :'
        end
        object Label41: TLabel
          Left = 278
          Top = 173
          Width = 60
          Height = 15
          Caption = 'Media Typ :'
        end
        object Label42: TLabel
          Left = 294
          Top = 202
          Width = 44
          Height = 15
          Caption = 'Length :'
        end
        object Label43: TLabel
          Left = 279
          Top = 231
          Width = 59
          Height = 15
          Caption = 'Publisher :'
        end
        object Label44: TLabel
          Left = 294
          Top = 260
          Width = 44
          Height = 15
          Caption = 'Lyricist :'
        end
        object Label45: TLabel
          Left = 258
          Top = 289
          Width = 80
          Height = 15
          Caption = 'Release Year :'
        end
        object Label46: TLabel
          Left = 33
          Top = 356
          Width = 57
          Height = 15
          Caption = 'Progress :'
        end
        object Label47: TLabel
          Left = 271
          Top = 318
          Width = 67
          Height = 15
          Caption = 'Album Titel :'
        end
        object Label48: TLabel
          Left = 64
          Top = 392
          Width = 26
          Height = 15
          Caption = 'File :'
        end
        object Label49: TLabel
          Left = 96
          Top = 392
          Width = 6
          Height = 15
          Caption = '..'
        end
        object BatchEdit1: TEdit
          Left = 96
          Top = 82
          Width = 129
          Height = 23
          TabStop = False
          Ctl3D = True
          MaxLength = 250
          ParentCtl3D = False
          TabOrder = 0
        end
        object BatchEdit2: TEdit
          Left = 96
          Top = 53
          Width = 129
          Height = 23
          TabStop = False
          Ctl3D = True
          MaxLength = 250
          ParentCtl3D = False
          TabOrder = 1
        end
        object BatchEdit3: TEdit
          Left = 96
          Top = 170
          Width = 129
          Height = 23
          TabStop = False
          Ctl3D = True
          MaxLength = 250
          ParentCtl3D = False
          TabOrder = 2
        end
        object BatchEdit4: TEdit
          Left = 96
          Top = 111
          Width = 129
          Height = 23
          TabStop = False
          Ctl3D = True
          MaxLength = 250
          ParentCtl3D = False
          TabOrder = 3
        end
        object BatchEdit5: TEdit
          Left = 96
          Top = 199
          Width = 129
          Height = 23
          TabStop = False
          Ctl3D = True
          MaxLength = 250
          ParentCtl3D = False
          TabOrder = 4
        end
        object BatchEdit6: TEdit
          Left = 96
          Top = 315
          Width = 129
          Height = 23
          TabStop = False
          Ctl3D = True
          MaxLength = 250
          ParentCtl3D = False
          TabOrder = 5
        end
        object BatchEdit7: TEdit
          Left = 344
          Top = 83
          Width = 121
          Height = 23
          TabStop = False
          Ctl3D = True
          MaxLength = 250
          ParentCtl3D = False
          TabOrder = 6
        end
        object BatchEdit8: TEdit
          Left = 344
          Top = 54
          Width = 121
          Height = 23
          TabStop = False
          Ctl3D = True
          MaxLength = 250
          ParentCtl3D = False
          TabOrder = 7
        end
        object BatchEdit9: TEdit
          Left = 344
          Top = 112
          Width = 121
          Height = 23
          TabStop = False
          Ctl3D = True
          MaxLength = 250
          ParentCtl3D = False
          TabOrder = 8
        end
        object BatchEdit10: TEdit
          Left = 96
          Top = 228
          Width = 129
          Height = 23
          TabStop = False
          Ctl3D = True
          MaxLength = 250
          ParentCtl3D = False
          TabOrder = 9
        end
        object BatchButton1: TButton
          Left = 342
          Top = 388
          Width = 121
          Height = 27
          Caption = 'Save Tags to Files'
          TabOrder = 10
          TabStop = False
          OnClick = BatchButton1Click
        end
        object BatchEdit: TEdit
          Left = 96
          Top = 24
          Width = 129
          Height = 23
          TabStop = False
          Ctl3D = True
          MaxLength = 250
          ParentCtl3D = False
          TabOrder = 11
        end
        object BatchTrackEdit: TEdit
          Left = 96
          Top = 140
          Width = 129
          Height = 23
          TabStop = False
          Ctl3D = True
          Enabled = False
          MaxLength = 250
          ParentCtl3D = False
          TabOrder = 12
        end
        object BatchEdit13: TEdit
          Left = 96
          Top = 257
          Width = 129
          Height = 23
          TabStop = False
          Enabled = False
          TabOrder = 13
        end
        object BatchEdit14: TEdit
          Left = 96
          Top = 286
          Width = 129
          Height = 23
          TabStop = False
          Enabled = False
          TabOrder = 14
        end
        object BatchEdit15: TEdit
          Left = 344
          Top = 24
          Width = 121
          Height = 23
          TabStop = False
          TabOrder = 15
        end
        object BatchEdit16: TEdit
          Left = 344
          Top = 141
          Width = 121
          Height = 23
          TabStop = False
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
          Height = 23
          TabStop = False
          TabOrder = 18
        end
        object BatchEdit18: TEdit
          Left = 344
          Top = 199
          Width = 121
          Height = 23
          TabStop = False
          TabOrder = 19
        end
        object BatchEdit19: TEdit
          Left = 344
          Top = 228
          Width = 121
          Height = 23
          TabStop = False
          TabOrder = 20
        end
        object BatchEdit20: TEdit
          Left = 344
          Top = 257
          Width = 121
          Height = 23
          TabStop = False
          TabOrder = 21
        end
        object BatchEdit21: TEdit
          Left = 344
          Top = 286
          Width = 121
          Height = 23
          TabStop = False
          TabOrder = 22
        end
        object BatchEdit22: TEdit
          Left = 344
          Top = 315
          Width = 121
          Height = 23
          TabStop = False
          TabOrder = 23
        end
        object Button5: TButton
          Left = 288
          Top = 388
          Width = 48
          Height = 25
          Caption = 'Clear'
          TabOrder = 24
          TabStop = False
          OnClick = Button5Click
        end
      end
    end
  end
  object OpenDialog1: TOpenDialog
    Filter = 'Mp3-Dateien|*.mp3'
    Left = 120
    Top = 464
  end
  object OpenPictureDialog1: TOpenPictureDialog
    Filter = 'Alle unterst'#252'tzten Formate (*.jpg;*.jpeg;)|*.jpg;*.jpeg;'
    Left = 120
    Top = 400
  end
  object OpenDialog2: TOpenDialog
    Left = 120
    Top = 533
  end
end
