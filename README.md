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


# BookClub-Hub

> Sistema de gestão completo para clubes de leitura.

O **BookClub-Hub** é uma plataforma criada para resolver um problema comum em clubes de leitura: a dificuldade de organizar membros, livros, leituras, encontros, avaliações e decisões do grupo utilizando ferramentas de comunicação que não foram projetadas para esse tipo de gestão.

Em vez de concentrar informações em centenas de mensagens de WhatsApp, Discord ou Telegram, o BookClub-Hub oferece um ambiente próprio para cada clube, centralizando os dados e transformando as atividades do grupo em informações organizadas e históricas.

---

## O problema

Clubes de leitura possuem alto nível de engajamento, mas frequentemente sofrem com falta de organização.

Entre os principais problemas estão:

* Histórico de livros perdido;
* Informações importantes misturadas às mensagens;
* Dificuldade para controlar membros e seus papéis;
* Falta de organização dos encontros;
* Presenças difíceis de acompanhar;
* Avaliações espalhadas;
* Sugestões de livros perdidas;
* Processo de escolha da próxima leitura pouco estruturado.

O resultado é que uma atividade criada para lazer pode se transformar em uma grande carga administrativa para quem gerencia o clube.

---

## A solução

O BookClub-Hub funciona como um **sistema de gestão para clubes de leitura**, inspirado no conceito de ERPs utilizados no ambiente corporativo.

Cada clube possui seu próprio ambiente, permitindo centralizar todas as informações importantes em um único painel.

### Principais funcionalidades

**Membros**

Controle dos membros do clube e de seus respectivos papéis.

**Livros**

Catálogo de livros com informações organizadas.

**Histórico de leituras**

Registro das obras já lidas e das leituras atualmente em andamento.

**Encontros**

Organização de reuniões com datas, horários e links.

**Presenças**

Controle de quem confirmou presença e quem efetivamente participou.

**Avaliações**

Registro das notas e opiniões dos membros após cada leitura.

**Sugestões**

Espaço estruturado para que os membros indiquem futuras leituras.

**Votações**

Sistema para organizar a escolha coletiva do próximo livro.

---

## Como funciona a escolha do próximo livro

Uma das partes centrais do sistema é o processo de decisão da próxima leitura.

O fluxo é estruturado em quatro etapas:

```text
Sugestões
    ↓
Votação
    ↓
Opções de votação
    ↓
Votos individuais
    ↓
Próxima leitura
```

Dessa maneira, a escolha deixa de depender de mensagens espalhadas e passa a fazer parte do histórico estruturado do clube.

O sistema registra as sugestões, organiza a votação, apresenta as opções e registra os votos individuais, permitindo transformar cada decisão em histórico e estatística.

---

## Arquitetura de dados

O BookClub-Hub utiliza uma **arquitetura de banco de dados relacional composta por 14 entidades**.

Entre as principais entidades estão:

```text
Usuários
   │
   ├── Clubes
   │      │
   │      └── Membros
   │
   ├── Livros
   │      │
   │      ├── Autores
   │      └── Categorias
   │
   ├── Leituras
   │
   ├── Encontros
   │      │
   │      └── Presenças
   │
   ├── Avaliações
   │
   ├── Sugestões
   │
   ├── Votações
   │      │
   │      └── Opções de votação
   │
   └── Votos
```

A entidade **Membros** possui papel fundamental no relacionamento entre usuários e clubes, permitindo que uma mesma pessoa tenha diferentes funções em diferentes clubes.

Por exemplo, um usuário pode ser um membro comum em um clube e administrador em outro.

---

## Fluxo principal

```text
Usuário
   │
   ▼
Entra em um Clube
   │
   ▼
Visualiza o catálogo
   │
   ▼
Participa de uma Leitura
   │
   ▼
Participa do Encontro
   │
   ▼
Registra Presença
   │
   ▼
Avalia o Livro
   │
   ▼
Sugere novas Leituras
   │
   ▼
Participa da Votação
   │
   ▼
Nova Leitura
```

Assim, o BookClub-Hub cria um ciclo contínuo de organização e histórico para o clube.

---

## Modelo de negócio

O BookClub-Hub utiliza um modelo **B2C baseado em SaaS (Software as a Service)**.

A receita é gerada por meio de uma mensalidade recorrente paga pelo clube.

Como o serviço é coletivo, o custo pode ser dividido entre os integrantes.

Por exemplo:

```text
Mensalidade: R$ 20,00
Membros:     10

Custo por membro:
R$ 20 / 10 = R$ 2,00
```

Esse modelo permite oferecer um custo individual baixo enquanto mantém uma receita recorrente e previsível para o negócio.

### Planos

| Plano   |           Capacidade | Público               |
| ------- | -------------------: | --------------------- |
| Básico  |        Até 5 membros | Grupos iniciantes     |
| Plus    | Até 10 ou 20 membros | Clubes em crescimento |
| Premium |   Membros ilimitados | Clubes maiores        |

Os planos acompanham o crescimento do clube, permitindo realizar upgrades conforme a quantidade de membros e o volume de histórico aumentam.

---

## Retenção

Um dos fatores estratégicos do produto é o valor acumulado pelo histórico.

Quanto mais tempo um clube utiliza a plataforma, maior é a quantidade de informações armazenadas: livros lidos, avaliações, encontros, presenças, sugestões e decisões.

Esse histórico cria uma forte relação de continuidade com a plataforma, tornando menos atrativo retornar a ferramentas de comunicação sem estrutura para gestão de dados.

---

## Visão

O objetivo do BookClub-Hub é se tornar o espaço definitivo para a leitura coletiva.

A proposta combina:

```text
Gestão
   +
Organização
   +
Histórico
   +
Colaboração
   +
Leitura
```

O resultado é uma experiência que une a complexidade necessária para administrar um clube à simplicidade esperada por seus membros.

---

## Roadmap

### Atualmente

* Modelagem do banco de dados;
* Estruturação das entidades;
* Definição dos fluxos de clubes;
* Organização de leituras;
* Organização de encontros;
* Sistema de avaliações;
* Sistema de sugestões;
* Sistema de votação.

### Futuramente

* Dashboard de métricas;
* Estatísticas de leitura;
* Histórico visual do clube;
* Notificações;
* Relatórios;
* Gamificação;
* Integrações externas;
* Aplicativo mobile;
* Recursos avançados para administradores.

---

## Contribuição

Contribuições são bem-vindas.

Para contribuir:

```bash
git clone <URL_DO_REPOSITORIO>
cd bookclub-hub
```

Crie uma branch:

```bash
git checkout -b feature/minha-feature
```

Faça suas alterações e registre o commit:

```bash
git add .
git commit -m "feat: adiciona minha feature"
```

Envie a branch:

```bash
git push origin feature/minha-feature
```

Depois, abra um Pull Request.

---

## Convenção de commits

Recomenda-se utilizar Conventional Commits:

```text
feat: nova funcionalidade

fix: correção de bug

docs: alteração na documentação

refactor: refatoração de código

test: alteração ou criação de testes

chore: tarefas de manutenção
```

Exemplo:

```bash
git commit -m "feat: adiciona sistema de votações"
```

---

## Status

**Em desenvolvimento.**

O projeto possui a modelagem técnica definida, a proposta de produto estruturada e um modelo de monetização baseado em assinatura recorrente.

---

## Licença

Este projeto está sob a licença `<LICENÇA>`.

Consulte o arquivo `LICENSE` para mais informações.

---

## BookClub-Hub

**O espaço definitivo para a leitura coletiva.**
