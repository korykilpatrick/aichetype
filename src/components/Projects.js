import React, { useState, useEffect } from 'react';
import axios from 'axios';
import { Link } from 'react-router-dom';
import postData from './../postData.json';
import '../css/Projects.css';

const Projects = () => {
  return (
    <div className="projects-container">
      <h2>Projects</h2>
      <div>
        {postData.map((post, index) => (
          <ul key={index}>
            <Link to={`/${post.endpoint}`}>{post.name}</Link>
          </ul>
        ))}
      </div>
    </div>
  );
};

export default Projects;
