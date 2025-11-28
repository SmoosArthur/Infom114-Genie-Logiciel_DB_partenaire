from fastapi import FastAPI
import uvicorn

app = FastAPI(title="MarieYourJob API")

@app.get("/")
def read_root():
    return {"message": "MarieYourJob / ISM backend - OK"}

if __name__ == "__main__":
    uvicorn.run(app, host="0.0.0.0", port=8000)
