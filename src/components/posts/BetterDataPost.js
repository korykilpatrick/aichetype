import React from 'react';
import { Container, Row, Col } from 'react-bootstrap';

const BetterDataPost = () => {
  return (
    <Container>
      <Row className="mb-4">
        <Col>
          <h2>Better Data Solutions & Management</h2>
        </Col>
      </Row>
      <Row className="mb-4">
        <Col>
          <p>
            In late 2019 two friends and I began working on building software for a former colleague of mine who had built a business in a niche high-frequency trading space. It started with us merely tinkering, trying to see if we <em>could</em> build something better than what he was currently using. A year later we had a highly regarded, high-end product and a handful of high paying customers. 
          </p>
          <p>
            I worked on this company for over 2 years alongside two friends, taking it from a blank document to a profitable business. I can't disclose much of the details, but I can outline the problem space and our solution at a high level.
          </p>
        </Col>
      </Row>
      <Row className="mb-4">
        <Col>
          <h3>Problem ❗</h3>
          <p>
            Our clients are small teams of traders that want to execute trades on a large number of exchanges concurrently. They need to be able to manage their data, execute trades, monitor their positions in real-time, analyze their performance, have perfect record-keeping, and more. The market is fast-moving and constantly changing, so they need highly performant, customizable, and adaptable software to be competitive.
          </p>
        </Col>
      </Row>
      <Row>
        <Col>
          <h3>Target 🎯</h3>
          <ul>
            <li>An intelligent, customizable web automation system</li>
            <li>User friendly messenger interface for executing trades and real-time reporting</li>
            <li>Robust web interface for reporting, data management, accounting, etc.</li>
            <li>100% up-time</li>
            <li>Complete fault-intolerance</li>
          </ul>
        </Col>
      </Row>
      <Row>
        <Col>
          <h3>Solution ✅</h3>
        </Col>
      </Row>
      <Row>
        <Col>
          <h3>Results 📈</h3>
          <ul>
            <li>Highly regarded, high-end product</li>
            <li>Handful of high paying customers</li>
          </ul>
        </Col>
      </Row>
    </Container>
  );
};

export default BetterDataPost;
