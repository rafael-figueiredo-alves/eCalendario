unit eCalendario.Component;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Ani,
  FMX.Objects, FMX.TabControl, FMX.Controls.Presentation, FMX.StdCtrls,
  FMX.Layouts;

type
  TLocale = (ptBr, EN);

  tClickDate = procedure (Value : TDate) of object;

  iConfig = interface;

  ieCalendario = interface
    ['{44F7BAFD-55D1-449C-B5B5-783A4AC8AEFC}']
    Function StartDate(FDate : TDate) : ieCalendario;
    Function onClickDate (Value : TClickDate): ieCalendario;
    Function Locale (Value : TLocale) : ieCalendario;
    Function ShowCalendar : ieCalendario;
    Function config : iConfig;
  end;

  iConfig = interface
    ['{BBD30E8F-3099-4E8B-B268-B26EE15E52B0}']
    Function &End : ieCalendario;
    Function BackgroundColor (Color : TAlphaColor) : iConfig;
    Function SundaysColor (Color : TAlphaColor) : iConfig;
  end;

  TeCalendario = class(TForm, ieCalendario, iConfig)
    Layout_eCalendario: TLayout;
    Background: TRectangle;
    Lay_year: TLayout;
    Label_Year: TLabel;
    Btn_Back_Year: TImage;
    Btn_Next_Year: TImage;
    Lay_month: TLayout;
    Label_Month: TLabel;
    Btn_Back_Month: TImage;
    Btn_Next_Month: TImage;
    Tab_Cal: TTabControl;
    Month_1: TTabItem;
    Lay_calendar: TLayout;
    Lay_DayOfWeek: TLayout;
    Linha_inf_dias_semana: TLine;
    Label_Sunday: TLabel;
    Label_Monday: TLabel;
    Label_Tuesday: TLabel;
    Label_Wednesday: TLabel;
    Label_Thursday: TLabel;
    Label_Friday: TLabel;
    Label_Saturday: TLabel;
    Lay_week_1: TLayout;
    Day_1: TLabel;
    Selector: TArc;
    Ani_Selector: TFloatAnimation;
    Day_2: TLabel;
    Day_3: TLabel;
    Day_4: TLabel;
    Day_5: TLabel;
    Day_6: TLabel;
    Day_7: TLabel;
    Lay_week_2: TLayout;
    Day_8: TLabel;
    Day_9: TLabel;
    Day_10: TLabel;
    Day_11: TLabel;
    Day_12: TLabel;
    Day_13: TLabel;
    Day_14: TLabel;
    Lay_week_3: TLayout;
    Day_15: TLabel;
    Day_16: TLabel;
    Day_17: TLabel;
    Day_18: TLabel;
    Day_19: TLabel;
    Day_20: TLabel;
    Day_21: TLabel;
    Lay_week_4: TLayout;
    Day_22: TLabel;
    Day_23: TLabel;
    Day_24: TLabel;
    Day_25: TLabel;
    Day_26: TLabel;
    Day_27: TLabel;
    Day_28: TLabel;
    Lay_week_5: TLayout;
    Day_29: TLabel;
    Day_30: TLabel;
    Day_31: TLabel;
    Day_32: TLabel;
    Day_33: TLabel;
    Day_34: TLabel;
    Day_35: TLabel;
    Lay_week_6: TLayout;
    Day_36: TLabel;
    Day_37: TLabel;
    Day_38: TLabel;
    Day_39: TLabel;
    Day_40: TLabel;
    Day_41: TLabel;
    Day_42: TLabel;
    Month_2: TTabItem;
    Month_3: TTabItem;
    Month_4: TTabItem;
    Month_5: TTabItem;
    Month_6: TTabItem;
    Month_7: TTabItem;
    Month_8: TTabItem;
    Month_9: TTabItem;
    Month_10: TTabItem;
    Month_11: TTabItem;
    Month_12: TTabItem;
    StyleBook1: TStyleBook;
    procedure Btn_Next_YearClick(Sender: TObject);
    procedure Btn_Next_MonthClick(Sender: TObject);
    procedure Btn_Back_YearClick(Sender: TObject);
    procedure Btn_Back_MonthClick(Sender: TObject);
    procedure Day_1Click(Sender: TObject);
  private
    FDay    : word;
    FMonth  : word;
    FYear   : word;
    FClick  : tClickDate;
    FLocale : tlocale;
    Class var Frender : TFmxObject;
    class var FForm      : tForm;
    Procedure MountCalendar;
    Procedure ClearCalendar;
    Function Month(value : Integer): string;
    Function SelectedDate : TDate;
    Procedure SetLanguage;
  public
    Function StartDate(FDate : TDate) : ieCalendario;
    Function onClickDate (Value : TClickDate): ieCalendario;
    Function Locale (Value : TLocale) : ieCalendario;
    Function ShowCalendar : ieCalendario;
    Class function New(Owner: tForm; render: TFmxObject) : ieCalendario;
    Function config : iConfig;
    Function &End : ieCalendario;
    Function BackgroundColor (Color : TAlphaColor) : iConfig;
    Function SundaysColor (Color : TAlphaColor) : iConfig;
  end;

