from fastapi importAPIRouter

from backend.services import leituras_service

router = APIRouter(prefix="/leituras", tags=["leituras"])

@router.get("")
def listar() -> list[dict]:
    return leituras_service.listar()