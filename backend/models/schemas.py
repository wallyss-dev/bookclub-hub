"""Modelos de dados (somente representação — nenhuma migration é criada)."""

from dataclasses import dataclass
from datetime import date, datetime


@dataclass
class Clube:
    id: int
    nome: str
    genero: str
    descricao: str | None = None


@dataclass
class Livro:
    id: int
    titulo: str
    autor: str
    ano: int | None = None
    paginas: int | None = None
    genero: str | None = None


@dataclass
class Leitura:
    id: int
    clube_id: int
    livro_id: int
    inicio: date | None = None
    fim: date | None = None
    progresso: int = 0


@dataclass
class Encontro:
    id: int
    clube_id: int
    titulo: str
    data: datetime | None = None
    local: str | None = None


@dataclass
class Avaliacao:
    id: int
    livro_id: int
    usuario_id: int
    nota: int
    comentario: str | None = None


@dataclass
class Sugestao:
    id: int
    clube_id: int
    usuario_id: int
    titulo: str
    autor: str | None = None
    status: str = "em_analise"


@dataclass
class Votacao:
    id: int
    clube_id: int
    titulo: str
    encerra_em: date | None = None
    status: str = "aberta"


@dataclass
class Usuario:
    id: int
    nome: str
    email: str