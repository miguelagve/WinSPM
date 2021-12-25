object ScanningForm: TScanningForm
  Left = 237
  Top = 272
  Caption = 'Scanning'
  ClientHeight = 600
  ClientWidth = 973
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 264
    Width = 55
    Height = 13
    Caption = 'Delete after'
  end
  object Label4: TLabel
    Left = 16
    Top = 248
    Width = 6
    Height = 13
    Caption = '1'
  end
  object Label5: TLabel
    Left = 56
    Top = 248
    Width = 18
    Height = 13
    Caption = '100'
  end
  object Label2: TLabel
    Left = 48
    Top = 130
    Width = 25
    Height = 13
    Caption = 'Jump'
  end
  object Label3: TLabel
    Left = 8
    Top = 130
    Width = 27
    Height = 13
    Caption = 'Mean'
  end
  object Label6: TLabel
    Left = 128
    Top = 576
    Width = 6
    Height = 13
    Caption = '0'
  end
  object lblZoom: TLabel
    Left = 700
    Top = 551
    Width = 39
    Height = 13
    Caption = 'Contrast'
  end
  object lblOffset: TLabel
    Left = 700
    Top = 578
    Width = 49
    Height = 13
    Caption = 'Brightness'
  end
  object ScrollBox1: TScrollBox
    Left = 696
    Top = 8
    Width = 273
    Height = 265
    TabOrder = 0
    object PaintBox1: TPaintBox
      Left = 4
      Top = 4
      Width = 256
      Height = 256
      Color = clNavy
      ParentColor = False
    end
  end
  object ScrollBox2: TScrollBox
    Left = 696
    Top = 272
    Width = 273
    Height = 273
    TabOrder = 1
    object PaintBox2: TPaintBox
      Left = 4
      Top = 12
      Width = 256
      Height = 256
      Color = clNavy
      ParentColor = False
    end
  end
  object Button1: TButton
    Left = 6
    Top = 40
    Width = 75
    Height = 25
    Caption = 'STOP'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnClick = Button1Click
  end
  object RadioGroup1: TRadioGroup
    Left = 15
    Top = 312
    Width = 73
    Height = 57
    Caption = 'Show'
    ItemIndex = 0
    Items.Strings = (
      'Topo'
      'Current')
    TabOrder = 3
  end
  object SpinEdit1: TSpinEdit
    Left = 15
    Top = 280
    Width = 41
    Height = 22
    MaxValue = 100
    MinValue = 0
    TabOrder = 4
    Value = 2
  end
  object Button2: TButton
    Left = 6
    Top = 72
    Width = 75
    Height = 25
    Caption = 'PAUSE'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 19
    Top = 376
    Width = 65
    Height = 25
    Caption = 'IN'
    TabOrder = 6
    Visible = False
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 19
    Top = 405
    Width = 65
    Height = 25
    Caption = 'OUT'
    TabOrder = 7
    Visible = False
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 19
    Top = 443
    Width = 65
    Height = 25
    Caption = 'UP'
    TabOrder = 8
    Visible = False
    OnClick = Button5Click
  end
  object Button6: TButton
    Left = 19
    Top = 472
    Width = 65
    Height = 25
    Caption = 'DOWN'
    TabOrder = 9
    Visible = False
    OnClick = Button6Click
  end
  object Button7: TButton
    Left = 18
    Top = 512
    Width = 66
    Height = 25
    Caption = 'RESET'
    TabOrder = 10
    Visible = False
    OnClick = Button7Click
  end
  object TrackBar1: TTrackBar
    Left = 8
    Top = 143
    Width = 33
    Height = 106
    Max = 100
    Min = 1
    Orientation = trVertical
    Frequency = 10
    Position = 1
    SelEnd = 100
    SelStart = 1
    TabOrder = 11
    TickStyle = tsNone
    OnChange = TrackBar1Change
  end
  object TrackBar2: TTrackBar
    Left = 48
    Top = 143
    Width = 33
    Height = 106
    Max = 100
    Min = 1
    Orientation = trVertical
    Frequency = 10
    Position = 2
    SelEnd = 100
    SelStart = 1
    TabOrder = 12
    TickStyle = tsNone
    OnChange = TrackBar2Change
  end
  object CheckBox1: TCheckBox
    Left = 7
    Top = 104
    Width = 73
    Height = 17
    Caption = 'Scan Loop'
    TabOrder = 14
  end
  object CheckBox2: TCheckBox
    Left = 552
    Top = 576
    Width = 137
    Height = 17
    Caption = 'Separate when finished'
    TabOrder = 13
  end
  object ChartLine: TChart
    Left = 84
    Top = 8
    Width = 609
    Height = 561
    AllowPanning = pmVertical
    BackWall.Brush.Style = bsClear
    Legend.Visible = False
    Title.Font.Color = clBlack
    Title.Font.Style = [fsBold, fsItalic]
    Title.Text.Strings = (
      'Result of Scan')
    BottomAxis.Automatic = False
    BottomAxis.AutomaticMaximum = False
    BottomAxis.AutomaticMinimum = False
    BottomAxis.Maximum = 25.000000000000000000
    DepthAxis.Automatic = False
    DepthAxis.AutomaticMaximum = False
    DepthAxis.AutomaticMinimum = False
    DepthAxis.Maximum = 2.500000000000000000
    DepthAxis.Minimum = -0.500000000000000000
    RightAxis.Automatic = False
    RightAxis.AutomaticMaximum = False
    RightAxis.AutomaticMinimum = False
    TopAxis.Automatic = False
    TopAxis.AutomaticMaximum = False
    TopAxis.AutomaticMinimum = False
    View3D = False
    Zoom.Animated = True
    Color = clWhite
    TabOrder = 15
    DefaultCanvas = 'TGDIPlusCanvas'
    ColorPaletteIndex = 13
  end
  object chkFlatten: TCheckBox
    Left = 16
    Top = 376
    Width = 61
    Height = 17
    Caption = 'Flatten'
    Checked = True
    State = cbChecked
    TabOrder = 16
  end
  object CheckBox3: TCheckBox
    Left = 208
    Top = 576
    Width = 145
    Height = 17
    Caption = 'Show remaining time'
    TabOrder = 17
  end
  object trckbrZoom: TTrackBar
    Left = 752
    Top = 549
    Width = 177
    Height = 20
    Max = 100
    Min = 1
    PageSize = 10
    Position = 1
    SelEnd = 100
    SelStart = 1
    TabOrder = 18
    TickStyle = tsNone
    OnChange = trckbrZoomChange
  end
  object trckbrOffset: TTrackBar
    Left = 752
    Top = 576
    Width = 177
    Height = 20
    Max = 100
    Min = -100
    PageSize = 10
    SelEnd = 100
    SelStart = -100
    TabOrder = 19
    TickStyle = tsNone
    OnChange = trckbrOffsetChange
  end
  object btnResetZoomOffset: TButton
    Left = 928
    Top = 552
    Width = 41
    Height = 41
    Caption = 'Reset'
    TabOrder = 20
    OnClick = btnResetZoomOffsetClick
  end
end
