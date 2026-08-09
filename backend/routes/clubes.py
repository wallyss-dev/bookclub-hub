from fastapi import APIRouter, HTTPException
from pydantic import BaseModel, Field

from backend.services import clubes_service

route = APIRouter(prefix="/clubes", tags=["clubes"])

class ClubeCreate(BaseModel):
    nome: str = Field(min_length=1, max_length=120)