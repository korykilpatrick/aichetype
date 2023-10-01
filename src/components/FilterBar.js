import React, { useState, useEffect } from 'react';
import '../css/FilterBar.css';

const FilterBar = ({ setFilteredBooks, books }) => {
  const [selectedShelf, setSelectedShelf] = useState('All');
  const [selectedOrder, setSelectedOrder] = useState('Most Recently Read');
  const [isInverted, setIsInverted] = useState(false);
  const [shelves, setShelves] = useState([]);

  useEffect(() => {
    const uniqueShelves = new Set();
    books.forEach(book => {
      book.shelves.forEach(shelf => {
        uniqueShelves.add(shelf.shelf_name);
      });
    });
    const sortedShelves = Array.from(uniqueShelves).sort((a, b) => {
      if (a === 'currently-reading') return -1;
      if (b === 'currently-reading') return 1;
      if (a === 'read') return -1;
      if (b === 'read') return 1;
      return a.localeCompare(b);
    });
    setShelves(sortedShelves);
  }, [books]);

  useEffect(() => {
    let filtered = [...books];

    if (selectedShelf !== 'All') {
      filtered = filtered.filter(book => book.shelves.some(shelf => shelf.shelf_name === selectedShelf));
    }

    switch (selectedOrder) {
      case 'Most Recently Read':
        filtered.sort((a, b) => new Date(b.date_read) - new Date(a.date_read));
        break;
        case 'Date Published':
            filtered.sort((a, b) => {
              const yearA = a.date_pub.match(/-?\d{3,4}/) ? a.date_pub.match(/-?\d{3,4}/)[0] : null;
              const yearB = b.date_pub.match(/-?\d{3,4}/) ? b.date_pub.match(/-?\d{3,4}/)[0] : null;
          
              if (yearA && yearB) {
                return yearB - yearA;
              } else if (yearA) {
                return -1;
              } else if (yearB) {
                return 1;
              }
              return 0;
            });
            break;
          
      case 'Title':
        filtered.sort((a, b) => a.title.localeCompare(b.title));
        break;
      case 'Author':
        filtered.sort((a, b) => a.author.localeCompare(b.author));
        break;
      case 'Rating':
        filtered.sort((a, b) => b.rating - a.rating);
        break;
      default:
        break;
    }

    if (isInverted) {
      filtered.reverse();
    }

    setFilteredBooks(filtered);
  }, [selectedShelf, selectedOrder, isInverted, books]);

  return (
    <div className="filter-bar">
      <select onChange={e => setSelectedShelf(e.target.value)}>
        <option>All</option>
        {shelves.map((shelf, index) => (
          <option key={index}>{shelf}</option>
        ))}
      </select>
      <select onChange={e => setSelectedOrder(e.target.value)}>
        <option>Most Recently Read</option>
        <option>Date Published</option>
        <option>Title</option>
        <option>Author</option>
        <option>Rating</option>
      </select>
      <button onClick={() => setIsInverted(!isInverted)}>
        {isInverted ? '↓' : '↑'}
      </button>
    </div>
  );
};

export default FilterBar;
