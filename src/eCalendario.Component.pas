unit eCalendario.Component;

interface

uses
  System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Ani,
  FMX.Objects, FMX.TabControl, FMX.Controls.Presentation, FMX.StdCtrls,
  FMX.Layouts, FMX.Effects, FMX.Filter.Effects;

type
  TLocale = (ptBr, EN, Espanol, Fr, Ger, It);

  tClickDate = procedure (Value : TDate) of object;

  iConfig = interface;

  ieCalendario = interface
    ['{44F7BAFD-55D1-449C-B5B5-783A4AC8AEFC}']
    Function StartDate(FDate : TDate) : ieCalendario;
    Function onClickDate (Value : TClickDate): ieCalendario;
    Function Locale (Value : TLocale) : ieCalendario;
    Function ShowCalendar : ieCalendario;
    Function config : iConfig;
    Function GetVersion(out Version: string): ieCalendario;
  end;

  iConfig = interface
    ['{BBD30E8F-3099-4E8B-B268-B26EE15E52B0}']
    Function &End : ieCalendario;
    Function BackgroundColor (Color : TAlphaColor) : iConfig;
    Function SundaysColor (Color : TAlphaColor) : iConfig;
    Function SelectorColor(Color: TAlphaColor) : iConfig;
    Function DaysColor(Color: TAlphaColor) : iConfig;
    Function MonthYearColor(Color: TAlphaColor) : iConfig;
    Function LineColor(Color: TAlphaColor) : iConfig;
    Function ButtonsColor(Color: TAlphaColor) : iConfig;
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
    btnNextMonthColor: TFillRGBEffect;
    BtnBackMonthColor: TFillRGBEffect;
    BtnBackYearColor: TFillRGBEffect;
    BtnNextYearColor: TFillRGBEffect;
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
    Procedure ValidateDay;
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
    Function GetVersion(out Version: string): ieCalendario;
    Function SelectorColor(Color: TAlphaColor) : iConfig;
    Function DaysColor(Color: TAlphaColor) : iConfig;
    Function MonthYearColor(Color: TAlphaColor) : iConfig;
    Function LineColor(Color: TAlphaColor) : iConfig;
    Function ButtonsColor(Color: TAlphaColor) : iConfig;
  end;

var
  eCalendario1: TeCalendario;

implementation

uses
  System.SysUtils;

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

function TeCalendario.GetVersion(out Version: string): ieCalendario;
begin
  Result := self;
  Version := '1.1';
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

function TeCalendario.ButtonsColor(Color: TAlphaColor): iConfig;
begin
  Result := Self;

  BtnBackMonthColor.Color := Color;
  btnNextMonthColor.Color := Color;

  BtnBackYearColor.Color  := Color;
  BtnNextYearColor.Color  := Color;
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

function TeCalendario.DaysColor(Color: TAlphaColor): iConfig;
begin
  Result := self;
  Label_Monday.TextSettings.FontColor    := Color;
  Label_Tuesday.TextSettings.FontColor   := Color;
  Label_Wednesday.TextSettings.FontColor := Color;
  Label_Thursday.TextSettings.FontColor  := Color;
  Label_Friday.TextSettings.FontColor    := Color;
  Label_Saturday.TextSettings.FontColor  := Color;
  Day_2.TextSettings.FontColor  := Color;
  Day_3.TextSettings.FontColor  := Color;
  Day_4.TextSettings.FontColor  := Color;
  Day_5.TextSettings.FontColor  := Color;
  Day_6.TextSettings.FontColor  := Color;
  Day_7.TextSettings.FontColor  := Color;
  Day_9.TextSettings.FontColor  := Color;
  Day_10.TextSettings.FontColor := Color;
  Day_11.TextSettings.FontColor := Color;
  Day_12.TextSettings.FontColor := Color;
  Day_13.TextSettings.FontColor := Color;
  Day_14.TextSettings.FontColor := Color;
  Day_16.TextSettings.FontColor := Color;
  Day_17.TextSettings.FontColor := Color;
  Day_18.TextSettings.FontColor := Color;
  Day_19.TextSettings.FontColor := Color;
  Day_20.TextSettings.FontColor := Color;
  Day_21.TextSettings.FontColor := Color;
  Day_23.TextSettings.FontColor := Color;
  Day_24.TextSettings.FontColor := Color;
  Day_25.TextSettings.FontColor := Color;
  Day_26.TextSettings.FontColor := Color;
  Day_27.TextSettings.FontColor := Color;
  Day_28.TextSettings.FontColor := Color;
  Day_30.TextSettings.FontColor := Color;
  Day_31.TextSettings.FontColor := Color;
  Day_32.TextSettings.FontColor := Color;
  Day_33.TextSettings.FontColor := Color;
  Day_34.TextSettings.FontColor := Color;
  Day_35.TextSettings.FontColor := Color;
  Day_37.TextSettings.FontColor := Color;
  Day_38.TextSettings.FontColor := Color;
  Day_39.TextSettings.FontColor := Color;
  Day_40.TextSettings.FontColor := Color;
  Day_41.TextSettings.FontColor := Color;
  Day_42.TextSettings.FontColor := Color;
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

