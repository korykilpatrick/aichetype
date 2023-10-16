
-- Models for Postgres database
drop table if exists projects;
create table projects (
    id serial primary key,
    name varchar(255) not null,
    description text,
    created_at timestamp not null default now(),
    updated_at timestamp not null default now()
);

drop table if exists books_shelves;

drop table if exists books;
create table books (
    id serial primary key,
    goodreads_id int not null unique,
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
drop table if exists bookshelves;
CREATE TABLE bookshelves (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    -- count int,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create the books_shelves join table
CREATE TABLE books_shelves (
    id SERIAL PRIMARY KEY,
    book_id INT REFERENCES books(id),
    shelf_id INT REFERENCES bookshelves(id),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE(book_id, shelf_id)
);