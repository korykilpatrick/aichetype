from flask import Flask, g
from flask_cors import CORS
from db import dal

def create_app():
    app = Flask(__name__)
    app.config.from_object('config.DevelopmentConfig')

    from app.routes import main_bp, projects_bp
    app.register_blueprint(main_bp)
    app.register_blueprint(projects_bp)
    CORS(app)

    return app


# @app.teardown_appcontext
def teardown_db(exception=None):
    dal.close()
