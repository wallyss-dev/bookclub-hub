import os
from dataclasses import dataclass

try:
    from dotenv import load_dotenv

    load_dotenv()
except ImportError: # pragma: no cover
    pass

@dataclass(frozen=True)
class DatabaseSettings:
    host:str
    port:str
    name:str
    user:str
    password:str

    @property
    def dsn(self) -> str:
        """String de conexão no formato aceito pelo Psycopg."""
        return (
            f"host={self.host} port={self.port} dbname={self.name} "
            f"user={self.user} password={self.password}"
        )

    @dataclass(frozen=True)
    class Settings:
        app_name: str
        debug: bool
        database: DatabaseSettings


def get_settings() -> Settings:
    return Settings(
        app_name=os.getenv("APP_NAME", "BookClub Hub API"),
        debug=os.getenv("APP_DEBUG", "True").lower() == "true",
        database=DatabaseSettings(
            host=os.getenv("DATABASE_HOST", ""),
            port=os.getenv("DATABASE_PORT", ""),
            name=os.getenv("DATABASE_NAME", ""),
            user=os.getenv("DATABASE_USER", ""),
            password=os.getenv("DATABASE_PASSWORD", ""),
        ),
    )

settings = get_settings()