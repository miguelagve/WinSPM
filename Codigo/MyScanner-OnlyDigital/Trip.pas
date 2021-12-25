unit Trip;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Spin, math;

type
  TTripForm = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Spinedit1: TSpinEdit;
    ScrollBar1: TScrollBar;
    ScrollBar2: TScrollBar;
    Label1: TLabel;
    Label2: TLabel;
    Button5: TButton;
    Label5: TLabel;
    Label6: TLabel;
    Button6: TButton;
    Label8: TLabel;
    Button7: TButton;
    Button8: TButton;
    procedure Button5Click(Sender: TObject);
    procedure ScrollBar2Change(Sender: TObject);
    procedure ScrollBar1Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Spinedit1Change(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure SetMoving(moving: Boolean);
    procedure MakeSteps(numSteps, direction: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  Speed, Size, times, ZPDac, IADC, Mult, MultI: Integer;
  StopTrip: Boolean; // Cuidado con StopTrip, se está asignando varias veces en la aproximación automática. Es poco probable pero podría darse el caso que una de estas asignaciones coincidiera con la pulsación del usuario para parar, lo machacase y no parara.
  end;

var
  TripForm: TTripForm;

implementation

uses Config_Trip, Liner, DataAdcquisition,
  Scanner1;

function dac_set(ndac,valor:integer) : boolean ; external 'take_dilucion.dll' ;
function dac_init : boolean ;  external 'take_dilucion.dll' ;
function adc_take(chn,mux,n:integer) : boolean ; external 'take_dilucion.dll' ;
function adc_init : boolean ;  external 'take_dilucion.dll' ;
function PID1_hold(b:Boolean) : Boolean ;  external 'take_dilucion.dll' ;
function Bit_Modula(b:Boolean) : Boolean ;  external 'take_dilucion.dll' ;
function take_initialize : boolean ;  external 'take_dilucion.dll' ;
function take_finalize : boolean ;  external 'take_dilucion.dll' ;

{$R *.DFM}

procedure TTripForm.Button5Click(Sender: TObject);
begin
ConfigTripForm.Show;
end;

procedure TTripForm.ScrollBar2Change(Sender: TObject);
begin
Size:=ScrollBar2.Position;
Label6.Caption:=InttoStr(Size);
end;

procedure TTripForm.ScrollBar1Change(Sender: TObject);
begin
Speed:=ScrollBar1.Position;
Label5.Caption:=InttoStr(Speed);
end;

procedure TTripForm.FormShow(Sender: TObject);
begin
ConfigTripForm.Show;
Size:=ScrollBar2.Position;
Speed:=ScrollBar1.Position;
times:=SpinEdit1.Value;
ConfigTripForm.Show;
ZPDAC:=ConfigTripForm.SpinEdit1.Value;
IADC:=ConfigTripForm.Spinedit2.Value;
if (ConfigTripForm.Checkbox1.checked) then Mult:=1 else Mult:=-1;
if (ConfigTripForm.Checkbox2.checked) then MultI:=1 else MultI:=-1;
ConfigTripForm.Hide;
end;

procedure TTripForm.Button1Click(Sender: TObject);
begin
  SetMoving(true);
  MakeSteps(times, 1);
  SetMoving(false);
end;

procedure TTripForm.Spinedit1Change(Sender: TObject);
begin
  TryStrToInt(SpinEdit1.Text, times);
end;

procedure TTripForm.Button2Click(Sender: TObject);
begin
  SetMoving(true);
  MakeSteps(times, -1);
  SetMoving(false);
end;

procedure TTripForm.Button3Click(Sender: TObject);
begin
  SetMoving(true);
  MakeSteps(100, -1);
  SetMoving(false);
end;

procedure TTripForm.Button4Click(Sender: TObject);
var
Strom_jetzt: Single;
punto_salida: boolean;

begin
//Esta para probar hay que asignarle un valor minimo de corriente a aprtir de la cual pare de moverse
//Strom_jetzt:=9;//adc_take(0,ADCI,ScanForm.P_Scan_Mean))
//StopTrip:=False;
  SetMoving(true);
  StopTrip:=False;
  punto_salida:=false;
  while (punto_salida=false) do
  begin
    Strom_jetzt:=  DataAdcquisitionForm.adc_take(ConfigTripForm.SpinEdit2.Value,ConfigTripForm.SpinEdit2.Value,ScanForm.P_Scan_Mean);
    //Label7.caption:=Floattostr(Strom_jetzt);
    //times:=1000;
    while (abs(Strom_jetzt)<(ConfigTripForm.spinCurrentLimit.Value/100)) and (StopTrip=False) do
    begin
      MakeSteps(times, 1);
      Strom_jetzt:=  DataAdcquisitionForm.adc_take(ConfigTripForm.SpinEdit2.Value,ConfigTripForm.SpinEdit2.Value,ScanForm.P_Scan_Mean);
    end;
    punto_salida:=True;
    //times:=Spinedit1.Value;
  end;
  SetMoving(false);
end;

procedure TTripForm.Button6Click(Sender: TObject);
begin
  StopTrip:=True;
end;

procedure TTripForm.Button7Click(Sender: TObject);
begin
  if (Round(SpinEdit1.Value/10)>0) then
    SpinEdit1.Value:=Round(SpinEdit1.Value/10)
  else
    SpinEdit1.Value:=1;
end;

procedure TTripForm.Button8Click(Sender: TObject);
begin
  SpinEdit1.Value:=SpinEdit1.Value*10;
end;

procedure TTripForm.SetMoving(moving: Boolean);
begin
  // Habilitamos o deshabilitamos los botones de movimiento que correspondan
  Button1.Enabled := not moving;
  Button2.Enabled := not moving;
  Button3.Enabled := not moving;
  Button4.Enabled := not moving;
  Button6.Enabled := moving; // Stop
end;


procedure TTripForm.MakeSteps(numSteps, direction: Integer);
var
i,j: Integer;
enviaZ: Integer;

begin
  StopTrip:=False;
  i:=0;
  while (i<numSteps) and (StopTrip=False) do
  begin
    for j:=-32767 to 32767 do
    begin
      if Frac(j/Speed)=0 then
      begin
        enviaZ:=direction*Mult*Round(j*Size/10);
        DataAdcquisitionForm.dac_set(ZPDac,enviaZ, nil);
      end;
    end;
    Application.ProcessMessages;
    i:=i+1;
  end;
  DataAdcquisitionForm.dac_set(ZPDac,0, nil);
end;

end.
