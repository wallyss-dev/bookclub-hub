
from fastapi import APIRouter

from backend.services import votacoes_service

router = APIRouter(prefix="/votacoes", tags=["votacoes"])


@router.get("")
def listar() -> list[dict]:
    """Listagem de votacoes. Implementar quando o banco for integrado."""
    return votacoes_service.listar()