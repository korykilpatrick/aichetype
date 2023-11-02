import React from 'react';
import '../css/About.css';
import { Hoverable, Image } from './component_utilities';

const About = () => {
  return (
    <div className="about-page">
      <p>
      Hey there 👋. I'm Kory. I like solving problems, helping people, and pushing the bounds of understanding. I believe theres a psychic substrate of reality that is just a vibrant as the physical one. I spend much of my time there, polishing the lens through which I see the world with my toothbrush. I also spend a lot of time thinking about how to use technology, the great lever of our time, to solve the world's most pressing problems.
      </p>
      <p>
        Professionally, I've worn many hats. Most notably, I spent my 20s as one of the best poker players in the world and, more recently, co-founded a small software company.
      </p>
      <p>
        This website was born out of a desire to have a more accurate online representation of myself.
      </p>
      <p>
        I'm not active on socials, but you can say hi to me on <a href="https://twitter.com/kory_kilpatrick" target="_blank" rel="noopener noreferrer">Twitter</a> or send me an <a href="mailto:koryrkilpatrick@gmail.com?subject=Hey%20good%20lookin&body=Are%20you%20a%20bank%20loan?%20Because%20you%20have%20my%20interest.">email</a> ✌️
      </p>
    </div>
  );
};

export default About;
