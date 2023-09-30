
-- Models for Postgres database
create table projects (
    id serial primary key,
    name varchar(255) not null,
    description text,
    created_at timestamp not null default now(),
    updated_at timestamp not null default now()
);

-- make a sql model based on this python namedtuple: Book = namedtuple('Book', ['img_url', 'title', 'book_link', 'author', 'author_link', 'num_pages', 'avg_rating', 'num_ratings', 'date_pub', 'rating', 'review', 'date_added', 'date_started', 'date_read'])

create table books (
    id serial primary key,
    img_url varchar(255),
    img_url_small varchar(255),
    title varchar(255) not null,
    book_link varchar(255),
    author varchar(255) not null,
    author_link varchar(255),
    num_pages int,
    avg_rating float,
    num_ratings int,
    date_pub varchar(30),
    rating int,
    blurb text,
    date_added varchar(30),
    date_started varchar(30),
    date_read varchar(30),
    created_at timestamp not null default now(),
    updated_at timestamp not null default now()
);

-- Create the bookshelves table
CREATE TABLE bookshelves (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insert the shelves into the bookshelves table
INSERT INTO bookshelves (name) VALUES
('Read'),
('Currently Reading'),
('Want to Read'),
('all-time'),
('bio-neuro'),
('biography'),
('biz'),
('classics'),
('co-read'),
('cs'),
('fantasy'),
('fiction'),
('gave-up'),
('history'),
('non-fiction'),
('philosophy'),
('poetry'),
('productivity'),
('psychology'),
('randomly-pickup'),
('relationships'),
('sci-fi'),
('spirituality'),
('unfinished'),
('up-next');

-- Create the books_shelves join table
CREATE TABLE books_shelves (
    id SERIAL PRIMARY KEY,
    book_id INT REFERENCES books(id),
    shelf_id INT REFERENCES bookshelves(id),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE(book_id, shelf_id)
);
