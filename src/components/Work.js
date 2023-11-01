import React, { useState } from 'react';
import { Container, Row, Button } from 'react-bootstrap';
import '../css/Work.css';
import WorkPost from './posts/WorkPost';
import ResumePost from './posts/ResumePost';

const Work = () => {
  const [currentView, setCurrentView] = useState('My Story');

  return (
    <Container style={{ marginTop: '20px', marginBottom: '20px' }}>
      <Row className="justify-content-center align-items-center button-row d-flex">
        <Button variant="outline-dark" className={`view-button ${currentView === 'My Story' ? 'active' : ''}`} onClick={() => setCurrentView('My Story')}>
          My Story
        </Button>
        <Button variant="outline-dark" className={`view-button ${currentView === 'Bullets' ? 'active' : ''}`} onClick={() => setCurrentView('Bullets')}>
          Resume
        </Button>
      </Row>
      <Row>
        {currentView === 'My Story' ? <WorkPost /> : <ResumePost />}
      </Row>
    </Container>
  );
};

export default Work;
