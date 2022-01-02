program MyScanner;

uses
  Forms,
  Scanner1 in 'Scanner1.pas' {ScanForm},
  Scanning in 'Scanning.pas' {ScanningForm},
  Trip in 'Trip.pas' {TripForm},
  Liner in 'Liner.pas' {LinerForm},
  Config_Liner in 'Config_Liner.pas' {ConfigLinerForm},
  Config1 in 'Config1.pas' {ConfigForm},
  Config_Trip in 'Config_Trip.pas' {ConfigTripForm},
  blqDataSet in 'blqDataSet.pas' {blqDataSetForm},
  blqLoader in 'blqLoader.pas' {blqLoaderForm},
  var_gbl in 'var_gbl.pas',
  HeaderImg in 'HeaderImg.pas' {HeaderImgForm},
  FileNames in 'FileNames.pas' {FileForm},
  DataAdcquisition in 'DataAdcquisition.pas' {DataAdcquisitionForm},
  PID in 'PID.pas' {FormPID},
  Config_IV in 'Config_IV.pas' {Config_IVForm},
  Paste in 'Paste.pas' {FormPaste},
  ThdTimer in 'ThdTimer.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'WinSPM';
  Application.CreateForm(TScanForm, ScanForm);
  Application.CreateForm(TConfigTripForm, ConfigTripForm);
  Application.CreateForm(TScanningForm, ScanningForm);
  Application.CreateForm(TLinerForm, LinerForm);
  Application.CreateForm(TConfigLinerForm, ConfigLinerForm);
  Application.CreateForm(TTripForm, TripForm);
  Application.CreateForm(TConfigForm, ConfigForm);
  Application.CreateForm(TblqDataSetForm, blqDataSetForm);
  Application.CreateForm(TblqLoaderForm, blqLoaderForm);
  Application.CreateForm(THeaderImgForm, HeaderImgForm);
  Application.CreateForm(TFileForm, FileForm);
  Application.CreateForm(TDataAdcquisitionForm, DataAdcquisitionForm);
  Application.CreateForm(TFormPID, FormPID);
  Application.CreateForm(TConfig_IVForm, Config_IVForm);
  Application.CreateForm(TFormPaste, FormPaste);
  Application.Run;
end.
