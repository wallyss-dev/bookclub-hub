from fastapi import APIRouter

from backend.services import encontros_service

router = APIRouter(prefix="/encontros", tags=["encontros"])

@router.get("")
def listar() -> list[dict]:
    """ """
    return encontros_service.listar()