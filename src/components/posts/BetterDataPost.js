import React from 'react';
import { Container, Row, Col } from 'react-bootstrap';
import { Hoverable, Image } from '../component_utilities';
import '../../css/Post.css'

const BetterDataPost = () => {
  return (
    <Container>
      <Row className="mb-4">
        <Col>
          <h2 className='post-title'>Better Data Solutions & Management</h2>
        </Col>
      </Row>
      <Row className="mb-4">
        <Col>
          <p>
            In late 2019 two friends and I began working on building software for a colleague of mine who runs a business in a niche high-frequency trading space. It started with us merely tinkering, trying to see if we <em>could</em> build something better than what he was currently using. A year later we had a highly regarded, high-end product and a handful of high paying customers. 
          </p>
          <p>
            I worked on this company for over 2 years alongside two friends, taking it from a blank document to a profitable business. I was the point person for all business related things as well as client-acquisition and relationships. My partners and I split the engineering work, each having our fingerprints over pretty much every aspect of the codebase.
          </p>
        </Col>
      </Row>
      <Row>
        <Col>
          <Image url="https://korykilpatrick-bucket.s3.us-west-1.amazonaws.com/BetterData_Web.png" caption="Scenes from the website. It's hard to showcase a product that is dense with sensitive information!" zoom={true}></Image>
        </Col>
      </Row>
      <Row className="mb-4">
        <Col>
          <h3>Problem ❗</h3>
          <p>
            Our clients are small teams of traders that want to execute wagers on a large number of API-less exchanges concurrently. Their requirements include but are not limited to:
            <ul>
              <li>Execute high volume of wagers</li>
              <li>Monitor positions in real time</li>
              <li>Analyze their performance</li>
              <li>Accounting support</li>
            </ul>
            The market is fast-moving and constantly changing, so they need highly performant, customizable, and adaptable software to be competitive.
          </p>
        </Col>
      </Row>
      <Row>
        <Col>
          <h3>Target 🎯</h3>
          <ul>
            <li>An intelligent, customizable web automation system</li>
            <li>User friendly messenger interface for executing wagers and real-time reporting</li>
            <li>Robust web interface for reporting, data management, accounting, etc.</li>
            <li>100% up-time</li>
            <li>Complete fault-intolerance<Hoverable text="Turns out clients don't like it when you wager tens of thousands of dollars on the opposite of what they ask you to!"></Hoverable></li>
          </ul>
        </Col>
      </Row>
      <Row>
        <Col>
          <h3>Solution ✅</h3>
          <h4>🕸️ Website as graph</h4>
          <p>
            We model an exchange as a graph, with web pages representing nodes and http request data representing edges between nodes. This allows us to robustly and intelligently navigate websites.
          </p>
          <h4>⚙️ Operations</h4>
          <p>
            We define an operation as a discrete sequence of operation nodes. An operation node can be a request <Hoverable text="meaning it takes us from one page to another">node</Hoverable> or a middleware <Hoverable text="meaning it performs a necessary function required before sending the next request, e.g. data validation">node.</Hoverable> Placing wagers is a client initiated operation, but we also have a number of automated operations that run on a schedule.
          </p>
          <h4>🌆 Modeling the ecosystem</h4>
          <p> 
            As we accrued data on exchanges, we noticed many cross-exchange commonalities. Eventually we were able to reverse-engineer a high resolution model of the ecosystem. We built a system that could automatically cluster <Hoverable text="including ones we had never seen before">exchanges</Hoverable> and create links to the appropriate operations. This allowed us to quickly add support for new exchanges and quickly update as exchanges evolved.
          </p>
      <Image url="https://korykilpatrick-bucket.s3.us-west-1.amazonaws.com/sites_ERD.jpg" caption="The ERD of our Sites database, where we store everything required to intelligently crawl exchanges. The database is highly normalized, which allows us to easily add support for new exchanges and quickly update as exchanges evolve." zoom={true} size={.5} />
          <h4>Tools used</h4>
            <ul>
              <li><Hoverable text="The software is very database intensive">MySQL</Hoverable></li>
              <li>Python<Hoverable text="The only dependencies used anywhere signficant are python's request module, BeautifulSoup, and Telegram's python API for our messenger interface"></Hoverable></li>
              <li>C#<Hoverable text="Website"></Hoverable></li>
              <li>Bash</li>
              <li>AWS</li>
            </ul>
        </Col>
      </Row>
      <Row>
        <Col>
          <h3>Results 📈</h3>
          <ul>
            <li>Hit all our targets</li>
            <li>$1 billion in wagers executed at an average wager of $X</li>
            <li>Achieved near complete automation<Hoverable text="It still irks me that we couldn't <em>fully</em> automate the software, but it often has to respond to unpredictably structured data while also being completely fault-intolerant so some human oversight is required. <em>sigh</em>. We did build some great tooling that makes maintenance as simple as possible though."></Hoverable></li>
            <li>Mid 6 figures in annual recurring revenue</li>
          </ul>
        </Col>
      </Row>
    </Container>
  );
};

export default BetterDataPost;
