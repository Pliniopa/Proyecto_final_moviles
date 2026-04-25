from fastapi import APIRouter
from pydantic import BaseModel
from hash import generar_hash
from api_supabase import insertar_usuario, consultar_usuario, insertar_perfil

router = APIRouter()

class UserData(BaseModel):
    usuario: str
    contrasena: str
    nombre: str | None = None
    fecha_nacimiento: str | None = None

@router.post("/registrar")
def registrar(data: UserData):
    usuario_hash = generar_hash(data.usuario)
    contrasena_hash = generar_hash(data.contrasena)

    response = insertar_usuario(usuario_hash, contrasena_hash)

    if response.get("status") == "success":
        usuario_id = response["user_id"]

        if data.nombre and data.fecha_nacimiento:
            perfil_response = insertar_perfil(usuario_id, data.nombre, data.fecha_nacimiento)
            return {"status": "success", "user_id": usuario_id, "perfil": perfil_response}
        else:
            return {"status": "success", "user_id": usuario_id, "message": "Usuario creado sin perfil"}
    else:
        return {"status": "error", "message": response.get("message", "Error al registrar usuario")}

@router.post("/login")
def login(data: UserData):
    usuario_hash = generar_hash(data.usuario)
    contrasena_hash = generar_hash(data.contrasena)

    response = consultar_usuario(usuario_hash, contrasena_hash)
    if response.get("status") == "success":
        return {"status": "success", "user_id": response["user_id"]}
    return {"status": "error", "message": "Credenciales inválidas"}
