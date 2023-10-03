import requests
import re
from bs4 import BeautifulSoup
from collections import namedtuple

from db import dal
from db.models import Book
import db.utils as db_utils

def extract_book_info(row):
    img_url_small = row.select_one('td.field.cover img')['src']
    img_url = img_url_small.replace('i.gr-assets.com', 'images-na.ssl-images-amazon.com').replace('SY75', '').replace('SX50', '').replace('_', '').replace('..', '.').replace('l/', 'i/')
    title = row.select_one('td.field.title a').text.strip()
    book_link = 'https://www.goodreads.com' + row.select_one('td.field.title a')['href']
    author = row.select_one('td.field.author a').text.strip()
    author_link = 'https://www.goodreads.com' + row.select_one('td.field.author a')['href']
    num_pages_text = row.select_one('td.field.num_pages').text.strip()
    num_pages_regex = re.search(r'\d+', num_pages_text)
    num_pages = None if num_pages_text is None or num_pages_regex is None else int(num_pages_regex.group(0))
    avg_rating = float(row.select_one('td.field.avg_rating').text.strip().split()[-1])
    num_ratings = int(row.select_one('td.field.num_ratings').text.strip().split()[-1].replace(',', ''))
    date_pub = row.select_one('td.field.date_pub').text.replace('date pub', '').strip() if row.select_one('td.field.date_pub') else None
    rating_element = row.select_one('td.field.rating span.staticStars')
    if rating_element:
        stars = rating_element.find_all('span', {'class': 'staticStar p10'})
        rating = len(stars) if stars else None
    else:
        rating = None
    blurb = row.select_one('td.field.review').text.replace('review', '').strip() if row.select_one('td.field.review') else ''
    blurb = '' if blurb.lower() == 'none' else blurb
    date_added = row.select_one('td.field.date_added span').text.strip()
    date_started = row.select_one('td.field.date_started span.date_started_value').text.strip() if row.select_one('td.field.date_started span.date_started_value') else None
    date_read = row.select_one('td.field.date_read span').text.strip() if row.select_one('td.field.date_read span') else None
    date_read = None if date_read.lower() == 'not set' else date_read

    return Book(
        img_url, img_url_small, title, book_link, author, author_link, num_pages, avg_rating,
        num_ratings, date_pub, rating, blurb, date_added, date_started, date_read
    )

def get_books_from_goodreads(profile_url, page=1):
    response = requests.get(f"{profile_url}&page={page}")
    soup = BeautifulSoup(response.text, 'html.parser')
    return [extract_book_info(row) for row in soup.select('tr.bookalike.review')]

def get_books_from_shelves(profile_url, shelf, book_id_lookup, page=1):
    url = f"{profile_url}&shelf={shelf}&page={page}"
    response = requests.get(url)
    soup = BeautifulSoup(response.text, 'html.parser')
    book_ids = []
    for row in soup.select('tr.bookalike.review'):
        title = row.select_one('td.field.title a').text.strip()
        input(title)
        if title in book_id_lookup:
            book_ids.append(book_id_lookup[title])
    return book_ids

profile_url = f"https://www.goodreads.com/review/list/76731654-kory-kilpatrick?utf8=%E2%9C%93&ref=nav_mybooks"
# for shelf in ['currently-reading', 'read']:
#     i = 1
#     while True:
#         books = get_books_from_goodreads(profile_url, page=i)
#         if not books:
#             break
#         db_utils.insert_records(dal, 'books', books, many=True)
#         print(books[0].title)
#         i += 1
    

shelves = dal.execute('select * from bookshelves')
book_id_lookup = {b.title: b.id for b in dal.execute('select * from books')}
for shelf in shelves:
    print(shelf.name)
    i = 1
    while True:
        book_ids = get_books_from_shelves(profile_url, shelf.name, book_id_lookup, page=i)
        if not books:
            break
        records = [(id, shelf.id) for id in book_ids]
        db_utils.insert_records(dal, 'books_shelves', records, many=True)
        i += 1

