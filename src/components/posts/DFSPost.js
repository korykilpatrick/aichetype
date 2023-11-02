import React from 'react';
import { Container, Row, Col, ListGroup, Card, Button } from 'react-bootstrap';
import "../../css/Projects.css";
import { Hoverable, Image } from '../component_utilities';

const DFSPost = () => {
  return (
    <Container>
      <Row className="mb-4">
        <Col>
          <p>There is an abundance of demand for software engineering in the professional gambling world. The following projects were built in collaboration with friends who are professional sports bettors. I wrote the code, they provided the domain expertise, and together we applied game theory and investing principles to develop the algorithms.</p>
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
            <ListGroup.Item><em>Limitations</em>: No available rules-based lineup-generation engine robustly captures game theory nuance</ListGroup.Item>
            <ListGroup.Item><em>Workflow</em>: Existing process was <Hoverable text="Thus error prone and limited in scale">manual</Hoverable> and lacking in insights provided by advanced data analysis</ListGroup.Item>
            <ListGroup.Item><em>Impact</em>: Either smaller stakes are skipped, or suboptimal lineups are played, limiting volume and ROI</ListGroup.Item>
          </ListGroup>
        </Col>
      </Row>

      <Row className="mb-4">
        <Col>
          <h3>Target 🎯</h3>
          <ListGroup variant="flush">
            <ListGroup.Item><em>Goal</em>: Automate game theory application with a plugin for the existing rules engine</ListGroup.Item>
            <ListGroup.Item><em>Input</em>
              <ul>
                <li><em>N</em> engine-generated lineup <Hoverable text="Where <em>N</em> is typically 3 * max_entries.">candidates</Hoverable></li>
                <li>Contest data from DFS <Hoverable text="Most saliently: buyin, payout structure, field size, and player pricing">sites</Hoverable></li>
                <li>Private player rankings and data</li>
              </ul>
            </ListGroup.Item>
            <ListGroup.Item><em>Output</em> 
              <ul>
                <li><em>N</em> lineup candidates with proprietary, filterable, algorithmically-generated metadata</li>
              </ul>
            </ListGroup.Item>
            <ListGroup.Item><em>Constraints</em>
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
            <li>Used Google Sheets API to provide Python-based UI with real-time updates</li>
            <li>Additionally, added support for post-contest data analysis</li>
            </ul>
        </Col>
      </Row>
      <Image url="https://korykilpatrick-bucket.s3.us-west-1.amazonaws.com/dfs_lineups.png" caption="The main Google Sheet UI from a random week. The columns on the left are the proprietary metadata, with category names obscured because 🤫😉. The columns on the right are the engine-generated lineup candidates. My partners input <em>N*3</em> lineups into the google sheet, then we use the metadata to filter it down to the top <em>N</em> lineups to bet on." zoom={true} />
      <Image url="https://korykilpatrick-bucket.s3.us-west-1.amazonaws.com/dfs_lookback.png" caption="An example post-contest analysis. By analyzing the publicly-available contest results we gleaned insights into how our opponents played and how our algorithms evaluated the winning lineups, which helped us iterate." zoom={true} />
      <Row className="mb-4">
        <Col>
          <h3>Results 📈</h3>
          <Row className="mb-4">
            <p>
              Success! I don't have access to historical records to compare <Hoverable text="And variance in this space is so high that it would only be moderately useful">against,</Hoverable> but in the first season we achived a ~25% ROI on ~$1m in volume, which is roughly in line with our projected expected value.
            </p>
          </Row>
          <ListGroup variant="flush">
            <ListGroup.Item><Image url="https://korykilpatrick-bucket.s3.us-west-1.amazonaws.com/Draftkings+profit.png" caption="My Draftkings results through the first 1.25 NFL seasons. Draftkings is where the majority of our bets are placed." size={.5}></Image></ListGroup.Item>
          </ListGroup>
        </Col>
      </Row>
      <Row className="mb-4">
        <Col>
          <hr style={{borderTop: '3px solid #bbb'}} />
          <h2>NBA Shotluck</h2>
          <p>
            An NBA betting expert friend came to me with an idea for a betting tool. He designed the algorithm and I implemented everything.
          </p>
        </Col>
      </Row>
    <Row className="mb-4">
        <Col>
          <h3>Problem ❗</h3>
          <p>
            A game's score is a lossy signal for how well the teams are playing and how well one might expect them to play in the future. Most notably, it doesn't account for randomness inherent in shooting. For example, Steph Curry is a 42.8% 3pt shooter over his career. If he shoots a 3 on the first play of a game the score <em>in EV</em> <Hoverable text="Expected Value"></Hoverable> is now <Hoverable text="3*.428">1.28</Hoverable> - 0, but the <em>actual</em> score is either 3-0 or 0-0. 1.28 - 0 is a much more accurate representation of the teams' relative performance than 3-0 or 0-0, as it controls for shotluck. Access to high-fidelity luck-adjusted scores helps identify potentially mispriced lines.<Hoverable text="A simple example to illustrate the benefit of shotluck-adjusted scoring: The Warriors' first three possessions are wide open 3pt shots by a healthy Steph Curry. He misses them all. The Timberwolves first three possessions are wide open 3pt shots by Rudy Gobert, who has made 0 of his 14 attempted threes in his 11 year career. He makes 2 of the three. The Timberwolves are up 6-0. Who is playing better?"></Hoverable>
          </p>
        </Col>
      </Row>
      <Row className="mb-4">
        <Col>
          <h3>Target 🎯</h3>
          <p>
            A tool that provides real-time luck-adjusted scores to NBA games.
          </p>
        </Col>
      </Row>

      <Row className="mb-4">
        <Col>
          <h3>Solution ✅</h3>
          
          <ul>
            <li>Used <a href="https://github.com/swar/nba_api" target="blank">NBA API</a> to access and save historical player data</li>
            <li>Developed luck-adjusted algorithm using my partner's expertise + historical data</li>
            <li>Used NBA API to poll for and save real-time game data</li>
            <li>Built messenger interface that allowed for partner to request luck-adjusted score for a game</li>
            <li>Used Python, MySQL, AWS, <a href="https://github.com/python-telegram-bot/python-telegram-bot">Telegram API</a> (frontend)</li> 
          </ul>
        </Col>
      </Row>
      <Image url="https://korykilpatrick-bucket.s3.us-west-1.amazonaws.com/shotluck_bot.png" caption="The Telegram bot interface. My partner can request the luck-adjusted score for any game, and the bot will respond with the actual score and our computed luck-adjusted score."></Image>

      <Row className="mb-4">
        <Col>
          <h3>Results 💰</h3>
          <p>
            My partner uses this tool regularly and finds it very helpful, but it is one of several factors he uses to inform his betting so the impact is difficult to quantify.
          </p>
        </Col>
      </Row>
      <Row className="mb-4">
        <Col>
          <hr style={{borderTop: '3px solid #bbb'}} />
          <p>
            There have been a number of betting related problems that I've used programming to solve, but that don't fit into a neat project. Being a professional bettor often means moving quickly in response to new information, so I am regularly scraping data of all sorts, building algorithms, automating work, and building tools to help my partners and I make better decisions, often in a race against the clock. 
          </p>
        </Col>
      </Row>
    </Container>
  );
};

export default DFSPost;
