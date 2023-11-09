import React, { lazy, Suspense } from 'react';
import { BrowserRouter as Router, Route, Routes, Link } from 'react-router-dom';

import Navbar from './components/Navbar';
import HomePage from './components/HomePage';
import Neuralink from './components/Neuralink';
import About from './components/About';
import Projects from './components/Projects';
import ProjectDetail from './components/ProjectDetails';
import ContactInfo from './components/ContactInfo';
import Bookshelf from './components/Bookshelf';
import Work from './components/Work';
import './css/App.css';
import postData from './postData.json';

const LazyComponent = (componentName) => {
  return lazy(() => import(`./components/posts/${componentName}`));
};

const App = () => {
  return (
    <Router>
    <header>
      <Link to="/">
        <img src="https://korykilpatrick-bucket.s3.us-west-1.amazonaws.com/numinousloop.png" alt="Home" className="home-button"/>
      </Link>
    </header>
      <div className="app-container">
        <Navbar />
        <Suspense fallback={<div>Loading...</div>}>
          <Routes>
            {/* <Route path="/" element={<HomePage />} /> */}
            <Route path="/" element={<Neuralink />} />
            <Route path="/neuralink" element={<Neuralink />} />
            <Route path="/work" element={<Work />} />
            {postData.map((post, index) => (
              <Route
                key={index}
                path={`/${post.endpoint}`}
                element={React.createElement(LazyComponent(post.component))}
              />
            ))}
            {/* <Route path="/links" element={<Projects />} /> */}
            <Route path="/bookshelf" element={<Bookshelf />} />
            <Route path="/about" element={<About />} />
          </Routes>
        </Suspense>
        {/* <ContactInfo /> */}
        <footer className='footer'>
          {/* <p>All text licensed under the <a href="http://creativecommons.org/licenses/by-nc/4.0/" target="_blank">Creative Commons Attribution-NonCommercial 4.0 International License</a></p> */}
          <p>All text licensed under the <em>I'll Figure This Out If And When I Need To</em> license.</p>
        </footer>
      </div>
    </Router>
  );
};

export default App;
