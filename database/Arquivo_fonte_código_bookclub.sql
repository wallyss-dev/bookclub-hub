CREATE TABLE "usuarios" (
  "id_usuario" serial PRIMARY KEY,
  "nome" varchar(150) NOT NULL,
  "email" varchar(150) UNIQUE NOT NULL,
  "senha_hash" varchar(255) NOT NULL,
  "criado_em" timestamp DEFAULT (now())
);

CREATE TABLE "clubes" (
  "id_clube" serial PRIMARY KEY,
  "nome" varchar(150) NOT NULL,
  "descricao" text,
  "id_admin" int NOT NULL,
  "criado_em" timestamp DEFAULT (now())
);

CREATE TABLE "membros" (
  "id_membro" serial PRIMARY KEY,
  "id_clube" int NOT NULL,
  "id_usuario" int NOT NULL,
  "papel" varchar(20) NOT NULL DEFAULT 'leitor',
  "entrou_em" timestamp DEFAULT (now())
);

CREATE TABLE "autores" (
  "id_autor" serial PRIMARY KEY,
  "nome" varchar(150) NOT NULL,
  "biografia" text
);

CREATE TABLE "categorias" (
  "id_categoria" serial PRIMARY KEY,
  "nome" varchar(80) UNIQUE NOT NULL
);

CREATE TABLE "livros" (
  "id_livro" serial PRIMARY KEY,
  "titulo" varchar(200) NOT NULL,
  "id_autor" int NOT NULL,
  "id_categoria" int,
  "ano_publicacao" int,
  "sinopse" text,
  "capa_url" varchar(255)
);

CREATE TABLE "leituras" (
  "id_leitura" serial PRIMARY KEY,
  "id_clube" int NOT NULL,
  "id_livro" int NOT NULL,
  "data_inicio" date,
  "data_fim" date,
  "status" varchar(20) NOT NULL DEFAULT 'em_andamento'
);

CREATE TABLE "encontros" (
  "id_encontro" serial PRIMARY KEY,
  "id_leitura" int NOT NULL,
  "data_hora" timestamp NOT NULL,
  "local_link" varchar(255),
  "descricao" text
);

CREATE TABLE "presencas" (
  "id_presenca" serial PRIMARY KEY,
  "id_encontro" int NOT NULL,
  "id_membro" int NOT NULL,
  "confirmado" boolean DEFAULT false,
  "presente" boolean DEFAULT false
);

CREATE TABLE "avaliacoes" (
  "id_avaliacao" serial PRIMARY KEY,
  "id_membro" int NOT NULL,
  "id_leitura" int NOT NULL,
  "nota" smallint NOT NULL,
  "comentario" text,
  "criado_em" timestamp DEFAULT (now())
);

CREATE TABLE "sugestoes" (
  "id_sugestao" serial PRIMARY KEY,
  "id_clube" int NOT NULL,
  "id_membro" int NOT NULL,
  "id_livro" int,
  "titulo_sugerido" varchar(200),
  "criado_em" timestamp DEFAULT (now())
);

CREATE TABLE "votacoes" (
  "id_votacao" serial PRIMARY KEY,
  "id_clube" int NOT NULL,
  "titulo" varchar(150) NOT NULL,
  "aberta" boolean DEFAULT true,
  "criado_em" timestamp DEFAULT (now())
);

CREATE TABLE "votacao_opcoes" (
  "id_opcao" serial PRIMARY KEY,
  "id_votacao" int NOT NULL,
  "id_sugestao" int NOT NULL
);

CREATE TABLE "votos" (
  "id_voto" serial PRIMARY KEY,
  "id_opcao" int NOT NULL,
  "id_membro" int NOT NULL,
  "criado_em" timestamp DEFAULT (now())
);

CREATE UNIQUE INDEX ON "membros" ("id_clube", "id_usuario");

CREATE INDEX ON "livros" ("titulo");

CREATE INDEX ON "leituras" ("id_clube");

CREATE UNIQUE INDEX ON "presencas" ("id_encontro", "id_membro");

CREATE UNIQUE INDEX ON "avaliacoes" ("id_membro", "id_leitura");

CREATE INDEX ON "votos" ("id_opcao");

CREATE INDEX ON "votos" ("id_membro");

COMMENT ON COLUMN "membros"."papel" IS 'admin ou leitor';

COMMENT ON COLUMN "leituras"."status" IS 'planejada, em_andamento, concluida';

COMMENT ON COLUMN "avaliacoes"."nota" IS 'CHECK (nota BETWEEN 1 AND 5)';

COMMENT ON COLUMN "sugestoes"."id_livro" IS 'preenchido se o livro já existe no catálogo';

COMMENT ON COLUMN "sugestoes"."titulo_sugerido" IS 'preenchido se for um livro novo';

ALTER TABLE "clubes" ADD FOREIGN KEY ("id_admin") REFERENCES "usuarios" ("id_usuario") DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE "membros" ADD FOREIGN KEY ("id_clube") REFERENCES "clubes" ("id_clube") DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE "membros" ADD FOREIGN KEY ("id_usuario") REFERENCES "usuarios" ("id_usuario") DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE "livros" ADD FOREIGN KEY ("id_autor") REFERENCES "autores" ("id_autor") DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE "livros" ADD FOREIGN KEY ("id_categoria") REFERENCES "categorias" ("id_categoria") DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE "leituras" ADD FOREIGN KEY ("id_clube") REFERENCES "clubes" ("id_clube") DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE "leituras" ADD FOREIGN KEY ("id_livro") REFERENCES "livros" ("id_livro") DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE "encontros" ADD FOREIGN KEY ("id_leitura") REFERENCES "leituras" ("id_leitura") DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE "presencas" ADD FOREIGN KEY ("id_encontro") REFERENCES "encontros" ("id_encontro") DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE "presencas" ADD FOREIGN KEY ("id_membro") REFERENCES "membros" ("id_membro") DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE "avaliacoes" ADD FOREIGN KEY ("id_membro") REFERENCES "membros" ("id_membro") DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE "avaliacoes" ADD FOREIGN KEY ("id_leitura") REFERENCES "leituras" ("id_leitura") DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE "sugestoes" ADD FOREIGN KEY ("id_clube") REFERENCES "clubes" ("id_clube") DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE "sugestoes" ADD FOREIGN KEY ("id_membro") REFERENCES "membros" ("id_membro") DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE "sugestoes" ADD FOREIGN KEY ("id_livro") REFERENCES "livros" ("id_livro") DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE "votacoes" ADD FOREIGN KEY ("id_clube") REFERENCES "clubes" ("id_clube") DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE "votacao_opcoes" ADD FOREIGN KEY ("id_votacao") REFERENCES "votacoes" ("id_votacao") DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE "votacao_opcoes" ADD FOREIGN KEY ("id_sugestao") REFERENCES "sugestoes" ("id_sugestao") DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE "votos" ADD FOREIGN KEY ("id_opcao") REFERENCES "votacao_opcoes" ("id_opcao") DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE "votos" ADD FOREIGN KEY ("id_membro") REFERENCES "membros" ("id_membro") DEFERRABLE INITIALLY IMMEDIATE;
