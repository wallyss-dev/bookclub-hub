"""Conexão com o PostgreSQL usando Psycopg.

nenhuma consulta SQL é implementada aqui, apenas a infraestrutura de conexão.
"""

from contextlib import contextmanager
from typing import Iterator

import psycopg

from backend.config import settings

def get_connection() -> psycopg.Connection:
    """Abre e retorna uma conexão com o banco PostgreSQL.

    O chamador é responsável por fechar a conexão, ou usar `connection_scope()`.
    """"

    return psycopg.connect(settings.database.dsn)

    @contextmanager
    def connection_scope() -> Iterator[psycopg.Connection]:
        """Context manager que abre, entrega e fecha a conexão automaticamente."""
        conn = get_connection()
        try:
            yield conn
            conn.commit()
        except Exception:
            conn.rollback()
            raise
        finally:
            conn.close()


def check_connection() -> bool:
    """Verifica se o banco está acessível. Retorna True/False."""
    try:
        with connection_scope():
            return True
    except Exception:
        return False