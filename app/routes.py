from flask import Blueprint, jsonify, make_response, g
from db import dal

main_bp = Blueprint('main', __name__)
projects_bp = Blueprint('projects', __name__)

@main_bp.route('/api', methods=['GET'])
def get_data():
    # sample_data = {
        # 'message': 'Hello, world!'
    # }
    sample_data = dal.execute('select * from books limit 10',)
    return jsonify(sample_data)


@projects_bp.route('/api/projects', methods=['GET'])
def get_projects():
    projects = dal.execute('select * from projects',)
    response = make_response(jsonify([{
        'id': project.id,
        'name': project.name,
        'description': project.description,
        'created_at': project.created_at
    } for project in projects]))
    response.headers['Content-Type'] = 'application/json'
    return response