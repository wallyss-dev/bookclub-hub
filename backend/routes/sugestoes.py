
from fastapi import APIRouter

from backend.services import sugestoes_service

router = APIRouter(prefix="/sugestoes", tags=["sugestoes"])


@router.get("")
def listar() -> list[dict]:
    """Listagem de sugestoes. Implementar quando o banco for integrado."""
    return sugestoes_service.listar()