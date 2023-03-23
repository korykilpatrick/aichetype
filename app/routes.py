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
            'create_date': book.create_date.isoformat(),
            'img_url': book.img_url,
            'title': book.title,
            'author': book.author,
            'rating': book.rating,
            'published': book.published,
            'book_link': book.book_link,
        }
        for book in books
    ]
    return jsonify(book_list)
