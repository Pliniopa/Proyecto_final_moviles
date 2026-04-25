from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from api_flutter import router

app = FastAPI()

# Configuración de CORS
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],  # puedes restringir a ["http://localhost:3000"] o la URL de tu app Flutter Web
    allow_credentials=True,
    allow_methods=["*"],  # permite GET, POST, PUT, DELETE, OPTIONS
    allow_headers=["*"],  # permite todos los headers
)

app.include_router(router)

if __name__ == "__main__":
    import uvicorn
    uvicorn.run("main:app", host="127.0.0.1", port=8000, reload=True)
