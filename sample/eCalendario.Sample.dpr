program eCalendario.Sample;

uses
  System.StartUpCopy,
  FMX.Forms,
  eCalendarioSample.view.main in 'src\eCalendarioSample.view.main.pas' {FormMain};

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := true;
  Application.Initialize;
  Application.CreateForm(TFormMain, FormMain);
  Application.Run;
end.
