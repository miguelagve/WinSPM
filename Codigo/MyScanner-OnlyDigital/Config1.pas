unit Config1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Spin, Math, IniFiles;

type
  TConfigForm = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    SpinEdit1: TSpinEdit;
    SpinEdit2: TSpinEdit;
    Label6: TLabel;
    Edit1: TEdit;
    Label7: TLabel;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    Label10: TLabel;
    Label11: TLabel;
    Panel2: TPanel;
    Label12: TLabel;
    Label14: TLabel;
    SpinEdit3: TSpinEdit;
    Label15: TLabel;
    ComboBox3: TComboBox;
    CheckBox1: TCheckBox;
    Label13: TLabel;
    Edit3: TEdit;
    CheckBox2: TCheckBox;
    Label16: TLabel;
    SpinEdit4: TSpinEdit;
    Label17: TLabel;
    ComboBox4: TComboBox;
    Label18: TLabel;
    Edit4: TEdit;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    CheckBox3: TCheckBox;
    SpinEdit5: TSpinEdit;
    ComboBox5: TComboBox;
    Edit5: TEdit;
    CheckBox4: TCheckBox;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    SpinEdit6: TSpinEdit;
    SpinEdit7: TSpinEdit;
    chkAttenuator: TCheckBox;
    Label25: TLabel;
    ComboBox6: TComboBox;
    Label26: TLabel;
    ComboBox7: TComboBox;
    Edit2: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure CheckBox4Click(Sender: TObject);
  private
    { Private declarations }
    IniFile: TIniFile;
    iniTitle: AnsiString;
//    const AnsiString iniTitle := 'Channels';
  public
    { Public declarations }
  end;

var
  ConfigForm: TConfigForm;

implementation

uses Scanner1, DataAdcquisition;

{$R *.DFM}

procedure TConfigForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
ScanForm.XDAC:=SpinEdit1.Value;
ScanForm.YDAC:=SpinEdit2.Value;
ScanForm.XDAC_Pos:=SpinEdit6.Value;
ScanForm.YDAC_Pos:=SpinEdit7.Value;
ScanForm.AmpX:=StrtoFloat(Combobox1.Text);
ScanForm.AmpY:=StrtoFloat(Combobox2.Text);
ScanForm.CalX:=StrtoFloat(Edit1.Text);
ScanForm.CalY:=StrtoFloat(Edit2.Text);
ScanForm.ADCTopo:=SpinEdit3.Value;
ScanForm.ADCI:=SpinEdit4.Value;
ScanForm.AmpTopo:=StrtoFloat(Combobox3.Text);
ScanForm.AmpI:=power(10,-1*(StrtoFloat(ConfigForm.Combobox4.Text)-1)); //Le resto 1 a mano porque hay un factor 10 colgando por cómo se interpreta la lectura del adc
ScanForm.CalTopo:=StrtoFloat(Edit3.Text);
ScanForm.MultI:=StrtoInt(Edit4.Text);
ScanForm.ReadTopo:=Checkbox1.checked;
ScanForm.ReadCurrent:=Checkbox2.checked;

//añadido para poder leer other
ScanForm.ReadOther:=Checkbox3.checked;
ScanForm.ADCOther:=SpinEdit5.Value;
ScanForm.AmpOther:=StrtoFloat(ComboBox5.Text);
ScanForm.MultOther:=StrtoInt(Edit5.Text);

// Si está activo el atenuador, el efecto será el mismo que bajar las ganancias de los amplificadores un factor 10
if (chkAttenuator.Checked) then
begin
  if ScanForm.Versiondivider=False then DataAdcquisitionForm.set_attenuator(0,0.1)
  else
    begin
       DataAdcquisitionForm.set_attenuator(1,0.1);
       DataAdcquisitionForm.set_attenuator(2,0.1);
    end;
//  ScanForm.AmpX:= ScanForm.AmpX*0.1;
//  ScanForm.AmpY:= ScanForm.AmpY*0.1;
end
else
  begin
  if ScanForm.Versiondivider=False then DataAdcquisitionForm.set_attenuator(0,1)
  else
  begin
       DataAdcquisitionForm.set_attenuator(1,1);
       DataAdcquisitionForm.set_attenuator(2,1);
  end;
  end;
ScanForm.TrackBar3Change(self);

// Guardamos los datos en el fichero de configuración
// Leemos los datos del fichero de configuración
IniFile := TIniFile.Create(GetCurrentDir+'\Config.ini');
try
  IniFile.WriteInteger(String(iniTitle), 'XScanDac', SpinEdit1.Value);
  IniFile.WriteInteger(String(iniTitle), 'YScanDac', SpinEdit2.Value);
  IniFile.WriteString(String(iniTitle), 'XAmplifier', Combobox1.Text);
finally
  IniFile.Free;
end;

end;

procedure TConfigForm.FormCreate(Sender: TObject);
begin
// Leemos los datos del fichero de configuración
iniTitle := 'Channels';
IniFile := TIniFile.Create(GetCurrentDir+'\Config.ini');
try
  SpinEdit1.Value := IniFile.ReadInteger(String(iniTitle), 'XScanDac', 0);
  SpinEdit2.Value := IniFile.ReadInteger(String(iniTitle), 'YScanDac', 5);
  Combobox1.Text := IniFile.ReadString(String(iniTitle), 'XAmplifier', '13');
finally
  IniFile.Free;
end;


ScanForm.XDAC:=SpinEdit1.Value;
ScanForm.YDAC:=SpinEdit2.Value;
ScanForm.AmpX:=StrtoFloat(Combobox1.Text);
ScanForm.AmpY:=StrtoFloat(Combobox2.Text);
ScanForm.CalX:=StrtoFloat(Edit1.Text);
ScanForm.CalY:=StrtoFloat(Edit2.Text);
ScanForm.ADCTopo:=SpinEdit3.Value;
ScanForm.ADCI:=SpinEdit4.Value;
ScanForm.AmpTopo:=StrtoFloat(ConfigForm.Combobox3.Text);
ScanForm.AmpI:=power(10,-1*StrtoFloat(ConfigForm.Combobox4.Text));
ScanForm.CalTopo:=StrtoFloat(ConfigForm.Edit3.Text);
ScanForm.MultI:=StrtoInt(ConfigForm.Edit4.Text);
ScanForm.ReadTopo:=Checkbox1.checked;
ScanForm.ReadCurrent:=Checkbox2.checked;
end;

procedure TConfigForm.CheckBox4Click(Sender: TObject);
begin
if Checkbox4.Checked then
  begin
//    Checkbox4.Checked:=False;
    ScanForm.CheckBox2.Checked:=True;
  end
else
  begin
//  Checkbox4.Checked:=True;
  ScanForm.CheckBox2.Checked:=False;
  end;
end;

end.
