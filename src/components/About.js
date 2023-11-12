import React from 'react';
import { Link } from 'react-router-dom';
import '../css/About.css';
import '../css/Post.css';
import { Hoverable, Image } from './component_utilities';

const About = () => {
  return (
    <div className="about-page">
      <Image url="https://korykilpatrick-bucket.s3.us-west-1.amazonaws.com/kory_winnie_mountains.jpg" caption="Me and my dog Winnie in the Canadian Rockies" size={.5}/>
      <p>
      Hey there 👋. I'm Kory. I'm 34. I like solving problems, helping people, and pushing the bounds of understanding. I believe theres a psychic substrate of reality that is just a vibrant as the physical one. I spend much of my time there, steadfastly taking my toothbrush to the lens through which I see the world. I also spend a lot of time thinking about how to use technology, the great lever of our time, to solve the world's most pressing problems.
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
      <hr className='thick-line-break'/>
      <h2>Internal Links</h2>
      <ul>
        <li><Link to='/devlog' className='internal-link'>DevLog</Link></li>
        <li><Link to='/poker' className='internal-link'>Poker</Link></li>
        <li><Link to='/betterdata' className='internal-link'>Better Data</Link></li>
        <li><Link to='/sportsanalytics' className='internal-link'>Sports Analytics</Link></li>
        <li><Link to='/neuralink' className='internal-link'>Neuralink</Link></li>
        <li><Link to='/work' className='internal-link'>Work</Link></li>
        <li><Link to='/bookshelf' className='internal-link'>Bookshelf</Link></li>
      </ul>

      <h2>External Links</h2> 
      <ul>
        <li><a href="https://github.com/korykilpatrick" target="_blank">Github</a></li>
        <li><a href="https://www.linkedin.com/in/kory-kilpatrick-b60707243/" target="_blank">LinkedIn</a></li>
        <li><a href="https://twitter.com/kory_kilpatrick" target="_blank">Twitter</a></li>
      </ul>
      
    </div>
  );
};

export default About;
