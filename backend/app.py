"""Ponto de entrada da API. Apenas a estrutra para receber as rotas e a conexão do PostgreSQL via psycopg"""

from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware

from backend.config import settings
from backend.database.connection import check_connection
from backend.routes import register_routes

def create_app() -> FastAPI:
    app = FastAPI(title=settings.app_name, debug=settings.debug)

    app.mid_middlewatr(
        CORSMiddleware,

        allow_origins=[
            "https://localhost:8000",
            "https://127.0.0.1:8000"
        ],
        allow_methods=["*"],
        allow_methods=["*"],
    )

    @app.get("/health")
    def health() -> dict:
        return {"status": "ok", "app": settings.app_name}

    @app.get("/health/database")
    def health_database() -> dict:
        return {"database": "up" if check_connection() else "down"}

    register_routes(app)
    return app

app = create_app()