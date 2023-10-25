import React, { useState, useEffect } from 'react';
import { Link } from 'react-router-dom';
import { Container, Row, Col } from 'react-bootstrap';
import '../../css/WorkPost.css';
import { Hoverable } from '../component_utilities';

const WorkPost = () => {
    return (
      <Container style={{ marginTop: '20px', marginBottom: '20px' }}>
        <Row>
          <Col>
            <p>
              I've never had a traditional job. I became really good at online poker in high school, which had the fortunate benefit of making me money. By the time I graduated high school, I had earned over <Hoverable text="From an initial, and at the time lofty, $20 deposit">$100,000</Hoverable>. I went to college, where I made more than $1 million as a teenager, mostly in my dorm room between classes and basketball practice.
            </p>
            <p>
              After graduating college in <Hoverable text="with a degree in..uh..Political Economy?">2012</Hoverable>, I went <Hoverable text="😉">all-in</Hoverable> on poker, dedicating virtually every waking moment to playing or studying. 
              I quickly became one of the best Pot Limit <Hoverable text="Omaha is the 2nd most popular poker variant behind Texas Hold'em. It's basically Hold'em, but you get dealt 4 cards (instead of 2) and can only play 2 of them.">Omaha</Hoverable> players in the world. In 2014 I won a World Series of Poker <Hoverable text="This basically means I got lucky in one tournament, a feat far less impressive than being a regular winner in the biggest cash games on the internet. But alas, TV and glory and such means this is probably how I should headline my poker resumé.">bracelet.</Hoverable>
            </p>
            <p>
              By 2016 I was ready to move on. I still enjoyed playing and was winning at peak rates, but I was increasingly not okay with the fact that I was spending all my time and energy mastering a zero-sum game. I found myself increasingly drawn to technology, and in particular to its enormous potential as a force for good. 
            </p>
            {/* Insert graph of winnings here */}
            <p>
              In 2017, I moved to San Francisco and completed <a href="https://www.galvanize.com/hack-reactor/" target="_blank">Hack Reactor</a>, sparking my love for computer science. Post-bootcamp, two friends and I immersed ourselves in textbooks, online courses, and <Hoverable text="I can't speak highly enough of Bradfield, and it's founder <a href='https://x.com/oznova_' target='_blank'>Oz</a>."><a href="https://bradfieldcs.com/" target="_blank">Bradfield</a></Hoverable> programs.
              </p>
              <p>Come 2019, we were on the hunt for a significant project. I probed my network for opportunities to jump in the deepend. This led to a conversation with an old poker friend, who had switched to high-frequency trading, about his software needs. After assessing their $100 million+ wagering software, my friends and I concluded we could create something better. Despite our limited project experience, I persuaded my friend to hire us. I was less than thrilled to be back in the gambling/finance space, but the high-stakes arena was a great opportunity for rapid skill-building.
            </p>
            <p>A year later, we had the industry's top product and dominated our niche. Our end-to-end enterprise software solution delivered unparalleled performance in the industry. By early 2022, we had automated all we could, and I felt it was time for a new adventure. My friends bought me out and are still doing well with the business today.
            </p>
            <p>Since then, I've dabbled in various endeavors. I've taken on some more gambling/finance projects, working with my existing network. I've partnered with a leading daily fantasy sports bettor to develop custom algorithms and streamline their workflow. My ongoing education in computer science continues via Bradfield's new online platform, csprimer.com.
            </p>
            <p>
              Now, my focus is shifting toward mission-driven work. I'm selective about my next deep dive; 
              it needs to push boundaries and align with my values. I'm especially keen on working face-to-face. 
              For now, Neuralink stands out as a compelling option.
            </p>
          </Col>
        </Row>
      </Container>
    );
  };
  
  export default WorkPost;