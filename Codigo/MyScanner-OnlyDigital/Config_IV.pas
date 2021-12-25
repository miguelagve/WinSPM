unit Config_IV;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TConfig_IVForm = class(TForm)
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    ComboBox1: TComboBox;
    Label1: TLabel;
    chkSaveAsWSxM: TCheckBox;
    procedure ComboBox1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Config_IVForm: TConfig_IVForm;

implementation

uses Scanner1, Liner;

{$R *.dfm}

procedure TConfig_IVForm.ComboBox1Change(Sender: TObject);
begin
ScanForm.IV_Scan_Lines:=StrtoInt(ComboBox1.Text);
ScanForm.RedimCits(ScanForm.IV_Scan_Lines, LinerForm.PointNumber);
end;

end.
