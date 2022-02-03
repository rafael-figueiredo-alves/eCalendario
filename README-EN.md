![logotipo](https://github.com/rafael-figueiredo-alves/eCalendario/blob/main/img/logo.png)

![Informações sobre projeto](https://img.shields.io/badge/Delphi%20Version-10.4.2%20Community-brightgreen))
![Status do projeto](https://img.shields.io/badge/Project's%20status-Version%201.0%20released-brightgreen)
![Versão](https://img.shields.io/badge/Project's%20version-1.0-brightgreen)
![estrelas do projeto](https://img.shields.io/github/stars/rafael-figueiredo-alves/eCalendario?style=flat-square)
![Linhas](https://tokei.rs/b1/github/rafael-figueiredo-alves/eCalendario?color=red&category=lines&style=flat-square)
![Mais linhas](https://tokei.rs/b1/github/rafael-figueiredo-alves/eCalendario?color=green&category=code&style=flat-square)
![arquivos](https://tokei.rs/b1/github/rafael-figueiredo-alves/eCalendario?color=yellow&category=files&style=flat-square)

Você pode ler estas informações em Português [clicando aqui](https://github.com/rafael-figueiredo-alves/eCalendario/blob/main/README.md).

**Description:** a firemonkey Delphi component that is easy to implement in any of the Firemonkey framework platforms compiles for (Windows 32-bit, Windows 64-bit, MacOS, iOS, Linux, Android). The goal is to be a simple customizable calendar to be implemented at runtime (it doesn't work at Design time).

![imagem do componente em inglês](https://github.com/rafael-figueiredo-alves/eCalendario/blob/main/img/img_componente.png) ![imagem do componente em português](https://github.com/rafael-figueiredo-alves/eCalendario/blob/main/img/img_componente_portugues.png)

# Features

* Componente criado em runtime;
* Utiliza o conceito de interfaces;
* É personalizável;
* Possui animações e pode ser customizado de formas simples
* Possui suporte para dois idiomas (Português e Inglês);
* Dispensa instalação de package, basta adicionar a unit ou usar o Boss para gerenciar as dependências (Recomendado);
* Componente estará em constante atualização para trazer novos recursos e fixes;
* Simples de usar.

# Como começar a usar o componente

Para começar a usar o eCalendário, você precisa apenas da Unit eCalendario.component.pas e do eCalendario.component.fmx. Você pode baixar o zip do código (ou mesmo do release que é mais recomendável) e adicionar no seu projeto ou utilizar o [Boss](https://github.com/HashLoad/boss), com os comandos abaixo:

Para iniciar o projeto (criar arquivo boss.json e poder controlar as dependências)

> ` Boss init `

Para instalar o eCalendario como dependência
> ` Boss install https://github.com/rafael-figueiredo-alves/eCalendario `

Depois basta usar o código da seção abaixo para utilizar e não esquecer de declarar a Unit eCalendario.Component.pas nas uses onde desejar usar o calendário.

# Como colocar o eCalendario no form do seu projeto

A primeira coisa a fazer para poder usar o eCalendario em um dos formulários do seu projeto, é colocar um **Tlayout** no form com as propriedades **Height** de pelo menos *340* e **Width** de pelo menos _300_.

![imagem do form com TLayout](https://github.com/rafael-figueiredo-alves/eCalendario/blob/main/img/TLayout.png)

Agora, no evento `onCreate` (pode ser também no `onShow`), você deverá utilizar os seguintes comandos na seguinte ordem:

> `TeCalendario.New(`**formulário ao qual calendario será vinculado** `, ` **layout onde o calendário será renderizado**`)`

Este comando serve para criar o eCalendario, chamando a classe (que é uma interface) TeCalendario e chamando o método New (que criará uma instância da classe), onde definiremos dois parametros: o formulário onde será usado o calendário, e o Tlayout onde será renderizado.

> `onClickDate(`**Função a ser acionada ao se clicar num dia ou ao trocar-se os meses e anos no calendário**`)`

Este comando deve vir após a criação para associar o método (ação) que será usado quando trocarmos a data, seja clicando numm dia, trocando o mês ou o ano. O parametro deve ser uma `function` com a seguinte assinatura: `function nome_da_função (Data: TDate);`

> `Locale(`**aceita apenas os valores:** *ptBr* | *EN* `)`

O comando Locale é usado para definir o idioma do calendário. Até o momento há apenas duas possibilidades:
* **ptBr** - Para definir o calendário na língua portuguesa;
* **EN** - Para definir o calendário na língua inglesa.

> `StartDate(`**aceita um valor do tipo TDate ou TDateTime, como o now()**`)`

O `StartDate` é usado para definir a data atual (o hoje) ou a data que deve estar selecionada por padrão. Deve receber um parametro no formato TDate ou TDateTime.

> `ShowCalendar;`

É este último comando que realiza a mágica de exibir um calendário no nosso formulário dentro do layout definido no método `New`. Veja abaixo um exemplo de código para usar o eCalendario usando o que foi apresentado:

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

# Configurando o calendário

Se desejar personalizar o calendário, pode-se editar diretamente no arquivo eCalendario.Component.fmx ou pode-se usar o seguinte código:

```Delphi
                .config
                  .BackgroundColor(talphaColors.Yellow)
                  .SundaysColor(talphacolors.Red)
                  .&End
```

O comando `Config` permite abrir as opções de edição (por enquanto apenas duas disponíveis). Em `BackgroundColor()`, você congfigura a cor de fundo do calendário (que é branco por padrão), sendo que o parametro a ser usado deve ser do tipo TAlphaColors. O comando `SundaysColor()` é o responsável por definir a cor dos domingos no calendário (que por padrão é azul). Aceita parametro do tipo TAlphaColors. O comando `&End` sai da interface de configuração e volta para a principal. Veja o trecho do Código abaixo com a adição de uma customização simples:

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