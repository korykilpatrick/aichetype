import React from 'react';
import { Container, Row, Col, ListGroup, Card, Button } from 'react-bootstrap';
import "../../css/Projects.css";

const DFSPost = () => {
  return (
    <Container>
      <Row className="mb-4">
        <Col>
          <p>This project was developed by me, with the algorithms being designed in collaboration with a team of professional Daily Fantasy Sports (DFS) bettors.</p>
        </Col>
      </Row>
      <Row className="mb-4">
        <Col>
          <h3>Problem ❗</h3>
          <ListGroup variant="flush">
            <ListGroup.Item>Competitive Edge: Game theory proficiency is my partners' key advantage.</ListGroup.Item>
            <ListGroup.Item>Current Limitations: No available rules-based engine robustly captures game theory nuances.</ListGroup.Item>
            <ListGroup.Item>Workflow: Existing process was manual (and thus error-prone and limited in scale) and lacking in insights provided by advanced data analysis.</ListGroup.Item>
            <ListGroup.Item>Impact: Either smaller stakes are skipped, or suboptimal lineups are played, reducing profits.</ListGroup.Item>
          </ListGroup>
        </Col>
      </Row>

      <Row className="mb-4">
        <Col>
          <h3>Target 🎯</h3>
          <ListGroup variant="flush">
            <ListGroup.Item>Goal: Automate game theory application with a plugin for the existing rules engine.</ListGroup.Item>
            <ListGroup.Item>Input:
              <ul>
                <li>N lineups (typically 3 * max entries)</li>
                <li>Contest data from DFS sites</li>
                <li>Private player rankings and data</li>
              </ul>
            </ListGroup.Item>
            <ListGroup.Item>Output: N lineups with proprietary, filterable metadata</ListGroup.Item>
            <ListGroup.Item>Constraints:
              <ul>
                <li>UI: Google Sheets</li>
                <li>Real-time updates needed up to final seconds</li>
              </ul>
            </ListGroup.Item>
          </ListGroup>
        </Col>
      </Row>

      <Row className="mb-4">
        <Col>
          <h3>Solution ✅</h3>
          <ListGroup variant="flush">
            <ListGroup.Item>Devised proprietary metadata algorithms for lineup candidates.</ListGroup.Item>
            <ListGroup.Item>Implemented these algorithms in Python.</ListGroup.Item>
            <ListGroup.Item>Utilized Google Sheets API for a Python-based UI.</ListGroup.Item>
          </ListGroup>
        </Col>
      </Row>

      <Row className="mb-4">
        <Col>
          <h3>Results 💰</h3>
          <ListGroup variant="flush">
            <ListGroup.Item>Generated ~$250K profit in the first season, aligning with our estimated expected value.</ListGroup.Item>
            <ListGroup.Item>Insert Image</ListGroup.Item>
          </ListGroup>
        </Col>
      </Row>
      <br />------------------------------<br />
      <Card className="mx-auto mt-5" style={{ maxWidth: '800px' }}>
      <Card.Body>
        <Card.Title>
          <h2>Translating Sports Betting Strategies into Code: My Experience in 2022</h2>
        </Card.Title>
        <Card.Text>
          A while back, a fellow poker player and one of the <a href="https://en.wikipedia.org/wiki/Daily_fantasy_sports">daily fantasy sports</a> giants asked for my help to refine his betting algorithm, seeing the potential of software enhancements in his workflow. So, I took this opportunity to utilize my programming skills in a different yet exciting domain.
          <br /><br />
          The unique challenge of this project was the flexibility it demanded due to the ever-evolving nature of daily fantasy sports. Not only did the parameters change, but so did the techniques deployed, varying from week to week, and even contest to contest. This required an agile approach, necessitating rapid development and iteration of new algorithms.
          <br /><br />
          My role involved synergizing game theory expertise with my colleagues’ to devise innovative strategies and then programming these algorithms. I was also responsible for providing a user interface for them to interact with the resulting data. The work was a mix of deep data dives, data science analysis, and programmatic execution of game theory algorithms.
          <br /><br />
          The input was primarily player projections and other sports data, with the output being betting strategies for various contests. Being prepared for everything sports data had to throw at us was quintessential to our work.
          <br /><br />
          My colleagues, who are well-versed in game theory and the National Football League (NFL), provided the necessary domain expertise. They researched extensively on NFL players and offered valuable insights, thus creating appropriate contexts for our work.
          <br /><br />
          Our collaboration led to the development of novel algorithms that we used to strategize our game plays. The output from these algorithms determined where we would place our investments in the contests.
        </Card.Text>
        {/* <div className="text-center mt-4">
          <Button variant="primary">Read More</Button>
        </div> */}
      </Card.Body>
    </Card>

    </Container>
  );
};

export default DFSPost;
