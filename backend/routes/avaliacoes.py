from fastapi import APIRouter

from backend.services import avaliacies_service

router = APIRouter(prefix="/avaliacoes", tags=["avaliacoes"])

@router.get("")
def listar() -> list[dict]:
    """Listagem de avalizacoes. Implementar quando o banco for integrado."""
    return avaliacoes_service.listar()