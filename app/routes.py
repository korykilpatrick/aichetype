from flask import Blueprint, jsonify, g
from db import db

main_blueprint = Blueprint('main', __name__)

@main_blueprint.route('/', methods=['GET'])
def get_data():
    # sample_data = {
        # 'message': 'Hello, world!'
    # }
    sample_data = db.execute('select * from books limit 10',)
    return jsonify(sample_data)
