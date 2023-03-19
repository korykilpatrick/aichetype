from flask import Flask, g
from db import db

def create_app():
    app = Flask(__name__)
    app.config.from_object('config.DevelopmentConfig')

    from app.routes import main_blueprint
    app.register_blueprint(main_blueprint)

    return app


# @app.teardown_appcontext
def teardown_db(exception=None):
    db.close()
