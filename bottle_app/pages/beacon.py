from app import app


@app.route("/api/beacon")
def index():
    from config import APP_BEACON_UID
    return APP_BEACON_UID