var
  eCalendario1: TeCalendario;

implementation

{$R *.fmx}

{ TeCalendario }

function TeCalendario.BackgroundColor(Color: TAlphaColor): iConfig;
begin
  Result := Self;
  Background.Fill.Color := Color;
end;

function TeCalendario.&End: ieCalendario;
begin
  Result := self;
end;

procedure TeCalendario.Btn_Back_MonthClick(Sender: TObject);
begin
  Fmonth := Fmonth - 1;
  Btn_next_month.Enabled := True;
  if Fmonth = 1 then
   begin
     Btn_back_month.Enabled := false;
     Btn_next_month.Enabled := true;
   end;
  Tab_Cal.GotoVisibleTab(Fmonth - 1);
  Lay_calendar.Parent := TTabItem(FindComponent('Month_'+FMonth.ToString));
  ClearCalendar;
  MountCalendar;
  FClick(SelectedDate);
end;

procedure TeCalendario.Btn_Back_YearClick(Sender: TObject);
begin
  FYear := FYear - 1;
  ClearCalendar;
  MountCalendar;
  FClick(SelectedDate);
end;

procedure TeCalendario.Btn_Next_MonthClick(Sender: TObject);
begin
  Fmonth := Fmonth + 1;
  Btn_back_month.Enabled := True;
  if Fmonth = 12 then
   begin
     Btn_back_month.Enabled := true;
     Btn_next_month.Enabled := false;
   end;
  Tab_Cal.GotoVisibleTab(Fmonth -1);
  Lay_calendar.Parent := TTabItem(FindComponent('Month_'+FMonth.ToString));
  ClearCalendar;
  MountCalendar;
  FClick(SelectedDate);
end;

procedure TeCalendario.Btn_Next_YearClick(Sender: TObject);
begin
  FYear := FYear + 1;
  ClearCalendar;
  MountCalendar;
  FClick(SelectedDate);
end;

procedure TeCalendario.ClearCalendar;
var i : Integer;
begin
  for I := 1 to 42 do
   begin
    TLabel(FindComponent('Day_'+i.ToString)).Text := '';
    TLabel(FindComponent('Day_'+i.ToString)).Cursor := crDefault;
   end;
end;

function TeCalendario.config: iConfig;
begin
  Result := Self;
end;

procedure TeCalendario.Day_1Click(Sender: TObject);
begin
  if TLabel(Sender).Text <> '' then
   begin
     FDay := TLabel(Sender).Text.ToInteger;
     Selector.EndAngle := 0;
     Selector.Parent := TLabel(sender);
     Ani_Selector.Start;
     FClick(SelectedDate);
   end;
end;

function TeCalendario.Locale(Value: TLocale): ieCalendario;
begin
  Result := self;
  FLocale := Value;
  SetLanguage;
end;

function TeCalendario.Month(value: Integer): string;
begin
 case FLocale of
   ptBr:
    begin
      case value of
      1: Result := 'Janeiro';
      2: Result := 'Fevereiro';
      3: Result := 'Março';
      4: Result := 'Abril';
      5: Result := 'Maio';
      6: Result := 'Junho';
      7: Result := 'Julho';
      8: Result := 'Agosto';
      9: Result := 'Setembro';
      10: Result := 'Outubro';
      11: Result := 'Novembro';
      12: Result := 'Dezembro';
      end;
    end;
   EN:
    begin
      case value of
      1: Result := 'January';
      2: Result := 'February';
      3: Result := 'March';
      4: Result := 'April';
      5: Result := 'May';
      6: Result := 'June';
      7: Result := 'July';
      8: Result := 'August';
      9: Result := 'September';
      10: Result := 'October';
      11: Result := 'November';
      12: Result := 'December';
      end;
    end;
 end;
end;

procedure TeCalendario.MountCalendar;
var
 day           : word;
 FirstDay      : Word;
 Fdate         : TDate;
 i, Pos_day    : integer;
 total         : integer;
 N_Day         : integer;
