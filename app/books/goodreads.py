import requests
import re
from bs4 import BeautifulSoup
from collections import namedtuple, defaultdict

from db import dal
from db.models import Book, Bookshelf, BooksShelves
import db.utils as db_utils

PROFILE_URL = f"https://www.goodreads.com/review/list/76731654-kory-kilpatrick"

def format_title_for_comparison(t1):
    return t1.lower().replace(' ', '').replace(':', '').replace('-', '').replace('_', '').replace('.', '').replace('!', '').replace('?', '')

def get_goodreads_book_id(row):
    return int(row.find('div', {'class': 'js-tooltipTrigger tooltipTrigger'}).get('data-resource-id'))

def extract_book_info(row):
    goodreads_id = get_goodreads_book_id(row)
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
        goodreads_id, img_url, img_url_small, title, book_link, author, author_link, num_pages, avg_rating,
        num_ratings, date_pub, rating, blurb, date_added, date_started, date_read
    )

def get_books_from_goodreads(url, page=1):
    response = requests.get(f"{url}&page={page}")
    soup = BeautifulSoup(response.text, 'html.parser')
    return [extract_book_info(row) for row in soup.select('tr.bookalike.review')]

def save_books(saved_books, profile_url=PROFILE_URL):
    """ saved_books: dict of goodreads_id -> True
        Saves books to the database. 
        If saved_books is passed in, it will skip books that are already in the database
    """
    new_books = []
    # specifying shelves because I have stale stuff in my 'Want to Read' shelf
    for shelf in ['currently-reading', 'read']:
        print('shelf', shelf)
        i = 1
        shelf_url = profile_url + f"?shelf={shelf}"
        while True:
            shelf_books = get_books_from_goodreads(shelf_url, page=i)
            if not shelf_books:
                break

            for b in shelf_books:
                if saved_books.get(b.goodreads_id):
                    del saved_books[b.goodreads_id]
                else:
                    new_books.append(b)
            i += 1
    if saved_books:
        # delete books that are no longer on my shelves
        print('deleting books', saved_books)
        dal.execute(f"delete from books_shelves where book_id in ({','.join([str(b.id) for _, b in saved_books.items()])})")
        dal.execute(f"delete from books where goodreads_id in ({','.join([str(i) for i in saved_books.keys()])})")
    if new_books:
        db_utils.insert_records(dal, 'books', new_books, many=True, ignore=True)

def get_goodreads_ids_from_shelves(profile_url, shelf, page=1):
    url = f"{profile_url}?&shelf={shelf}&page={page}"
    response = requests.get(url)
    soup = BeautifulSoup(response.text, 'html.parser')
    return [get_goodreads_book_id(row) for row in soup.select('tr.bookalike.review')]

def save_bookshelves(saved_bookshelves, profile_url=PROFILE_URL):
    response = requests.get(profile_url)
    soup = BeautifulSoup(response.text, 'html.parser')
    shelves = []
    for s in soup.select('div.userShelf'):
        # also lists the number of books on the shelf, but not storing for atomicity purposes
        name = " ".join(s.text.strip().split(' ')[:-1]).strip().lower().replace(' ', '-')
        if name == 'want-to-read': continue
        elif not saved_bookshelves.get(name): 
            shelves.append(Bookshelf(name))
    db_utils.insert_records(dal, 'bookshelves', shelves, many=True, ignore=True)

def save_books_shelves(saved_books_shelves, bookshelves, profile_url=PROFILE_URL):
    # Create a lookup dictionary to map Goodreads IDs to book IDs
    books = dal.execute('select id as book_id, goodreads_id from books')
    book_id_lookup = {b.goodreads_id: b.book_id for b in books}
    goodreads_id_lookup = {b.book_id: b.goodreads_id for b in books}

    # Create a lookup dictionary to map shelf IDs to Goodreads IDs
    shelf_book_lookup = defaultdict(list)
    for bs in saved_books_shelves:
        shelf_book_lookup[bs.shelf_id].append(goodreads_id_lookup[bs.book_id])

    inserts = []
    for shelf_name, shelf in bookshelves.items():
        print(f"Processing shelf: {shelf_name}")
        i = 1
        while True:
            goodreads_ids = get_goodreads_ids_from_shelves(profile_url, shelf_name, page=i)
            if not goodreads_ids: 
                break

            for gid in goodreads_ids:
                if gid not in shelf_book_lookup[shelf.id] and gid in book_id_lookup:
                    inserts.append(BooksShelves(book_id_lookup[gid], shelf.id))
                elif gid in shelf_book_lookup[shelf.id]:
                    shelf_book_lookup[shelf.id].remove(gid)
            i += 1

        if shelf_book_lookup[shelf.id]:
            # Book(s) were removed from this shelf
            print(f'Deleting from {shelf.name}', shelf_book_lookup[shelf.id])
            book_ids_to_delete = [book_id_lookup[gid] for gid in shelf_book_lookup[shelf.id]]
            dal.execute(f"DELETE FROM books_shelves WHERE shelf_id = {shelf.id} AND book_id IN ({','.join(map(str, book_ids_to_delete))})")

    if inserts:
        db_utils.insert_records(dal, 'books_shelves', inserts, many=True, ignore=True)

def update_all():
    saved_books = {b.goodreads_id: b for b in dal.execute('select * from books')}
    saved_bookshelves = {b.name: b for b in dal.execute('select * from bookshelves')}
    saved_books_shelves = dal.execute('select * from books_shelves')
    save_books(saved_books)
    save_bookshelves(saved_bookshelves)
    save_books_shelves(saved_books_shelves, saved_bookshelves)

if __name__ == '__main__':
    update_all()