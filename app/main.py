from fastapi import FastAPI
from datetime import datetime

app = FastAPI(title="DevOps Code to Production Demo")

@app.get("/")
def read_root():
    return {
        "message": "Hello from FastAPI in Azure!",
        "timestamp": datetime.utcnow().isoformat() + "Z"
    }

@app.get("/health")
def health_check():
    return {"status": "ok"}
