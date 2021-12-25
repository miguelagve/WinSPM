unit Config_Liner;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Spin;

type
  TConfigLinerForm = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    SpinEdit1: TSpinEdit;
    RadioGroup1: TRadioGroup;
    Label4: TLabel;
    Edit1: TEdit;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    Label5: TLabel;
    Panel2: TPanel;
    CheckBox4: TCheckBox;
    Pane3: TPanel;
    RadioGroup2: TRadioGroup;
    Label3: TLabel;
    seADCxaxis: TSpinEdit;
    pnl1: TPanel;
    seReduceRampFactor: TSpinEdit;
    chkReduceRamp: TCheckBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpinEdit1Change(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
    procedure CheckBox4Click(Sender: TObject);
    procedure RadioGroup2Click(Sender: TObject);
    procedure seADCxaxisChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ConfigLinerForm: TConfigLinerForm;

implementation

uses Liner;

{$R *.DFM}

procedure TConfigLinerForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
if RadioGroup1.ItemIndex=0 then LinerForm.ReadXfromADC:=True else
LinerForm.ReadXfromADC:=False;

LinerForm.x_axisDac:=SpinEdit1.Value;
LinerForm.x_axisADC:=seADCxaxis.Value;
LinerForm.x_axisMult:=StrtoFloat(Edit1.Text);
LinerForm.NumCol:=1;
if Checkbox1.checked then LinerForm.NumCol:=LinerForm.NumCol+1;
if Checkbox2.checked then LinerForm.NumCol:=LinerForm.NumCol+1;
if Checkbox3.checked then LinerForm.NumCol:=LinerForm.NumCol+1;
LinerForm.ReadZ:=Checkbox1.checked;
LinerForm.ReadCurrent:=Checkbox2.checked;
LinerForm.ReadOther:=Checkbox3.checked;

end;

procedure TConfigLinerForm.SpinEdit1Change(Sender: TObject);
begin
  TryStrToInt(SpinEdit1.Text, LinerForm.x_axisDac);
end;

procedure TConfigLinerForm.RadioGroup1Click(Sender: TObject);
begin
if RadioGroup1.ItemIndex=0 then LinerForm.ReadXfromADC:=True else
LinerForm.ReadXfromADC:=False;
end;

procedure TConfigLinerForm.Edit1Change(Sender: TObject);
begin
LinerForm.x_axisMult:=StrtoFloat(Edit1.Text);
end;

procedure TConfigLinerForm.CheckBox1Click(Sender: TObject);
begin
LinerForm.NumCol:=1;
if Checkbox1.checked then LinerForm.NumCol:=LinerForm.NumCol+1;
if Checkbox2.checked then LinerForm.NumCol:=LinerForm.NumCol+1;
if Checkbox3.checked then LinerForm.NumCol:=LinerForm.NumCol+1;
LinerForm.ReadZ:=Checkbox1.checked;
LinerForm.ReadCurrent:=Checkbox2.checked;
LinerForm.ReadOther:=Checkbox3.checked;
end;

procedure TConfigLinerForm.CheckBox2Click(Sender: TObject);
begin
LinerForm.NumCol:=1;
if Checkbox1.checked then LinerForm.NumCol:=LinerForm.NumCol+1;
if Checkbox2.checked then LinerForm.NumCol:=LinerForm.NumCol+1;
if Checkbox3.checked then LinerForm.NumCol:=LinerForm.NumCol+1;
LinerForm.ReadZ:=Checkbox1.checked;
LinerForm.ReadCurrent:=Checkbox2.checked;
LinerForm.ReadOther:=Checkbox3.checked;
end;

procedure TConfigLinerForm.CheckBox3Click(Sender: TObject);
begin
LinerForm.NumCol:=1;
if Checkbox1.checked then LinerForm.NumCol:=LinerForm.NumCol+1;
if Checkbox2.checked then LinerForm.NumCol:=LinerForm.NumCol+1;
if Checkbox3.checked then LinerForm.NumCol:=LinerForm.NumCol+1;
LinerForm.ReadZ:=Checkbox1.checked;
LinerForm.ReadCurrent:=Checkbox2.checked;
LinerForm.ReadOther:=Checkbox3.checked;
end;

procedure TConfigLinerForm.CheckBox4Click(Sender: TObject);
begin
LinerForm.scrollSizeBiasChange(nil);
end;

procedure TConfigLinerForm.RadioGroup2Click(Sender: TObject);
begin
if RadioGroup2.ItemIndex = 0 then Edit1.Text:='10';
if RadioGroup2.ItemIndex = 1 then Edit1.Text:='1';
if RadioGroup2.ItemIndex = 2 then Edit1.Text:='0.1';
if RadioGroup2.ItemIndex = 3 then Edit1.Text:='0.01';
if RadioGroup2.ItemIndex = 4 then Edit1.Text:='0.001';
end;

procedure TConfigLinerForm.seADCxaxisChange(Sender: TObject);
begin
  TryStrToInt(seADCxaxis.Text, LinerForm.x_axisAdc);
end;

end.
