import React from 'react';
import { BrowserRouter as Router, Route, Routes, Link } from 'react-router-dom';

import Navbar from './components/Navbar';
import HomePage from './components/HomePage';
import About from './components/About';
import Projects from './components/Projects';
import ContactInfo from './components/ContactInfo';
import Bookshelf from './components/Bookshelf';
import './css/App.css';

const App = () => {
  return (
    <Router>
      <div className="container">
        <header>
          <h1 className="title"><Link to="/">AIchetype</Link></h1>
          {/*<h2 className="subtitle">Kory's Adventures in AI & Tech</h2>*/}
        </header>
        <Navbar />
        <Routes>
          <Route path="/" element={<HomePage />} />
          <Route path="/projects" element={<Projects />} />
          <Route path="/links" element={<Projects />} />
          <Route path="/bookshelf" element={<Bookshelf />} />
          <Route path="/about" element={<About />} />
        </Routes>
        <ContactInfo />
        <footer>
          <p>© {new Date().getFullYear()} Kory Kilpatrick. All rights reserved.</p>
        </footer>
      </div>
    </Router>
  );
};

export default App;
