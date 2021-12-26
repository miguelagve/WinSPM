object ConfigForm: TConfigForm
  Left = 119
  Top = 228
  Caption = 'WinSPMConfig'
  ClientHeight = 330
  ClientWidth = 400
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 16
    Top = 8
    Width = 370
    Height = 145
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 4
      Width = 25
      Height = 13
      Caption = 'Scan'
    end
    object Label2: TLabel
      Left = 8
      Top = 24
      Width = 7
      Height = 13
      Caption = 'X'
    end
    object Label3: TLabel
      Left = 8
      Top = 44
      Width = 7
      Height = 13
      Caption = 'Y'
    end
    object Label4: TLabel
      Left = 24
      Top = 24
      Width = 22
      Height = 13
      Caption = 'DAC'
    end
    object Label5: TLabel
      Left = 24
      Top = 44
      Width = 22
      Height = 13
      Caption = 'DAC'
    end
    object Label6: TLabel
      Left = 200
      Top = 20
      Width = 90
      Height = 13
      Caption = 'Calibration (nm/V)'
    end
    object Label7: TLabel
      Left = 104
      Top = 20
      Width = 42
      Height = 13
      Caption = 'Amplifier'
    end
    object Label10: TLabel
      Left = 104
      Top = 44
      Width = 39
      Height = 13
      Caption = 'Amplifier'
    end
    object Label11: TLabel
      Left = 200
      Top = 44
      Width = 90
      Height = 13
      Caption = 'Calibration (nm/V)'
      Color = clBtnFace
      ParentColor = False
    end
    object Label19: TLabel
      Left = 8
      Top = 75
      Width = 37
      Height = 13
      Caption = 'Position'
    end
    object Label20: TLabel
      Left = 8
      Top = 94
      Width = 32
      Height = 13
      Caption = 'X DAC'
    end
    object Label21: TLabel
      Left = 8
      Top = 118
      Width = 32
      Height = 13
      Caption = 'Y DAC'
    end
    object Label25: TLabel
      Left = 104
      Top = 94
      Width = 39
      Height = 13
      Caption = 'Amplifier'
    end
    object Label26: TLabel
      Left = 104
      Top = 118
      Width = 39
      Height = 13
      Caption = 'Amplifier'
    end
    object SpinEdit1: TSpinEdit
      Left = 56
      Top = 16
      Width = 33
      Height = 22
      MaxValue = 7
      MinValue = 0
      TabOrder = 0
      Value = 0
    end
    object SpinEdit2: TSpinEdit
      Left = 56
      Top = 40
      Width = 33
      Height = 22
      MaxValue = 7
      MinValue = 0
      TabOrder = 3
      Value = 2
    end
    object Edit1: TEdit
      Left = 296
      Top = 16
      Width = 41
      Height = 21
      Alignment = taCenter
      TabOrder = 2
      Text = '5'
    end
    object ComboBox1: TComboBox
      Left = 152
      Top = 16
      Width = 41
      Height = 21
      TabOrder = 1
      Text = '13'
      Items.Strings = (
        '13'
        '1.3')
    end
    object SpinEdit6: TSpinEdit
      Left = 56
      Top = 90
      Width = 33
      Height = 22
      MaxValue = 7
      MinValue = 0
      TabOrder = 7
      Value = 1
    end
    object SpinEdit7: TSpinEdit
      Left = 56
      Top = 114
      Width = 33
      Height = 22
      MaxValue = 7
      MinValue = 0
      TabOrder = 9
      Value = 3
    end
    object chkAttenuator: TCheckBox
      Left = 104
      Top = 67
      Width = 105
      Height = 13
      Caption = 'Scan attenuator'
      TabOrder = 6
    end
    object ComboBox6: TComboBox
      Left = 152
      Top = 90
      Width = 41
      Height = 21
      TabOrder = 8
      Text = '13'
      Items.Strings = (
        '13'
        '1.3')
    end
    object ComboBox7: TComboBox
      Left = 152
      Top = 114
      Width = 41
      Height = 21
      TabOrder = 10
      Text = '13'
      Items.Strings = (
        '13'
        '1.3')
    end
    object ComboBox2: TComboBox
      Left = 152
      Top = 40
      Width = 41
      Height = 21
      TabOrder = 4
      Text = '13'
      Items.Strings = (
        '13'
        '1.3')
    end
    object Edit2: TEdit
      Left = 296
      Top = 40
      Width = 41
      Height = 21
      Alignment = taCenter
      TabOrder = 5
      Text = '5'
    end
  end
  object Panel2: TPanel
    Left = 16
    Top = 160
    Width = 370
    Height = 161
    TabOrder = 1
    object Label12: TLabel
      Left = 8
      Top = 6
      Width = 26
      Height = 13
      Caption = 'Read'
    end
    object Label14: TLabel
      Left = 66
      Top = 28
      Width = 22
      Height = 13
      Caption = 'ADC'
    end
    object Label15: TLabel
      Left = 146
      Top = 28
      Width = 39
      Height = 13
      Caption = 'Amplifier'
    end
    object Label13: TLabel
      Left = 236
      Top = 28
      Width = 84
      Height = 13
      Caption = 'Calibration (nm/V)'
    end
    object Label16: TLabel
      Left = 66
      Top = 60
      Width = 22
      Height = 13
      Caption = 'ADC'
    end
    object Label17: TLabel
      Left = 130
      Top = 60
      Width = 60
      Height = 13
      Caption = 'Amplifier 10^'
    end
    object Label18: TLabel
      Left = 256
      Top = 60
      Width = 41
      Height = 13
      Caption = 'Multiplier'
    end
    object Label22: TLabel
      Left = 66
      Top = 92
      Width = 22
      Height = 13
      Caption = 'ADC'
    end
    object Label23: TLabel
      Left = 130
      Top = 92
      Width = 60
      Height = 13
      Caption = 'Amplifier 10^'
    end
    object Label24: TLabel
      Left = 256
      Top = 92
      Width = 41
      Height = 13
      Caption = 'Multiplier'
    end
    object SpinEdit3: TSpinEdit
      Left = 92
      Top = 24
      Width = 33
      Height = 22
      MaxValue = 5
      MinValue = 0
      TabOrder = 1
      Value = 2
    end
    object ComboBox3: TComboBox
      Left = 192
      Top = 24
      Width = 41
      Height = 21
      TabOrder = 2
      Text = '13'
      Items.Strings = (
        '13'
        '1.3')
    end
    object CheckBox1: TCheckBox
      Left = 8
      Top = 27
      Width = 49
      Height = 17
      Caption = 'Topo'
      Checked = True
      State = cbChecked
      TabOrder = 0
    end
    object Edit3: TEdit
      Left = 330
      Top = 24
      Width = 33
      Height = 21
      Alignment = taCenter
      TabOrder = 3
      Text = '1'
    end
    object CheckBox2: TCheckBox
      Left = 8
      Top = 58
      Width = 57
      Height = 17
      Caption = 'Current'
      Checked = True
      State = cbChecked
      TabOrder = 4
    end
    object SpinEdit4: TSpinEdit
      Left = 92
      Top = 56
      Width = 33
      Height = 22
      MaxValue = 5
      MinValue = 0
      TabOrder = 5
      Value = 0
    end
    object ComboBox4: TComboBox
      Left = 192
      Top = 56
      Width = 41
      Height = 21
      ItemIndex = 2
      TabOrder = 6
      Text = '8'
      Items.Strings = (
        '10'
        '9'
        '8'
        '7'
        '6'
        '5'
        '4')
    end
    object Edit4: TEdit
      Left = 314
      Top = 56
      Width = 49
      Height = 21
      Alignment = taCenter
      TabOrder = 7
      Text = '-1'
    end
    object CheckBox3: TCheckBox
      Left = 8
      Top = 90
      Width = 49
      Height = 17
      Caption = 'Other'
      TabOrder = 8
    end
    object SpinEdit5: TSpinEdit
      Left = 92
      Top = 88
      Width = 33
      Height = 22
      MaxValue = 5
      MinValue = 0
      TabOrder = 9
      Value = 1
    end
    object ComboBox5: TComboBox
      Left = 192
      Top = 88
      Width = 41
      Height = 21
      TabOrder = 10
      Text = '9'
      Items.Strings = (
        '10'
        '9'
        '8'
        '7'
        '6'
        '5'
        '4'
        '3'
        '2'
        '1'
        '0')
    end
    object Edit5: TEdit
      Left = 314
      Top = 88
      Width = 49
      Height = 21
      Alignment = taCenter
      TabOrder = 11
      Text = '1'
    end
    object CheckBox4: TCheckBox
      Left = 8
      Top = 125
      Width = 73
      Height = 17
      Caption = 'MakeIV'
      TabOrder = 12
      OnClick = CheckBox4Click
    end
  end
end
