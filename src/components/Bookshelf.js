import React, { useEffect, useState } from 'react';
import FilterBar from './FilterBar';
import '../css/Bookshelf.css';

const Bookshelf = () => {
  const [books, setBooks] = useState([]);
  const [filteredBooks, setFilteredBooks] = useState([]);
  const booksPerRow = 5; // Adjust this number based on how many books you want in a row

  useEffect(() => {
    fetch('/api/books')
      .then((response) => response.json())
      .then((data) => {
        setBooks(data);
        setFilteredBooks(data);
      });
  }, []);

  const renderStars = (rating) => {
    const stars = [];
    for (let i = 0; i < 5; i++) {
      stars.push(
        <span key={i} className={i < rating ? 'star filled' : 'star'}>★</span>
      );
    }
    return stars;
  };

  const renderRow = (rowBooks) => {
    return rowBooks.map((book) => (
      <div key={book.id} className="book-item">
        <a href={book.book_link} target="_blank" rel="noopener noreferrer"><img src={book.img_url} alt={book.title} className="book-image" /></a>
        <div className="book-info">
          <p>{book.title}</p>
          <p><a href={book.book_link} target="_blank">{book.author}</a></p>
          <p>Rating: {book.rating ? renderStars(book.rating) : 'N/A'}</p>
          <p>Date read: {book.date_read ? book.date_read : book.date_added}</p>
          <p>Published: {book.date_pub}</p>
        </div>
      </div>
    ));
  };

  return (
    <div className="bookshelf">
      <FilterBar setFilteredBooks={setFilteredBooks} books={books} />
      <div className="bookshelf-container">
        {Array.from({ length: Math.ceil(filteredBooks.length / booksPerRow) }, (_, i) => {
          const start = i * booksPerRow;
          const end = start + booksPerRow;
          const rowBooks = filteredBooks.slice(start, end);
          return (
            <div key={i} className="book-row">
              {renderRow(rowBooks)}
              <div className="shelf"></div>
            </div>
          );
        })}
      </div>
    </div>
  );
};

export default Bookshelf;
