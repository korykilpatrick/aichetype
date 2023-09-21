import React, { useState, useEffect } from 'react';
import axios from 'axios';
import { Link } from 'react-router-dom';
import postData from './../postData.json';


const Projects = () => {
  const [projects, setProjects] = useState([]);

  return (
    <div>
      <h2>Projects</h2>
      <div>
        {postData.map((post, index) => (
          <ul key={index}>
              <Link to={`/${post.component}`}>{post.name}</Link>
          </ul>
        ))}
      </div>
    </div>
  );
};

export default Projects;
