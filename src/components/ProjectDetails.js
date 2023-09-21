import React, { useState, useEffect } from 'react';
import { useParams } from 'react-router-dom';
import axios from 'axios';

const ProjectDetail = () => {
  const { projectName } = useParams();
  const [project, setProject] = useState({});

  useEffect(() => {
    const fetchProject = async () => {
      try {
        const response = await axios.get(`/api/projects/${projectName}`);
        setProject(response.data);
      } catch (error) {
        console.error('Error fetching project:', error);
      }
    };

    fetchProject();
  }, [projectName]);

  return (
    <div>
      <h2>{project.name}</h2>
      <p>{project.description}</p>
      {/* Add any other project details you'd like to display */}
    </div>
  );
};

export default ProjectDetail;

