# BookClub Hub

Sistema de gerenciamento de clubes de leitura.

O BookClub Hub foi desenvolvido para centralizar a administração de clubes de leitura em uma única plataforma. O sistema organiza membros, livros, leituras, encontros, presenças, avaliações, sugestões e votações, mantendo essas informações estruturadas e relacionadas em um banco de dados.

O projeto foi desenvolvido como parte do Projeto Integrador do SENAC.

## Problema

Clubes de leitura frequentemente dependem de ferramentas de comunicação como WhatsApp, Telegram ou Discord para organizar suas atividades. Essas ferramentas são adequadas para comunicação, mas não foram projetadas para administrar o ciclo completo de um clube.

Informações como:

* livro atualmente em leitura;
* histórico de leituras;
* participantes;
* encontros;
* presenças;
* avaliações;
* sugestões;
* votações;

acabam distribuídas entre conversas e diferentes aplicações.

O BookClub Hub concentra essas operações em um único sistema.

## Objetivo

O objetivo do projeto é fornecer uma estrutura centralizada para criação e administração de clubes de leitura.

Cada clube possui seu próprio ambiente, com seus membros, livros, leituras e atividades. Um usuário pode participar de múltiplos clubes, com acesso às informações relacionadas aos grupos dos quais faz parte.

## Funcionalidades

### Gerenciamento de clubes

* Criação de clubes
* Gerenciamento de membros
* Definição de administrador e leitores
* Convite de participantes
* Administração das informações do clube

### Gerenciamento de leituras

* Seleção do livro em leitura
* Controle do início e término da leitura
* Histórico de leituras
* Associação entre clubes e livros

### Encontros

* Agendamento de encontros
* Data e horário
* Local ou link da reunião
* Confirmação de presença
* Registro de participantes

### Avaliações

* Avaliação de leituras concluídas
* Notas de 1 a 5
* Registro das avaliações dos membros

### Sugestões e votações

* Sugestão de novos livros
* Criação de votações
* Definição das opções disponíveis
* Registro dos votos
* Escolha da próxima leitura

As funcionalidades acima são derivadas da proposta e das regras de negócio definidas no documento do projeto.

## Modelo de domínio

O sistema separa entidades de cadastro das entidades responsáveis pelas movimentações do clube.

Um livro, por exemplo, pertence ao catálogo e pode ser utilizado em diferentes leituras. A leitura representa a utilização daquele livro por um determinado clube em um determinado período.

A estrutura é composta por 14 entidades:

| Entidade         | Responsabilidade                       |
| ---------------- | -------------------------------------- |
| `usuarios`       | Cadastro de usuários                   |
| `clubes`         | Cadastro de clubes                     |
| `membros`        | Relacionamento entre usuários e clubes |
| `livros`         | Catálogo de livros                     |
| `autores`        | Cadastro de autores                    |
| `categorias`     | Categorias dos livros                  |
| `leituras`       | Controle das leituras                  |
| `encontros`      | Reuniões do clube                      |
| `presencas`      | Presença nos encontros                 |
| `avaliacoes`     | Avaliações das leituras                |
| `sugestoes`      | Sugestões de livros                    |
| `votacoes`       | Votações do clube                      |
| `votacao_opcoes` | Opções de uma votação                  |
| `votos`          | Registro dos votos                     |

## Regras de negócio

As regras principais definidas para o sistema incluem:

* Um usuário pode participar de vários clubes.
* Um usuário pode administrar um ou mais clubes.
* Cada clube possui um único administrador.
* Um clube pode possuir vários membros.
* Um membro pode possuir o papel de `Administrador` ou `Leitor`.
* Um clube pode possuir várias leituras ao longo do tempo.
* Um clube pode possuir somente uma leitura em andamento.
* Cada leitura pertence a um clube e a um único livro.
* Uma leitura pode possuir vários encontros.
* Apenas leituras concluídas podem receber avaliações.
* Avaliações possuem notas entre 1 e 5.
* Um membro pode votar apenas uma vez em cada votação.
* Apenas membros do clube podem registrar presença ou sugerir livros.
* Um membro pode confirmar presença apenas uma vez por encontro.

## Fluxo

O fluxo principal do sistema é definido da seguinte maneira:

```text
Usuário
   |
   v
Cria ou entra em um clube
   |
   v
Escolhe um livro
   |
   v
Inicia uma leitura
   |
   v
Agenda encontros
   |
   v
Registra presenças
   |
   v
Avalia o livro
   |
   v
Sugere novos livros
   |
   v
Realiza uma votação
   |
   v
Define a próxima leitura
```

Esse fluxo representa o ciclo de utilização do sistema: participação em um clube, execução de uma leitura, realização dos encontros, avaliação e definição da próxima leitura.

## Arquitetura de dados

O modelo foi estruturado para representar os relacionamentos e as regras do domínio.

A entidade `membros`, por exemplo, resolve o relacionamento muitos-para-muitos entre usuários e clubes e também armazena o papel do usuário dentro do clube.

Da mesma forma, `votos` registra a relação entre um membro e uma opção de votação, enquanto `votacao_opcoes` define quais alternativas fazem parte de uma votação.

Essa separação evita concentrar diferentes responsabilidades em uma única tabela e permite representar o histórico das operações realizadas pelo clube.

## Modelo de negócio

A proposta considera um modelo B2C utilizando SaaS.

A monetização seria baseada em planos mensais definidos de acordo com a quantidade de membros permitida em cada clube.

## Status

Este repositório contém o projeto desenvolvido para o Projeto Integrador do SENAC.

A documentação disponível define o domínio, as entidades, as regras de negócio e o fluxo esperado da aplicação. A implementação das funcionalidades deve seguir essas especificações.

## Projeto

**Aplicação:** `BookClub-Hub`
**Repositório:** `bookclub-hub`
**Categoria:** Projeto Integrador SENAC

## Licença

A licença do projeto ainda não foi definida.
