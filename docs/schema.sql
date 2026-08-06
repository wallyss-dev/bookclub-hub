""" Tabelas passadas da modelagem para a sintaxe PostgreSQL """

create database bookclub;

use bookclub;

create table usuarios(
    id_usuario int serial primary key,
    nome varchar(150) not null,
    email varchar(150) not null unique,
    senha_hash varchar(255) not null,
    criado_em timestamp
);

create table clubes(
    id_clube int serial primary key,
    nome varchar(150) not null,
    decricao varchar(),
    id_admin int not null,
    criado_em timestamp
);

create table membros(
    id_membro int serial primary key,
    id_clube int not null,
    id_usuario int not null,
    papel varchar(20) not null,
    entrou_em timestamp
);

create table livros(
    id_livro int serial primary key,
    titulo varchar() not null,
    id_autor int not null,
    id_categoria int not null,
    ano_publicacao date,
    sinopse text,
    capa_url varchar(255)
);

create table autores(
    id_autor int serial primary key,
    nome varchar(150) not null,
    biografia text
);

create table categorias(
    id_categoria int serial primary key,
    
);

create table leituras(

);

create table avalicoes(

);

create table sugestoes(

);

create table votos(

);

create table votacoes(

);

create table votacoes_opcoes(

);

create table encontros(

);

create table presencas(

);

