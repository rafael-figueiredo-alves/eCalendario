unit eCalendarioSample.view.main;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.Controls.Presentation, FMX.StdCtrls;

type
  TFormMain = class(TForm)
    Layout1: TLayout;
    Label1: TLabel;
    Label2: TLabel;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Procedure ExibeData(Data : TDate);
  end;

var
  FormMain: TFormMain;

implementation

{$R *.fmx}

{ TFormMain }

Uses eCalendario.Component;

procedure TFormMain.ExibeData(Data: TDate);
begin
  Label1.Text := DateToStr(Data);
end;

procedure TFormMain.FormCreate(Sender: TObject);
var
 Version_eCalendario: string;
begin
  teCalendario.New(self, Layout1)
                .config
                  .ButtonsColor(TAlphaColorRec.Red)
                  .DaysColor(TAlphaColorRec.Blue)
                  .&End
                .onClickDate(ExibeData)
                .Locale(it)
                .StartDate(Now)
                .GetVersion(Version_eCalendario)
                .ShowCalendar;

  Label2.Text := 'eCalendario - Version ' + Version_eCalendario;
end;

end.
