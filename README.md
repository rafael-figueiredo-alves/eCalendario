![logotipo](https://github.com/rafael-figueiredo-alves/eCalendario/blob/main/img/logo.png)

![Informações sobre projeto](https://img.shields.io/badge/Vers%C3%A3o%20do%20Delphi-10.4.2%20Community-brightgreen)
![Status do projeto](https://img.shields.io/badge/Status%20do%20projeto-Vers%C3%A3o%201.0%20finalizada-brightgreen)
![Versão](https://img.shields.io/badge/Vers%C3%A3o%20do%20Projeto-1.0-brightgreen)
![estrelas do projeto](https://img.shields.io/github/stars/rafael-figueiredo-alves/eCalendario?style=flat-square)
![Linhas](https://tokei.rs/b1/github/rafael-figueiredo-alves/eCalendario?color=red&category=lines&style=flat-square)
![Mais linhas](https://tokei.rs/b1/github/rafael-figueiredo-alves/eCalendario?color=green&category=code&style=flat-square)
![arquivos](https://tokei.rs/b1/github/rafael-figueiredo-alves/eCalendario?color=yellow&category=files&style=flat-square)

You can read this Readme.md in English if you want by [clicking here](https://github.com/rafael-figueiredo-alves/eCalendario/blob/main/README-EN.md).

**Descrição:** Componente Delphi Firemonkey que pode ser facilmente implementado em todas as plataformas que o framework Firemonkey compila (Windows 32-bit, Windows 64-bit, MacOS, iOS, Linux, Android). O objetivo é ser um calendário simples de ser implementado em runtime (este componente não funciona em Design time).

![imagem do componente em inglês](https://github.com/rafael-figueiredo-alves/eCalendario/blob/main/img/img_componente.png) ![imagem do componente em português](https://github.com/rafael-figueiredo-alves/eCalendario/blob/main/img/img_componente_portugues.png)

# Features

* Componente criado em runtime;
* Utiliza o conceito de interfaces;
* É personalizável;
* Possui animações e pode ser customizado de formas simples
* Possui suporte para dois idiomas (Português e Inglês);
* Dispensa instalação de package, basta adicionar a unit ou usar o Boss para gerenciar as dependências (Recomendado);
* Simples de usar.

# Como começar a usar o componente

Para começar a usar o eCalendário, você precisa apenas da Unit eCalendario.component.pas e do eCalendario.component.fmx. Você pode baixar o zip do código (ou mesmo do release que é mais recomendável) e adicionar no seu projeto ou utilizar o [Boss](https://github.com/HashLoad/boss), com os comandos abaixo:

Para iniciar o projeto (criar arquivo boss.json e poder controlar as dependências)
> Boss init 

Para instalar o eCalendario como dependência
> Boss install https://github.com/rafael-figueiredo-alves/eCalendario 

Depois basta usar o código da seção abaixo para utilizar e não esquecer de declarar a Unit eCalendario.Component.pas nas uses onde desejar usar o calendário.

# Como colocar o eCalendario no form do seu projeto

A primeira coisa a fazer para poder usar o eCalendario em um dos formulários do seu projeto, é colocar um **Tlayout** no form com as propriedades **Height** de pelo menos *340* e **Width** de pelo menos _300_.

![imagem do form com TLayout](https://github.com/rafael-figueiredo-alves/eCalendario/blob/main/img/TLayout.png)