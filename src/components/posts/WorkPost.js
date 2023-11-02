import React, { useState, useEffect } from 'react';
import { Link } from 'react-router-dom';
import { Container, Row, Col } from 'react-bootstrap';
import '../../css/WorkPost.css';
import { Image, Hoverable } from '../component_utilities';

const WorkPost = () => {
    return (
      <Container style={{ marginTop: '20px', marginBottom: '20px' }}>
        <Row>
          <Col>
            <p>
              I've never had a traditional job. <a href="/poker">I became quite good at online poker</a> in high school, which had the fortunate side-effect of being lucrative. By the time I graduated high I earned over <Hoverable text="From an initial, and at the time lofty, $20 deposit">$100,000.</Hoverable> I went to college, where I made more than $1 million as a teenager, mostly in my dorm room between classes and basketball practice.
            </p>
            <p>
              After graduating in <Hoverable text="with a degree in..uh..Political Economy?" width="200px">2012,</Hoverable> I went <Hoverable text="😉">all-in</Hoverable> on poker, dedicating virtually every waking moment to playing or studying. 
              I quickly became one of the best Pot Limit <Hoverable text="Omaha is the second most popular poker variant behind Texas Hold'em. It's basically Hold'em, but you get dealt 4 cards (instead of 2) and can only play 2 of them.">Omaha</Hoverable> players in the world. In 2014 I won a World Series of Poker bracelet.
            </p>
            <Image url="https://www.wsop.com/images/imagestore/flashlarge/Champion_Kory_Kilpatrick.JPG" caption="There is an extraordinary amount of variance in tournament poker, so winning a WSOP bracelet is a feat far less impressive than being a winner over a large sample size in some of the most competitive cash games on the internet. But alas, shiny things are shiny so I guess this is how I should headline my poker resumé!" size={.75}/>
            <p>
              By 2015 I was ready to move on. I still enjoyed playing and was winning at peak rates, but I was increasingly not okay with the fact that I was spending all my time and energy on a zero-sum game. I spent some time traveling to poker stops around the world and volunteering. During this time, I found myself increasingly drawn to technology, and in particular to its enormous potential as a force for good. 
            </p>
            <Image url="https://korykilpatrick-bucket.s3.us-west-1.amazonaws.com/volunteering.png" caption="LEFT: I spent a couple months with some sweet kids at an orphanage in Cusco, Peru. Being with them strengthened my desire to pivot into mission-oriented work. RIGHT: I spent 6 weeks at the magical <a href='https://www.elephantnaturepark.org/' target='_blank'>Elephant Nature Park</a> in Chiang Mai, Thailand. Some quick back of the envelope math indicates I shoveled 15-20 tons of shit during my time there. Being around elephants further invigorated my lifelong fascination with intelligence and the brain." size={.75} />
            <p>
              I moved to San Francisco in 2017 without knowing anyone there and with no plans other than to pursue tech. At the end of the year I completed <a href="https://www.galvanize.com/hack-reactor/" target="_blank">Hack Reactor</a>, which sparked my love for computer science. Post-bootcamp, two friends and I immersed ourselves in textbooks, online courses, and <Hoverable text="I can't speak highly enough of Bradfield, and it's founder  <a href='https://x.com/oznova_' target='_blank'>Oz</a>"><a href="https://bradfieldcs.com/" target="_blank">Bradfield</a></Hoverable> programs.
              </p>
              <Image url="https://korykilpatrick-bucket.s3.us-west-1.amazonaws.com/cs_nerds.jpg" caption="Jordan, Matt, and I in our San Francisco office in 2018. The whiteboard shows notes from one of our first projects: a website that shows you which Chipotle stop adds the least amount of time to your trip. In addition to computer science I also got hooked on Settlers of Catan during this period and became top 5 in the world on <a href='https://catanuniverse.com/en' target='_blank'>Catan Universe</a>." size={.75}/>
              <p>By the end of 2019 we were on the hunt for a significant project. I probed my network for opportunities to jump in the deepend. This led to a conversation with an old poker friend, who had pivoted to starting a business in a niche trading market, about his technology needs. After assessing the software his team used, the three of us concluded we could build something better. I was reluctant to be back in the finance world, but being able to leverage my network and reputation to gain access to a high-stakes, high-pressure arena was too promising of a skill-building opportunity to pass up.
            </p>
            {/* <Image url="" caption="In 2020 two friends and I started an end-to-end enterprise software company for organizations in an niche trading market. Our clients execute wagers by dialoguing with a Telegram bot connected to our backend, then use our web portal (pictured) for monitoring, accounting, settings, etc. */}
            <p>A year later, we had the top product in our niche. Another year and the software was almost entirely <Hoverable text="It still irks me that we couldn't <em>fully</em> automate the software, but it often has to respond to unpredictably structured data while also being completely fault-intolerant so some human oversight is required. <em>sigh</em>. We did build some great tooling that makes maintenance as simple as possible though.">self-sustaining,</Hoverable> at which point I felt it was time to move on. I left the company, but Jordan and Matt are still doing well running it today.<Hoverable text="I feel incredibly fortunate to have had this experience with two of my best friends in the world. I will certainly be pulling out all the stops to try to recruit them to join me in whatever I do next."></Hoverable>
            </p>
            <p>Since then, I've dabbled in various endeavors while figuring out my next big move. Most notably, I've <Link to="/sportsanalytics">partnered</Link> with professional sports bettors to do data analytics, develop novel betting algorithms, and streamline their workflow. I've also done some angel investing, continued my CS <Hoverable text="Mostly via ChatGPT rabbitholes and Bradfield's new online platform <a href='https://csprimer.com' target='_blank'>CS Primer</a>.">education,</Hoverable> and been an active mentor on <a href="https://www.backrs.com/" target="_blank">Backrs</a>.
            </p>
          </Col>
        </Row>
      </Container>
    );
  };
  
  export default WorkPost;