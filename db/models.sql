
-- Models for Postgres database
create table projects (
    id serial primary key,
    name varchar(255) not null,
    description text,
    created_at timestamp not null default now(),
    updated_at timestamp not null default now()
);

create table books (
    id serial primary key,
    title varchar(255) not null,
    author varchar(255),
    img_url varchar(255),
    rating int,
    publish_date date,
    book_url varchar(255),
    create_date timestamp not null default now(),
);
)