import React, { useEffect, useState } from 'react';
import '../css/Bookshelf.css';

const Bookshelf = () => {
  const [books, setBooks] = useState([]);

  useEffect(() => {
    fetch('/api/books')
      .then((response) => response.json())
      .then((data) => setBooks(data));
  }, []);

  return (
    <div className="bookshelf">
      <h2>Koreads</h2>
      <ul className="book-list">
        {books.map((book) => (
          <li key={book.id} className="book-item">
            <img src={book.img_url} alt={book.title} className="book-image" />
            <div className="book-info">
              <a href={book.book_url} target="_blank"><h3>{book.title}</h3></a>
              <p>Author: {book.author}</p>
              <p>Date Published: {book.publish_date}</p>
              <p>Rating: {book.rating}</p>
            </div>
          </li>
        ))}
      </ul>
    </div>
  );
};

export default Bookshelf;
