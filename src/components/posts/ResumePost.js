import React from 'react';
import { Container, Row, Col, Card } from 'react-bootstrap';
import { Link } from 'react-router-dom';
import '../../css/Resume.css';

const ResumePost = () => {
  return (
    <Container className="resume-container">
      <Row className="job-card">
        <Col>
          <Card>
            <Card.Body>
              <Card.Title className="mb-2 text-muted">Co-Founder/CEO <Link to="/betterdata">Better Data Solutions & Management LLC</ Link> </Card.Title>
              <Card.Text>
                Oct 2019 - Dec 2021 · 2 yrs 3 mos
                <ul>
                  <li>Built a B2B SaaS company that provides end-to-end services for clients in a niche high-frequency trading market.</li>
                  <li>Worked on every facet of a full-stack software product responsible for nearly $1B in trades in its first 2.5 years.</li>
                  <li>Led all aspects of developing a new business.</li>
                  <li>Established and developed client relationships.</li>
                </ul>
              </Card.Text>
            </Card.Body>
          </Card>
        </Col>
      </Row>

      <Row className="job-card">
        <Col>
          <Card>
            <Card.Body>
              <Card.Title><Link to="/poker">Professional Poker Player</Link></Card.Title>
              <Card.Text>
                2007 - 2017 · 10 yrs
                <ul>
                  <li>World Series of Poker winner</li>
                  <li>$4m+ in tournament winnings</li>
                  <li>Long-term winner in high stakes online cash games</li>
                  <li>Extensive cross-disciplinary studies in game theory, logic, psychology, statistics, financial management and analysis, stress management</li>
                </ul>
              </Card.Text>
            </Card.Body>
          </Card>
        </Col>
      </Row>

      <Row className="job-card">
        <Col>
          <Card>
            <Card.Body>
              <Card.Title>Poker Coach/Staker</Card.Title>
              <Card.Text>
                2008 - 2014 · 6 yrs
                <ul>
                  <li>Coached and staked players in mid-high stakes poker tournaments and cash games.</li>
                  <li>Facilitated regular performance reviews and training sessions.</li>
                  <li>Worked with players to outline goals, expectations, strengths, and areas of growth.</li>
                  <li>Managed scheduling and finances.</li>
                  <li>Players accumulated $5m+ in tournament winnings</li>
                </ul>
              </Card.Text>
            </Card.Body>
          </Card>
        </Col>
      </Row>
    </Container>
  );
};

export default ResumePost;
