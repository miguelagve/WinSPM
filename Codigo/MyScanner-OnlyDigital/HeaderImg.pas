unit HeaderImg;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, ComCtrls, var_gbl;

type
  THeaderImgForm = class(TForm)
    Button1: TButton;
    RadioGroup1: TRadioGroup;
    RadioGroup2: TRadioGroup;
    RichEdit1: TRichEdit;
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  ZAmplitude: Single;
  PosFin:Integer;
  WSxMHeader: AnsiString;
  end;

var
  HeaderImgForm: THeaderImgForm;

implementation

uses Scanner1, PID;

{$R *.DFM}

procedure THeaderImgForm.FormCreate(Sender: TObject);
begin
  Button1Click(nil);
end;

procedure THeaderImgForm.Button1Click(Sender: TObject);
var
MyComments, strLine, strUnit: AnsiString;

begin
{$IfDef VER150}
  DecimalSeparator := '.';
{$EndIf}

  if RadioGroup1.ItemIndex=0 then MyComments:='Forth'
  else MyComments:='Back';

  if RadioGroup2.ItemIndex=0 then
  begin
    strUnit := 'nm';
    MyComments:=MyComments+'Z'
  end
  else if RadioGroup2.ItemIndex=1 then
  begin
    strUnit := 'nA';
    MyComments:=MyComments+'I'
  end
  else
  begin
    strUnit := 'V';
    MyComments:=MyComments+'Other';
  end;

  WSxMHeader:='WSxM file copyright UAM'+#13#10+
         'SxM Image file'+#13#10+
         'Image header size: 0'+#13#10+ // No se usa el tama�o de la cabecera, pero mejor que aparezca la l�nea
         '[Control]'+#13#10+
         #13#10;

  if (FormPID = nil) then
    strLine :='    Set Point: ?? %'
  else
    strLine := MyFormat('    Set Point: %d %%', [FormPID.ScrollBar4.Position]);

  WSxMHeader := WSxMHeader+strLine+#13#10;

  strLine := MyFormat('    X Amplitude: %f nm', [abs(ScanForm.h.xend-ScanForm.h.xstart)*1e9*ScanForm.CalX]);
  WSxMHeader := WSxMHeader+strLine+#13#10;

  strLine := MyFormat('    X Offset: %f nm', [ScanForm.XOffset*10*ScanForm.AmpX*ScanForm.CalX]);
  WSxMHeader := WSxMHeader+strLine+#13#10;

  strLine := MyFormat('    Y Amplitude: %f nm', [abs(ScanForm.h.yend-ScanForm.h.ystart)*1e9*ScanForm.CalY]);
  WSxMHeader := WSxMHeader+strLine+#13#10;

  strLine := MyFormat('    Y Offset: %f nm', [ScanForm.YOffset*10*ScanForm.AmpY*ScanForm.CalY]);
  WSxMHeader := WSxMHeader+strLine+#13#10;

  WSxMHeader := WSxMHeader+#13#10+
        '[General Info]'#13#10+
        #13#10+
        '    Image Data Type: double'#13#10;

  strLine := MyFormat('    Number of columns: %d', [ScanForm.P_Scan_Lines]);
  WSxMHeader := WSxMHeader+strLine+#13#10;

  strLine := MyFormat('    Number of rows: %d', [ScanForm.P_Scan_Lines]);
  WSxMHeader := WSxMHeader+strLine+#13#10;

  strLine := MyFormat('    Z Amplitude: 1 %s', [strUnit]); // Si se guardan como flotantes el n�mero se ignora el valor. Se usa la unidad con el valor que venga en la matriz
  WSxMHeader := WSxMHeader+strLine+#13#10;

  WSxMHeader := WSxMHeader+
        #13#10+
        '[Miscellaneous]'#13#10+
        #13#10+
        '    Comments: '+AnsiString(Edit1.Text)+MyComments+#13#10+
        '    Saved with version: MyScanner 1.302'#13#10+
        '    Version: 1.0 (August 2005)'#13#10+
        '    Z Scale Factor: 1'#13#10+
        '    Z Scale Offset: 0'#13#10+
        #13#10 +
        '[Header end]'+
        #13#10;

  PosFin := Length(WSxMHeader);
  RichEdit1.Text:= String(WSxMHeader);
  Label2.Caption:=InttoStr(PosFin);
end;

end.
