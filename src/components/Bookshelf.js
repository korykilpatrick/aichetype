import React, { useEffect, useState } from 'react';
import '../css/Bookshelf.css';

const Bookshelf = () => {
  const [books, setBooks] = useState([]);

  useEffect(() => {
    fetch('/api/books')
      .then((response) => response.json())
      .then((data) => setBooks(data));
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

  return (
    <div className="bookshelf">
      <h2>Koreads</h2>
      <ul className="book-list">
        {books.map((book) => (
          <li key={book.id} className="book-item">
            <a href={book.book_link} target="_blank"><img src={book.img_url} alt={book.title} className="book-image" /></a>
            <div className="book-info">
              <a href={book.book_url} target="_blank"><h3><a href={book.book_link} target="_blank">{book.title}</a></h3></a>
              <p>Author: <a href={book.author_link} target="_blank">{book.author}</a></p>
              <p>Date read: {book.date_read ? book.date_read : book.date_started}</p>
              <p>Rating: {book.rating? renderStars(book.rating) : 'N/A'}</p>
              <p>Date Published: {book.date_pub}</p>
            </div>
          </li>
        ))}
      </ul>
    </div>
  );
};

export default Bookshelf;
