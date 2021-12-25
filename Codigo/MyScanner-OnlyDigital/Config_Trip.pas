unit Config_Trip;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Spin, ExtCtrls;

type
  TConfigTripForm = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    SpinEdit1: TSpinEdit;
    SpinEdit2: TSpinEdit;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    lblCurrentLimit: TLabel;
    spinCurrentLimit: TSpinEdit;
    procedure SpinEdit1Change(Sender: TObject);
    procedure SpinEdit2Change(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ConfigTripForm: TConfigTripForm;

implementation

uses Trip;

{$R *.DFM}

procedure TConfigTripForm.SpinEdit1Change(Sender: TObject);
begin
  TryStrToInt(SpinEdit1.Text, TripForm.ZPDac);
end;

procedure TConfigTripForm.SpinEdit2Change(Sender: TObject);
begin
  TryStrToInt(SpinEdit2.Text, TripForm.IADC);
end;

procedure TConfigTripForm.CheckBox1Click(Sender: TObject);
begin
if (Checkbox1.checked) then TripForm.Mult:=1 else TripForm.Mult:=-1;
end;

procedure TConfigTripForm.CheckBox2Click(Sender: TObject);
begin
if (Checkbox2.checked) then TripForm.MultI:=1 else TripForm.MultI:=-1;
end;

end.
