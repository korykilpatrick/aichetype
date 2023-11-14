import React from 'react';
import { Container, Row, Col, Card } from 'react-bootstrap';
import { Link } from 'react-router-dom';
import '../../css/Resume.css';
import { Hoverable } from '../component_utilities';

const ResumePost = () => {
  return (
    <Container className="resume-container">
      <Row className="job-card">
        <Col>
          <Card>
            <Card.Body>
              <Card.Title>📈 <Link to='/sportsanalytics'>Sports Analytics and Betting Engineer</Link> <Hoverable text="I'm unfamiliar with job titles. I described what I do to ChatGPT and this is what it suggested 🤷"></Hoverable> <span className="work-dates">2022 - present</span></Card.Title>
              <Card.Text>
                <ul>
                  <li>Partner with professional bettors to write code to streamline workflow, develop novel betting algorithms, perform comprehensive data analysis </li>
                  <li>Software used to place millions in bets</li>
                  <li>Python, Postgres, MySQL, AWS, Web and messenger UIs</li>
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
              <Card.Title className="mb-2 text-muted">🤖 <Link to="/betterdata">Co-Founder/CEO Better Data Solutions & Management </ Link> <span className="work-dates">Oct 2019 - Dec 2021</span></Card.Title>
              <Card.Text>
                <ul>
                  <li>Built a B2B SaaS company that provides end-to-end services for clients in a niche high-frequency trading market</li>
                  <li>Led all aspects of developing a new business</li>
                  <li>Worked on every facet of a full-stack software product responsible for $1 billion in trades in its first 3 years</li>
                  <li>Python, MySQL, AWS, Bash</li>
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
              <Card.Title>🃏 <Link to="/poker">Professional Poker Player</Link>  <span className="work-dates">2007 - 2017</span></Card.Title>
              <Card.Text>
                <ul className='poker'>
                  <li>World Series of Poker winner</li>
                  <li>Long-term winner in high stakes online cash games</li>
                  <li>Earned enough money to retire by mid-20s<Hoverable text="this bullet makes me cringe, but profit is the only real measuring stick of performance in poker"></Hoverable></li>
                  <li>Extensive cross-disciplinary studies in game theory, logic, psychology, statistics, financial management and analysis, emotional regulation</li>
                  <li>Coached multiple players that achieved $5m+ in winnings while my students</li>
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