begin
  day := 1;
  Total := 0;
  Label_month.Text := month(fMonth);
  Label_year.Text := Fyear.ToString;
  FDate := EncodeDate(FYear, FMonth, day);
  FirstDay := DayOfWeek(Fdate);
  TLabel(FindComponent('Day_'+FirstDay.ToString)).Text := '1';
  case FMonth of
  1: total := 30 + FirstDay;
  2: begin
       if IsLeapYear(FYear) = true then
        total := 28 + FirstDay
       else
        total := 27 + FirstDay;
     end;
  3:  total := 30 + FirstDay;
  4:  total := 29 + FirstDay;
  5:  total := 30 + FirstDay;
  6:  total := 29 + FirstDay;
  7:  total := 30 + FirstDay;
  8:  total := 30 + FirstDay;
  9:  total := 29 + FirstDay;
  10: total := 30 + FirstDay;
  11: total := 29 + FirstDay;
  12: total := 30 + FirstDay;
  end;
  Pos_day := FirstDay + 1;
  N_Day := 2;
  for I := Pos_day to total do
   begin
     TLabel(FindComponent('Day_'+i.ToString)).Text := N_Day.ToString;
     TLabel(FindComponent('Day_'+i.ToString)).Cursor := crHandPoint;
     N_Day := N_Day + 1;
   end;
  Selector.EndAngle := 0;
  Selector.Parent := TLabel(FindComponent('Dia_' + inttostr((FirstDay + Fday) - 1)));
  Ani_Selector.Start;
end;

class function TeCalendario.New(Owner: tForm; render: TFmxObject): ieCalendario;
begin
  Frender := render;
  FForm   := Owner;
  Result := Self.Create(FForm);
end;

function TeCalendario.onClickDate(Value: TClickDate): ieCalendario;
begin
  Result := Self;
  FClick := Value;
end;

function TeCalendario.SelectedDate: TDate;
begin
  Result := EncodeDate(FYear, FMonth, FDay);
end;

procedure TeCalendario.SetLanguage;
begin
  case FLocale of
    ptBr:
     begin
       Label_Sunday.Text    := 'Dom';
       Label_Monday.Text    := 'Seg';
       Label_Tuesday.Text   := 'Ter';
       Label_Wednesday.Text := 'Qua';
       Label_Thursday.Text  := 'Qui';
       Label_Friday.Text    := 'Sex';
       Label_Saturday.Text  := 'Sáb';
       Btn_Back_Year.Hint   := 'Voltar Ano';
       Btn_Next_Year.Hint   := 'Avançar Ano';
       Btn_Back_Month.Hint  := 'Voltar Mês';
       Btn_Next_Month.Hint  := 'Avançar Mês';
     end;
    EN:
     begin
       Label_Sunday.Text    := 'Sun';
       Label_Monday.Text    := 'Mon';
       Label_Tuesday.Text   := 'Tues';
       Label_Wednesday.Text := 'Wed';
       Label_Thursday.Text  := 'Thur';
       Label_Friday.Text    := 'Fri';
       Label_Saturday.Text  := 'Sat';
       Btn_Back_Year.Hint   := 'Previous Year';
       Btn_Next_Year.Hint   := 'Next Year';
       Btn_Back_Month.Hint  := 'Previous Month';
       Btn_Next_Month.Hint  := 'Next Month';
     end;
  end;
end;

Function TeCalendario.ShowCalendar : ieCalendario;
begin
  Result := self;
  Tab_Cal.StyleLookup := 'TabControlstyle';
  Layout_eCalendario.Parent := Frender;
  FForm.StyleBook := StyleBook1;
end;

function TeCalendario.StartDate(FDate: TDate): ieCalendario;
begin
  Result := Self;
  DecodeDate(FDate, FYear, FMonth, FDay);
  Tab_Cal.ActiveTab := TTabItem(FindComponent('Month_'+FMonth.ToString));
  Lay_calendar.Parent := Tab_Cal.ActiveTab;
  ClearCalendar;
  MountCalendar;
  FClick(SelectedDate);
end;

function TeCalendario.SundaysColor(Color: TAlphaColor): iConfig;
begin
  Result := self;
  Label_Sunday.TextSettings.FontColor := Color;
  Day_1.TextSettings.FontColor        := Color;
  Day_8.TextSettings.FontColor        := Color;
  Day_15.TextSettings.FontColor        := Color;
  Day_22.TextSettings.FontColor        := Color;
  Day_29.TextSettings.FontColor        := Color;
  Day_36.TextSettings.FontColor        := Color;
end;

end.
