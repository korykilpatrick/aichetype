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

from collections import defaultdict

@books_bp.route('/api/books', methods=['GET'])
def get_books():
    query = '''
    SELECT b.*, bs.shelf_id, s.name as shelf_name
    FROM books b
    LEFT JOIN books_shelves bs ON b.id = bs.book_id
    LEFT JOIN bookshelves s ON bs.shelf_id = s.id
    '''
    results = dal.execute(query)
    
    books_dict = defaultdict(list)
    for row in results:
        book_id = row.id
        if book_id not in books_dict:
            books_dict[book_id] = {
                'id': row.id,
                'created_at': row.created_at.isoformat(),
                'img_url': row.img_url,
                'title': row.title,
                'author': row.author,
                'author_link': row.author_link,
                'num_pages': row.num_pages,
                'date_added': row.date_added,
                'date_started': row.date_started,
                'date_read': row.date_read if row.date_read else row.date_added,
                'blurb': row.blurb,
                'rating': row.rating,
                'date_pub': row.date_pub,
                'book_link': row.book_link,
                'shelves': []
            }
        if row.shelf_id and row.shelf_name:
            books_dict[book_id]['shelves'].append({
                'shelf_id': row.shelf_id,
                'shelf_name': row.shelf_name
            })

    book_list = list(books_dict.values())
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

