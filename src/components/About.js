import React from 'react';
import '../css/About.css';
import { Hoverable, Image } from './component_utilities';

const About = () => {
  return (
    <div className="about-page">
      <p>
      Hey there 👋. I'm Kory. I'm 34, I like solving problems, helping people, and pushing the bounds of understanding. I believe theres a psychic substrate of reality that is just a vibrant as the physical one. I spend much of my time there, steadfastly taking my toothbrush to the lens through which I see the world. I also spend a lot of time thinking about how to use technology, the great lever of our time, to solve the world's most pressing problems.
      </p>
      <p>
        When I'm not building stuff or studying, I'm doing physical activities, solving games with friends, listening to music, trying to be good role model to young people that I love, or playing with my dog or cat.
      </p>
      <p>
        This website was born out of a desire to get out from under the rock I've lived under all my life. I've always been a private person, but I'm starting to realize that I have a lot to offer the world and that I can't do that from the shadows.
      </p>
      <p>
        I'm not active on socials, but you can say hi to me on <a href="https://twitter.com/kory_kilpatrick" target="_blank" rel="noopener noreferrer">Twitter</a> or via <a href="mailto:koryrkilpatrick@gmail.com?subject=Are%20you%20a%20bank%20loan?&body=Because%20you%20have%20my%20interest.">email</a> ✌️
      </p>
    </div>
  );
};

export default About;
