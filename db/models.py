from collections import namedtuple 

Book = namedtuple('Book', ['img_url', 'img_url_small', 'title', 'book_link', 'author', 'author_link', 'num_pages', 'avg_rating', 'num_ratings', 'date_pub', 'rating', 'blurb', 'date_added', 'date_started', 'date_read'])
Bookshelf = namedtuple('Bookshelf', ['name'])