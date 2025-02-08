# main.py
from fastapi import FastAPI
from fastapi.responses import PlainTextResponse

app = FastAPI()


@app.get("/", response_class=PlainTextResponse)
async def read_root():
    return "Homepage"


@app.get("/healthz", response_class=PlainTextResponse)
async def health_route():
    return "health"

@app.get("/myroute", response_class=PlainTextResponse)
async def my_route():
    return "Hello, World!"


# Run the application:
# uvicorn main:app --host 0.0.0.0 --port 8000 --reload
