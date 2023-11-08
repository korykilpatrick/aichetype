import React from 'react';
import '../css/NeuralinkApplication.css';
import { Link } from 'react-router-dom';
import { Hoverable } from './component_utilities';

const NeuralinkApplication = () => {
    return (
      <div>
        {/* <h1 className="page-title">Neuralink Internship Application</h1> */}
        <p></p>
        <section>
          <h3>About you</h3>
          <ul>
            <li>
              <strong>You find large challenges exciting and enjoy discovering and defining problems as much as solving them.</strong> 
              <p>When I was 17 I told my parents in complete earnest that I was going to be one of the best poker players in the world one day. At the time online poker was incredibly new, and nobody thought you could make a living doing <Hoverable text="probably because nobody ever had!">it.</Hoverable> A small group of people from all corners of the globe congregated in an online forum, where we explored and <Link to="/poker" className='internal-link'>conquered</Link> these uncharted waters.</p>
              <p>
                In 2019, despite having no significant programming experience beyond standard coursework and study, I assured a longtime colleague that two friends and I could build a better product than the one he was using to run his business that executes $100 million per year in trades. Within a year <Link to="/betterdata" className='internal-link'>we did</Link> just that.
              </p>
            </li>
            <li>
              <strong>You deliver. You may enjoy thoughtful conversations about problems and perfecting designs, but in the end, you know that what matters is delivering a manufacturable solution that works every time.</strong> 
              <p>[Your response]</p>
            </li>
            <li>
              <strong>You are a cross-disciplinary team member. You are excited to work with and learn from software, mechanical, electrical, materials, biological engineers, and neuroscientists. You are comfortable communicating across teams.</strong> 
              <p>[Your response]</p>
            </li>
            <li>
              <strong>Resourceful, flexible and adaptable; no task is too big or too small.</strong> 
              <p>[Your response]</p>
            </li>
          </ul>
        </section>
  
        <section>
          <h3>Key qualifications</h3>
          <ul>
            <li>
              <strong>3+ years of software engineering experience (including personal/school experience)</strong> 
              <p>[Your details]</p>
            </li>
            <li>
              <strong>9+ months experience of application of technical skills outside of the classroom (examples: laboratory, research, extracurricular project teams, open source contributions, volunteering, personal projects or prior internship/work experience)</strong> 
              <p>[Your details]</p>
            </li>
            <li>
              <strong>1+ previous technical internship</strong> 
              <p>[Your experience]</p>
            </li>
          </ul>
        </section>
  
        <section>
          <h3>Preferred qualifications</h3>
          <ul>
            <li>
              <strong>Familiarity with Ruby, Python, and/or Javascript</strong> 
              <p>[Your details]</p>
            </li>
            <li>
              <strong>Familiarity with C/C++/Rust</strong> 
              <p>[Your experience]</p>
            </li>
            <li>
              <strong>Familiarity with container management and orchestration</strong> 
              <p>[Your experience]</p>
            </li>
            <li>
              <strong>Familiarity with web application frameworks like Ruby on Rails or Django</strong> 
              <p>[Your experience]</p>
            </li>
            <li>
              <strong>Familiarity with HTML/CSS</strong> 
              <p>[Your experience]</p>
            </li>
            <li>
              <strong>Experience with infrastructure development</strong> 
              <p>[Your experience]</p>
            </li>
          </ul>
        </section>
      </div>
    );
  };
  
  export default NeuralinkApplication;