object HeaderImgForm: THeaderImgForm
  Left = 918
  Top = 238
  Caption = 'SaveConfig'
  ClientHeight = 692
  ClientWidth = 406
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 64
    Width = 52
    Height = 13
    Caption = 'Comments:'
  end
  object Label2: TLabel
    Left = 272
    Top = 16
    Width = 18
    Height = 13
    Caption = '512'
  end
  object Button1: TButton
    Left = 8
    Top = 8
    Width = 81
    Height = 25
    Caption = 'Make Header'
    TabOrder = 0
    OnClick = Button1Click
  end
  object RadioGroup1: TRadioGroup
    Left = 96
    Top = 8
    Width = 81
    Height = 49
    Caption = 'Image'
    ItemIndex = 0
    Items.Strings = (
      'Forth'
      'Back')
    TabOrder = 1
  end
  object RadioGroup2: TRadioGroup
    Left = 184
    Top = 8
    Width = 81
    Height = 65
    Caption = 'Type'
    ItemIndex = 0
    Items.Strings = (
      'Z'
      'Current'
      'Other')
    TabOrder = 2
  end
  object RichEdit1: TRichEdit
    Left = 8
    Top = 112
    Width = 257
    Height = 385
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Lines.Strings = (
      'RichEdit1')
    ParentFont = False
    TabOrder = 3
    Zoom = 100
  end
  object Edit1: TEdit
    Left = 8
    Top = 80
    Width = 257
    Height = 21
    MaxLength = 20
    TabOrder = 4
    Text = 'T=0K,H=0T,'
  end
end
