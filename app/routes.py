from flask import Blueprint, jsonify, make_response, g
from db import dal

main_bp = Blueprint('main', __name__)
projects_bp = Blueprint('projects', __name__)
books_bp = Blueprint('books', __name__)

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

@books_bp.route('/api/books', methods=['GET'])
def get_books():
    books = dal.execute('select * from books',)
    book_list = [
        {
            'id': book.id,
            'created_at': book.created_at.isoformat(),
            'img_url': book.img_url,
            'title': book.title,
            'author': book.author,
            'author_link': book.author_link,
            'num_pages': book.num_pages,
            'date_added': book.date_added,
            'date_started': book.date_started,
            'date_read': book.date_read,
            'blurb': book.blurb,
            'rating': book.rating,
            'date_pub': book.date_pub,
            'book_link': book.book_link,
        }
    for book in books]
    return jsonify(book_list)

@projects_bp.route('/api/projects/<string:project_name>', methods=['GET'])
def get_project(project_name):
    project = dal.execute('SELECT * FROM projects WHERE name = %s', (project_name,), one_or_none=True)
    if not project:
        return jsonify({"error": "Project not found"}), 404

    response = make_response(jsonify({
        'id': project.id,
        'name': project.name,
        'description': project.description,
        'created_at': project.created_at
    }))
    response.headers['Content-Type'] = 'application/json'
    return response

