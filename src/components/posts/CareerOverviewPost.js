import React from 'react'; 
import { Container, Row, Col, Button } from 'react-bootstrap';

class CareerOverviewPost extends React.Component {
  render() {
    return (
      <Container>
        <Row className="mb-3">
          <Col>
            <h2>A Journey of Reinvention: From Poker to Coding and Beyond</h2>
          </Col>
        </Row>

        <Row className="mb-3">
          <Col>
            <p>
              Starting out with poker in high school, I found immediate success. After college,
              I decided to fully devote myself to the game and strive for excellence. I devoted 
              an entire decade towards ascending the poker ranks, ultimately achieving my objectives and ready for a new challenge.
            </p>
          </Col>
        </Row>

        <Row className="mb-3">
          <Col>
            <p>
              <a href='https://www.google.com/search?q=coding+boot+camp+San+Francisco' target='_blank' rel='noopener noreferrer'> Moving to San Francisco, I participated in a coding boot camp </a>, supplemented by online courses and self-study, culminating in my transformation to a software engineer. Two 
              years into this transition, I was looking for a substantial project to sink my teeth into.
            </p>
          </Col>
        </Row>

        <Row className="mb-3">
          <Col>
            <p>
              Through my poker network, I connected with a niche trading market where I identified an 
              opportunity to build innovative software. Along with two friends, I developed a superior 
              product which significantly influenced the way trades were placed. This successful venture 
              provided real-world experience and sharpened my engineering skill set.
            </p>
          </Col>
        </Row>

        <Row className="mb-3">
          <Col>
            <p>
              Intriguingly, domination of this niche market ultimately led to a loss of interest. Following 
              this, I found myself again seeking more meaningful work. In 2022, I began exploring various 
              opportunities, working on financial projects, acting as an angel investor, and even working 
              with a renowned daily fantasy sports bettor. 
            </p>
          </Col>
        </Row>

        <Row className="mb-3">
          <Col>
            <p>
              After a period of exploration, I realised my appetite was focused towards making a complete pivot 
              outside of finance and technology. I've studied the brain throughout my life, and with my amassed 
              know-how, I am eager to contribute towards solving its mysteries and discovering how it can be positively impacted.
            </p>
          </Col>
        </Row>

        <Row className="mb-3">
          <Col>
            <p>
              <a href='https://www.neuralink.com/' target='_blank' rel='noopener noreferrer'> Neuralink </a>, holds a particular allure for me. The tantalising 
              prospect of utilising my skills to help answer the brain's enigmas and make a substantial, positive 
              impact in people's lives is an ambition that I hope to fulfil in my future journey.
            </p>
          </Col>
        </Row>

        <Row className="justify-content-md-center">
          <Button variant="primary">Stay connected for more of this journey</Button>
        </Row>
      </Container>
    )
  }
}

export default CareerOverviewPost;
