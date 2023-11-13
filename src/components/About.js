import React from 'react';
import { Link } from 'react-router-dom';
import '../css/About.css';
import '../css/Post.css';
import { Hoverable, Image } from './component_utilities';

const About = () => {
  return (
    <div className="about-page">
      <Image url="https://korykilpatrick-bucket.s3.us-west-1.amazonaws.com/kory_winnie_mountains.jpg" caption="My dog Winnie and I in the Canadian Rockies" size={.5}/>
      <p>
      Hey there 👋 I'm Kory. I like solving problems, helping people, and pushing the bounds of understanding. When I'm not building stuff or studying, I'm doing physical activities, solving games with friends, trying to be a good role model to young people that I love, listening to music, or playing with my dog or cat.
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
        <li><a href="mailto:koryrkilpatrick@gmail.com?subject=Are%20you%20a%20bank%20loan?&body=Because%20you%20have%20my%20interest.">Email</a></li>
      </ul>
      
    </div>
  );
};

export default About;
