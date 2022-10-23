![logotipo](https://github.com/rafael-figueiredo-alves/eCalendario/blob/main/img/logo.png)

![Informações sobre projeto](https://img.shields.io/badge/Delphi%20Version-10.4.2%20Community-brightgreen))
![Status do projeto](https://img.shields.io/badge/Project's%20status-Version%201.1%20released-brightgreen)
![Versão](https://img.shields.io/badge/Project's%20version-1.1-brightgreen)
![estrelas do projeto](https://img.shields.io/github/stars/rafael-figueiredo-alves/eCalendario?style=flat-square)
![Linhas](https://tokei.rs/b1/github/rafael-figueiredo-alves/eCalendario?color=red&category=lines&style=flat-square)
![Mais linhas](https://tokei.rs/b1/github/rafael-figueiredo-alves/eCalendario?color=green&category=code&style=flat-square)
![arquivos](https://tokei.rs/b1/github/rafael-figueiredo-alves/eCalendario?color=yellow&category=files&style=flat-square)

Você pode ler estas informações em Português [clicando aqui](https://github.com/rafael-figueiredo-alves/eCalendario/blob/main/README.md).

**Description:** a firemonkey Delphi component that is easy to implement in any of the Firemonkey framework platforms compiles for (Windows 32-bit, Windows 64-bit, MacOS, iOS, Linux, Android). The goal is to be a simple customizable calendar to be implemented at runtime (it doesn't work at Design time).

![imagem do componente em inglês](https://github.com/rafael-figueiredo-alves/eCalendario/blob/main/img/img_componente.png) ![imagem do componente em português](https://github.com/rafael-figueiredo-alves/eCalendario/blob/main/img/img_componente_portugues.png)

# Features

* A runtime component;
* Interface concepts;
* It's customizable;
* It has animations and it can be customized;
* It supports two languages (Portuguese e English);
* You don't need to install package,just add the unit or use Boss to manage your dependencies (Recommended);
* It will be constantly updated;
* Very easy to use it.

# How to begin to use eCalendario

To start to use eCalendario, you just need the Units eCalendario.component.pas and eCalendario.component.fmx. You can download the zipped source code (the released one is more suitable) and add to your project or you can use [Boss](https://github.com/HashLoad/boss), using the following commands:

Start a new project (create the boss.json file and manage your dependencies)

> ` Boss init `

And then use the following command to install eCalendario as a dependency
> ` Boss install https://github.com/rafael-figueiredo-alves/eCalendario `

Now you can follow the instructions below to add the component to your project, not forgetting to add the eCalendario.Component.pas to your Uses.

# How to add eCalendario to a form in your project

The first thing you need to do to start using eCalendario in your project is to put a **Tlayout** in a form with the properties **Height** set to at least *340* and **Width** to _300_.

![imagem do form com TLayout](https://github.com/rafael-figueiredo-alves/eCalendario/blob/main/img/TLayout.png)

Now, on the event `onCreate` (or on the event `onShow`), you need to use the following commands in the order I'll present to you:

> `TeCalendario.New(`**form reference where you added the TLayout** `, ` **TLayout where the calendar will be rendered**`)`

This command serves to create eCalendario, calling the class (that is an interfaced class) **TeCalendario** and calling the method New (that will instantiate the new class), and we need to set two parameters: the form that eCalendario will be placed, and the Tlayout where it will be rendered.

> `onClickDate(`**a Function to let the program knows what will happen any time you click on a day or change the month or year**`)`

This command needs to come after the method New to associate the method (action) that will be called any time you change the day, by clicking on a day, or changing the month or year. The parameter needs to be a  `function` with the following signature: `function function_name (Date: TDate);`

> `Locale(`**it only accepts one of these options:** *ptBr* | *EN* | *Espanol | *Fr* | *It* | *Ger* `)`

The command Locale is used to set the language of the calendar. Until the moment there are only two possibilities:
* **ptBr** - to set the calendar to Portuguese;
* **EN** - to set the calendar to English.
* **Espanol** - to set the calendar to Spanish.
* **It** - to set the calendar to Italian.
* **Fr** - to set the calendar to French.
* **Ger** - to set the calendar to German.

> `StartDate(`**It accepts only values of TDate or TDateTime type, like now()**`)`

The `StartDate` is used to set the current date (today) or the date that needs to be selected by default. It needs a parameter in a TDate or TDateTime type.

> `ShowCalendar;`

Annd here's the command that makes the calendar to be shown in our form insite the TLayout we set in the `New` method. Take a look at the complete example of how to use this component:

```Delphi
procedure TFormMain.FormCreate(Sender: TObject);
begin
  teCalendario.New(self, Layout1)
                .onClickDate(ExibeData)
                .Locale(ptBr)
                .StartDate(Now)
                .ShowCalendar;
end;

procedure TFormMain.ExibeData(Data: TDate);
begin
  Label1.Text := DateToStr(Data);
end;
```

# Customizing the calendar

If you want to customize the calendar, you can edit it directly in the eCalendario.Component.fmx or you can use the following script:

```Delphi
                .config
                  .BackgroundColor(talphaColors.Yellow)
                  .SundaysColor(talphacolors.Red)
                  .&End
```

The command `Config` lets you access the config options (only two available up to now). The `BackgroundColor()` method lets you set a background color to your calendar (that is white by default). The parameter must be TAlphaColors type. The `SundaysColor()` method is responsible to set the color of Sundays (that are blue by default). It accepts a parameter of TAlphaColors type. And the command `&End` closes the config interface and brings you back to the main interface of eCalendario. Take a look at the code snippet setting a basic customization:

```Delphi
procedure TFormMain.FormCreate(Sender: TObject);
begin
  teCalendario.New(self, Layout1)
                .onClickDate(ExibeData)
                .Locale(ptBr)
                .StartDate(Now)
                .config
                  .BackgroundColor(talphaColors.Yellow)
                  .SundaysColor(talphacolors.Red)
                  .&End
                .ShowCalendar;
end;
```

# Do you want to help?

Your contribution is welcomed, it can be to identify a bug (issues) or send a  Pull request. Feel free to contribute. And, if you want, share this project with anyone. I'll be very happy.

**Rafael de Figueiredo Alves**