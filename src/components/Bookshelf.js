import React, { useEffect, useState } from 'react';
import '../css/Bookshelf.css';

const Bookshelf = () => {
  const [books, setBooks] = useState([]);
  const booksPerRow = 10 // Adjust this number based on how many books you want in a row

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

  const renderRow = (rowBooks) => {
    return rowBooks.map((book) => (
        <div key={book.id} className="book-item">
          <a href={book.book_link} target="_blank" rel="noopener noreferrer"><img src={book.img_url} alt={book.title} className="book-image" /></a>
          <div className="book-info">
            <p>Rating: {book.rating ? renderStars(book.rating) : 'N/A'}</p>
            <p>Date read: {book.date_read ? book.date_read : book.date_started}</p>
            {/* <p>Date Published: {book.date_pub}</p> */}
          </div>
        </div>
      ))
    };

  return (
    <div className="bookshelf" styles={{ backgroundImage: `url('/images/wood-texture.jpg')`}}>
      {Array.from({ length: Math.ceil(books.length / booksPerRow) }, (_, i) => {
        const start = i * booksPerRow;
        const end = start + booksPerRow;
        const rowBooks = books.slice(start, end);
        return (
          <div key={i} className="book-row">
            {renderRow(rowBooks)}
            <div className="shelf"></div>
          </div>
        );
      })}
    </div>
  );
};

export default Bookshelf;
