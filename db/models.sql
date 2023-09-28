
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
    title varchar(255) not null,
    book_link varchar(255),
    author varchar(255) not null,
    author_link varchar(255),
    num_pages int,
    avg_rating float,
    num_ratings int,
    date_pub varchar(30),
    rating int,
    review text,
    date_added varchar(30),
    date_started varchar(30),
    date_read varchar(30),
    created_at timestamp not null default now(),
    updated_at timestamp not null default now()
);