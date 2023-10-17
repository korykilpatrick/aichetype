import React from 'react';
import { Link } from 'react-router-dom';
import '../css/Navbar.css';

const Navbar = () => {
  return (
    <nav className="navbar">
      <ul>
        {/* <li>
          <Link to="/posts">Posts</Link>
        </li>
        <li>
          <Link to="/work">Work</Link>
        </li>
        <li>
          <Link to="/links">Links</Link>
        </li> */}
        <li>
          <Link to="/bookshelf">Bookshelf</Link>
        </li>
        <li>
          <Link to="/about">About</Link>
        </li>
      </ul>
    </nav>
  );
};

export default Navbar;