function TeCalendario.LineColor(Color: TAlphaColor): iConfig;
begin
  Result := self;
  Linha_inf_dias_semana.Stroke.Color := Color;
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
   ptBr:  //Portuguese (Brazil)
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
   EN:    //English
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
   Espanol:  //Spanish
    begin
      case value of
      1: Result := 'Enero';
      2: Result := 'Febrero';
      3: Result := 'Marzo';
      4: Result := 'Abril';
      5: Result := 'Mayo';
      6: Result := 'Junio';
      7: Result := 'Julio';
      8: Result := 'Agosto';
      9: Result := 'Septiembre';
      10: Result := 'Octubre';
      11: Result := 'Novembre';
      12: Result := 'Decembre';
      end;
    end;
   Fr: //French
    begin
      case value of
      1: Result := 'Janvier';
      2: Result := 'Février';
      3: Result := 'Mars';
      4: Result := 'Avril';
      5: Result := 'Mai';
      6: Result := 'Juin';
      7: Result := 'Juillet';
      8: Result := 'Août';
      9: Result := 'Septembre';
      10: Result := 'Octobre';
      11: Result := 'Novembre';
      12: Result := 'Décembre';
      end;
    end;
   Ger: //German
    begin
      case value of
      1: Result := 'Januar';
      2: Result := 'Februar';
      3: Result := 'März';
      4: Result := 'April';
      5: Result := 'Mai';
      6: Result := 'Juni';
      7: Result := 'Juli';
      8: Result := 'August';
      9: Result := 'September';
      10: Result := 'Oktober';
      11: Result := 'November';
      12: Result := 'Dezember';
      end;
    end;
   It: //Italian
    begin
      case value of
      1: Result := 'Gennaio';
      2: Result := 'Febbraio';
      3: Result := 'Marzo';
      4: Result := 'Aprile';
      5: Result := 'Maggio';
      6: Result := 'Giugno';
      7: Result := 'Luglio';
      8: Result := 'Agosto';
      9: Result := 'Settembre';
      10: Result := 'Ottobre';
      11: Result := 'Novembre';
      12: Result := 'Dicembre';
      end;
    end;
 end;
end;

function TeCalendario.MonthYearColor(Color: TAlphaColor): iConfig;
begin
  Result := self;
  Label_Year.TextSettings.FontColor  := Color;
  Label_Month.TextSettings.FontColor := Color;
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
  ValidateDay;
  Selector.Parent := TLabel(FindComponent('Day_' + inttostr((FirstDay + Fday) - 1)));
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

function TeCalendario.SelectorColor(Color: TAlphaColor): iConfig;
begin
  Result := self;
  Selector.Stroke.Color := Color;
end;

procedure TeCalendario.SetLanguage;
begin
  case FLocale of
    ptBr:  //Portuguese (Brazil)
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
    EN:     //English
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
    Espanol: //Spanish
     begin
       Label_Sunday.Text    := 'Dom';
       Label_Monday.Text    := 'Lun';
       Label_Tuesday.Text   := 'Mar';
       Label_Wednesday.Text := 'Mie';
       Label_Thursday.Text  := 'Jue';
       Label_Friday.Text    := 'Vie';
       Label_Saturday.Text  := 'Sáb';
       Btn_Back_Year.Hint   := 'Año Atrás';
       Btn_Next_Year.Hint   := 'El Próximo Año';
       Btn_Back_Month.Hint  := 'Mes Posterior';
       Btn_Next_Month.Hint  := 'Mes Próximo';
     end;
    Fr: //French
     begin
       Label_Sunday.Text    := 'Dim';
       Label_Monday.Text    := 'Lun';
       Label_Tuesday.Text   := 'Mar';
       Label_Wednesday.Text := 'Mer';
       Label_Thursday.Text  := 'Jeu';
       Label_Friday.Text    := 'Ven';
       Label_Saturday.Text  := 'Sam';
       Btn_Back_Year.Hint   := 'Année de Retour';
       Btn_Next_Year.Hint   := 'L’année prochaine';
       Btn_Back_Month.Hint  := 'Mois de Retour';
       Btn_Next_Month.Hint  := 'Prochain';
     end;
    Ger: //Germany
     begin
       Label_Sunday.Text    := 'So.';
       Label_Monday.Text    := 'Mo.';
       Label_Tuesday.Text   := 'Di.';
       Label_Wednesday.Text := 'Mittw.';
       Label_Thursday.Text  := 'Do.';
       Label_Friday.Text    := 'Fr.';
       Label_Saturday.Text  := 'Sa.';
       Btn_Back_Year.Hint   := 'Zurück Jahr';
       Btn_Next_Year.Hint   := 'Nächstes Jahr';
       Btn_Back_Month.Hint  := 'zurück Monat zurück';
       Btn_Next_Month.Hint  := 'Nächster Monat';
     end;
    It: //Italian
     begin
       Label_Sunday.Text    := 'Dom.';
       Label_Monday.Text    := 'Lun.';
       Label_Tuesday.Text   := 'Mar.';
       Label_Wednesday.Text := 'Mer.';
       Label_Thursday.Text  := 'Gio.';
       Label_Friday.Text    := 'Ven.';
       Label_Saturday.Text  := 'Sab.';
       Btn_Back_Year.Hint   := 'Anno indietro';
       Btn_Next_Year.Hint   := 'L´anno prossimo';
       Btn_Back_Month.Hint  := 'Indietro Mese';
       Btn_Next_Month.Hint  := 'Il mese prossimo';
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

procedure TeCalendario.ValidateDay;
begin
  if FDay > monthDays[IsLeapYear(FYear)][FMonth] then
   FDay := monthDays[IsLeapYear(FYear)][FMonth];
end;

end.
