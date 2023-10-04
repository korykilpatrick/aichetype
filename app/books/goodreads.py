import requests
import re
from bs4 import BeautifulSoup
from collections import namedtuple, defaultdict

from db import dal
from db.models import Book, Bookshelf
import db.utils as db_utils

PROFILE_URL = f"https://www.goodreads.com/review/list/76731654-kory-kilpatrick"

def format_title_for_comparison(t1):
    return t1.lower().replace(' ', '').replace(':', '').replace('-', '').replace('_', '').replace('.', '').replace('!', '').replace('?', '')

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

def get_books_from_goodreads(url, page=1):
    response = requests.get(f"{url}&page={page}")
    soup = BeautifulSoup(response.text, 'html.parser')
    return [extract_book_info(row) for row in soup.select('tr.bookalike.review')]

def get_book_ids_from_shelves(profile_url, shelf, book_id_lookup, page=1):
    url = f"{profile_url}?&shelf={shelf}&page={page}"
    response = requests.get(url)
    soup = BeautifulSoup(response.text, 'html.parser')
    book_ids = []
    for row in soup.select('tr.bookalike.review'):
        title = row.select_one('td.field.title a').text.strip().lower()
        formatted_title = format_title_for_comparison(title)
        if formatted_title in book_id_lookup:
            book_ids.append(book_id_lookup[formatted_title])
        else:
            print(f"Book not found: {title}")
    return book_ids


def save_books(profile_url=PROFILE_URL):
    # specifying shelves because I have stale stuff in my 'Want to Read' shelf
    for shelf in ['currently-reading', 'read']:
        print('shelf', shelf)
        i = 1
        shelf_url = profile_url + f"?shelf={shelf}"
        while True:
            books = get_books_from_goodreads(shelf_url, page=i)
            if not books:
                break
            i += 1
    db_utils.insert_records(dal, 'books', books, many=True, ignore=True)


def save_bookshelves(profile_url=PROFILE_URL):
    response = requests.get(profile_url)
    soup = BeautifulSoup(response.text, 'html.parser')
    shelves = []
    for s in soup.select('div.userShelf'):
        # also lists the number of books on the shelf, but not needed
        name = " ".join(s.text.strip().split(' ')[:-1]).strip()
        if name == 'Want to Read': continue
        shelves.append(Bookshelf(name))
    db_utils.insert_records(dal, 'bookshelves', shelves, many=True, ignore=True)

def save_books_shelves(profile_url=PROFILE_URL):
    # If any books are added to/removed from a shelf, insert/delete a record in the books_shelves table
    book_id_lookup = {format_title_for_comparison(b.title): b.id for b in dal.execute('select id, title from books')}
    shelves = dal.execute('select * from bookshelves')
    books_shelves = dal.execute('select * from books_shelves')
    shelf_book_lookup = defaultdict(list)
    for bs in books_shelves:
        shelf_book_lookup[bs.shelf_id].append(bs.book_id)
    
    inserts = []
    for shelf in shelves:
        print(shelf.name)
        i = 1
        while True:
            print('Inserts so far', inserts)
            book_ids = get_book_ids_from_shelves(profile_url, shelf.name, book_id_lookup, page=i)
            if not book_ids: break
            for bid in book_ids:
                if bid not in shelf_book_lookup[shelf.id]:
                    inserts.append((bid, shelf.id))
                elif bid in shelf_book_lookup[shelf.id]:
                    shelf_book_lookup[shelf.id].remove(bid)
            i += 1

        if shelf_book_lookup[shelf.id]:
            # book(s) were removed from this shelf
            print(f'deleting from {shelf.name}', shelf_book_lookup[shelf.id])
            dal.execute(f"delete from books_shelves where shelf_id={shelf.id} and book_id in ({','.join([str(i) for i in shelf_book_lookup[shelf.id]])})")

    if inserts:
        db_utils.insert_records(dal, 'books_shelves', inserts, many=True, ignore=True)

def update_all():
    # save_books()
    # save_bookshelves()
    save_books_shelves()

if __name__ == '__main__':
    update_all()