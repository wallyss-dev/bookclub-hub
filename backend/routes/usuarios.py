
from fastapi import APIRouter

from backend.services import usuarios_service

router = APIRouter(prefix="/usuarios", tags=["usuarios"])


@router.get("")
def listar() -> list[dict]:
    """Listagem de usuarios. Implementar quando o banco for integrado."""
    return usuarios_service.listar()