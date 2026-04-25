from supabase import create_client, Client
import os

SUPABASE_URL = os.environ.get("SUPABASE_URL")
SUPABASE_KEY = os.environ.get("SUPABASE_KEY")

supabase: Client = create_client(SUPABASE_URL, SUPABASE_KEY)

def insertar_usuario(usuario_hash: str, contrasena_hash: str) -> dict:
    try:
        response = supabase.table("usuarios").insert({
            "usuario": usuario_hash,
            "contrasena": contrasena_hash
        }).execute()
        if response.data:
            return {"status": "success", "user_id": response.data[0]["id"]}
        else:
            return {"status": "error", "message": str(response.error)}
    except Exception as e:
        return {"status": "error", "message": str(e)}

def consultar_usuario(usuario_hash: str, contrasena_hash: str) -> dict:
    try:
        response = supabase.table("usuarios").select("*")\
            .eq("usuario", usuario_hash)\
            .eq("contrasena", contrasena_hash)\
            .execute()
        if response.data:
            return {"status": "success", "user_id": response.data[0]["id"]}
        else:
            return {"status": "error", "message": "Credenciales inválidas"}
    except Exception as e:
        return {"status": "error", "message": str(e)}

def insertar_perfil(usuario_id: int, nombre: str, fecha_nacimiento: str) -> dict:
    try:
        response = supabase.table("datos_user").insert({
            "usuario_id": usuario_id,
            "nombre": nombre,
            "fecha_nacimiento": fecha_nacimiento
        }).execute()
        if response.data:
            return {"status": "success", "perfil_id": response.data[0]["id"]}
        else:
            return {"status": "error", "message": str(response.error)}
    except Exception as e:
        return {"status": "error", "message": str(e)}
