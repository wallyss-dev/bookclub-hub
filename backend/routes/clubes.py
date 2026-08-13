from fastapi import APIRouter, HTTPException
from pydantic import BaseModel, Field

from backend.services import clubes_service

route = APIRouter(prefix="/clubes", tags=["clubes"])

class ClubeCreate(BaseModel):
    nome: str = Field(min_length=1, max_length=120)
    genero: str | None = Field(default=None, max_length=80)
    descricao: str | None = Field(default=None, max_length=2000)
    publico: boll = True

    @router.get("")
    def listar() -> list[dict]:
        """ """
        return clubes_service.listar()


    @router.get("/{registro_id}")
    def obter(registro_id: int) -> dict:
        """ """
        registro = clubes_service.obter(registro_id)
        if registro is None:
            raise HTTPException(status_code=404, detail="Clube não encontrado")
        return registro

    @router.post("", status_code=201)
    def criar(payload: ClubeCreate) -> dict:
        """ """
        return clubes_service.criar(payload.model_dump())