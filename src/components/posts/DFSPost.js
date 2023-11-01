import React from 'react';
import { Container, Row, Col, ListGroup, Card, Button } from 'react-bootstrap';
import "../../css/Projects.css";
import { Hoverable, Image } from '../component_utilities';

const DFSPost = () => {
  return (
    <Container>
      <Row className="mb-4">
        <Col>
          <p>There is an abundance of demand and opportunity for engineering in the professional gambling world. The following projects were built in collaboration with friends who are professional sports bettors. I wrote the code, they provided the domain expertise, and together we applied game theory and investing principles to develop the algorithms.</p>
        </Col>
      </Row>
      <Row className="mb-4">
        <Col>
          <hr style={{borderTop: '3px solid #bbb'}} />
          <h2>Daily Fantasy Sports <Hoverable text="DFS is essentially a game where you can bet on how well athletes perform over a given time frame (typically 1 day). <a href='https://www.draftkings.com' target='_blank'>Draftkings</a> and <a href='https://www.fanduel.com' target='_blank'>Fanduel</a> are the most popular DFS platforms. For more, you can read <a href='https://www.dailyfantasysports101.com/basics/' target='_blank'>here</a>.">(DFS)</Hoverable> Analytics</h2>
        </Col>
      </Row>
      <Row className="mb-4">
        <Col>
          <h3>Problem ❗</h3>
          <ListGroup variant="flush">
            <ListGroup.Item><em>Competitive Edge</em>: Game theory proficiency</ListGroup.Item>
            <ListGroup.Item><em>Current Limitations</em>: No available rules-based lineup-generation engine robustly captures game theory nuance</ListGroup.Item>
            <ListGroup.Item><em>Workflow</em>: Existing process was <Hoverable text="Thus error prone and limited in scale">manual</Hoverable> and lacking in insights provided by advanced data analysis</ListGroup.Item>
            <ListGroup.Item><em>Impact</em>: Either smaller stakes are skipped, or suboptimal lineups are played, reducing profits</ListGroup.Item>
          </ListGroup>
        </Col>
      </Row>

      <Row className="mb-4">
        <Col>
          <h3>Target 🎯</h3>
          <ListGroup variant="flush">
            <ListGroup.Item><em>Goal</em>: Automate game theory application with a plugin for the existing rules engine</ListGroup.Item>
            <ListGroup.Item><em>Input</em>:
              <ul>
                <li><em>N</em> engine-generated lineup <Hoverable text="Where _N_ is typically 3 * max_entries.">candidates</Hoverable></li>
                <li>Contest data from DFS <Hoverable text="Most saliently: buyin, payout structure, field size, and player pricing.">sites</Hoverable></li>
                <li>Private player rankings and data</li>
              </ul>
            </ListGroup.Item>
            <ListGroup.Item><em>Output</em>: 
              <ul>
                <li><em>N</em> lineup candidates with proprietary, filterable, algorithmically-generated metadata</li>
              </ul>
            </ListGroup.Item>
            <ListGroup.Item><em>Constraints</em>:
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
            <ul>
            <li>Devised proprietary metadata algorithms for lineup candidates</li>
            <li>Implemented these algorithms in Python</li>
            <li>Utilized Google Sheets API for a Python-based UI</li>
            </ul>
        </Col>
      </Row>

      <Row className="mb-4">
        <Col>
          <h3>Results 💰</h3>
          <Row className="mb-4">
            <p>

            </p>
          </Row>
          <ListGroup variant="flush">
            <ListGroup.Item><Image url="https://korykilpatrick-bucket.s3.us-west-1.amazonaws.com/Draftkings+profit.png" caption="Draftkings results through the first 1.25 NFL seasons."></Image></ListGroup.Item>
          </ListGroup>
        </Col>
      </Row>
      <Row className="mb-4">
        <Col>
          <hr style={{borderTop: '3px solid #bbb'}} />
          <h2>NBA Shotluck</h2>
        </Col>
      </Row>
    <Row className="mb-4">
        <Col>
          <h3>Problem ❗</h3>
          <ListGroup variant="flush">
            <ListGroup.Item><em>Competitive Edge</em>: Placeholder</ListGroup.Item>
            <ListGroup.Item><em>Current Limitations</em>: Placeholder</ListGroup.Item>
            <ListGroup.Item><em>Workflow</em>: Placeholder</ListGroup.Item>
            <ListGroup.Item><em>Impact</em>: Placeholder</ListGroup.Item>
          </ListGroup>
        </Col>
      </Row>

      <Row className="mb-4">
        <Col>
          <h3>Target 🎯</h3>
          <ListGroup variant="flush">
            <ListGroup.Item><em>Goal</em>: Placeholder</ListGroup.Item>
            <ListGroup.Item><em>Input</em>: Placeholder</ListGroup.Item>
            <ListGroup.Item><em>Output</em>: Placeholder</ListGroup.Item>
            <ListGroup.Item><em>Constraints</em>: Placeholder</ListGroup.Item>
          </ListGroup>
        </Col>
      </Row>

      <Row className="mb-4">
        <Col>
          <h3>Solution ✅</h3>
          <ul>
            <li>Placeholder</li>
            <li>Placeholder</li>
            <li>Placeholder</li>
          </ul>
        </Col>
      </Row>

      <Row className="mb-4">
        <Col>
          <h3>New Project: Results 💰</h3>
          <ListGroup variant="flush">
            <ListGroup.Item><Image url="https://example.com/image.png" caption="Placeholder caption"></Image></ListGroup.Item>
          </ListGroup>
        </Col>
      </Row>
    </Container>
  );
};

export default DFSPost;
