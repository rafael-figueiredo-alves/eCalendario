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
begin
  teCalendario.New(self, Layout1)
                .onClickDate(ExibeData)
                .Locale(EN)
                .StartDate(Now)
                .ShowCalendar;
end;

end.
