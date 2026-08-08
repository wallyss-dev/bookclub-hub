"""Registro central de rotas da API """

from fastapi import FastAPI

from backend.routes import (
    avaliacoes,
    clubes,
    encontros,
    leituras,
    livros,
    sugestoes,
    usuarios,
    votacoes,
)

ROUTER = [
    clubes.router,
    livros.router,
    leituras.router,
    encontros.router,
    avaliacoes.router,
    sugestoes.router,
    votacoes.router,
    usuarios.router,
]

def register_routes(app: FastAPI) -> None:
    for router in ROUTERS:
        app.include_router(router, prefix="/api")