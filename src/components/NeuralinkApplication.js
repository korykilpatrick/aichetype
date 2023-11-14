import React, { useState } from 'react';
import '../css/NeuralinkApplication.css';
import '../css/Post.css';
import { Link } from 'react-router-dom';
import { Hoverable } from './component_utilities';

const NeuralinkApplication = () => {
  const [openSection, setOpenSection] = useState({});

  const toggleSection = (section) => {
    setOpenSection(prevState => ({
      ...prevState,
      [section]: !prevState[section]
    }));
  };

    return (
      <div>
        <p><em>Below I directly respond to the desired qualifications for the Software Engineering Internship</em></p>
        <section>
          <h2 onClick={() => toggleSection('aboutYou')} className={`collapsible-header ${openSection.aboutYou ? 'active' : ''}`}>About you</h2>
          {openSection.aboutYou && (
          <ul>
            <li>
              <strong>You find large challenges exciting and enjoy discovering and defining problems as much as solving them.</strong>
              <ul>
                <li>I figured out how to make a living playing online <Link to='/poker' className='internal-link'>poker</Link> before anyone knew it was possible. Discovering and defining the problem space<Hoverable text="which mainly consisted of bringing the game from the Wild West into the data science era"></Hoverable> was a huge<Hoverable text="and enjoyable!"></Hoverable> part of that quest.</li>
                <li>In 2019, despite having no significant programming experience outside of mostly self-taught coursework, two friends and I to built an end-to-end high-frequency trading <Link to='/betterdata' className='internal-link'>product</Link> that programmatically executes 9 figures per year in wagers. Within a year we had the top product in our niche.</li>
              </ul>
            </li>
            <li>
              <strong>You deliver. You may enjoy thoughtful conversations about problems and perfecting designs, but in the end, you know that what matters is delivering a manufacturable solution that works every time.</strong> 
                <ul>
                  <li>When starting <Link to="/betterdata" className='internal-link'>Better Data</Link>, each day that we could not traffic an exchange directly translated to dollars lost out of our client's <Hoverable text="and, consequently, ours">pockets.</Hoverable> We had to get <em>something</em> up immediately. We did, and made the necessary rewrites when time permitted.</li>
                  <li>To succeed in gambling you have to be extremely comfortable acting in the face of uncertainty.</li>
                  <li>This website! This is not the cleanest <a href="https://github.com/korykilpatrick/aichetype" target="_blank">code</a> or writing. I'm not trying to create a perfect website, I'm trying to take the path that leads to me working on interesting problems (at Neuralink! 🤞) as soon as possible.<Hoverable text="I could talk about the work I've done and improve this site ad nauseum, but I'm hoping I've shown enough to get an interview!"></Hoverable></li>
                </ul>
            </li>
            <li>
              <strong>You are a cross-disciplinary team member. You are excited to work with and learn from software, mechanical, electrical, materials, biological engineers, and neuroscientists. You are comfortable communicating across teams.</strong> 
              <ul>
                <li>Excited is an understatement - this is a main reason why I want to work with Neuralink! See my <Link to="/bookshelf" className='internal-link'>bookshelf</Link> for a glimpse into the breadth and depth of my interests.</li>
                <li>I played team sports growing up, including college <Hoverable text="where I was captain of the team for two of my four years">basketball.</Hoverable> Working with a small team toward a shared goal is my happy place.</li>
              </ul>
            </li>
            <li>
              <strong>Resourceful, flexible and adaptable; no task is too big or too small.</strong>
              <ul>
                <li>I grew up with parents who ran 4 am paper routes and worked multiple jobs to feed and care for my siblings and I, which instilled in me humility and resourcefulness.</li>
                <li>I've mostly worked for myself with no employees, which has meant it's been on me to do <em>everything</em>. I've gotten burned by not handling the small stuff enough times to appreciate how important every detail is.</li>
              </ul>
            </li>
          </ul>
          )}
        </section>
  
        <section>
          <h2 onClick={() => toggleSection('keyQualifications')} className={`collapsible-header ${openSection.keyQualifications ? 'active' : ''}`}>Key qualifications</h2>
          {openSection.keyQualifications && (
          <ul>
            <li>
              <strong>3+ years of software engineering experience (including personal/school experience)</strong> 
              <p>6 years of experience. Completed <a href="https://www.galvanize.com/hack-reactor/" target="_blank">Hack Reactor</a> in 2017. Been coding full-time since.</p>
            </li>
            <li>
              <strong>9+ months experience of application of technical skills outside of the classroom (examples: laboratory, research, extracurricular project teams, open source contributions, volunteering, personal projects or prior internship/work experience)</strong> 
              <p>5 years of non-classroom application of technical skills. Started personal projects in 2018. Started building production-grade products in 2019. Examples listed under Preferred qualifications below.</p>
            </li>
            <li>
              <strong>1+ previous technical internship</strong> 
              <p>I have not had a formal technical internship.</p>
            </li>
          </ul>
          )}
        </section>
        <section>
          <h2 onClick={() => toggleSection('preferredQualifications')} className={`collapsible-header ${openSection.preferredQualifications ? 'active' : ''}`}>Preferred qualifications</h2>
          {openSection.preferredQualifications && (
          <ul>
            <li>
              <strong>Familiarity with Ruby, Python, and/or Javascript</strong> 
              <p>Fluent in Python for 5 years</p>
              <ul>
                <li>Python was a huge part of the company I <Link to="/betterdata" className='internal-link'>built</Link></li>
                <li><Link to="/sportsanalytics" className='internal-link'>Sports analytics</Link> work I've done has been largely in Python</li>
                <li>Backend of <a href="https://github.com/korykilpatrick/aichetype" target='_blank'>this site</a> is Python (see <Link to='/devlog' className='internal-link'>DevLog</Link>)</li>
                <li>A friend and I built an online version of Jeopardy to play over Zoom during the pandemic. I wrote the <a href="https://github.com/korykilpatrick/j-data" target="_blank">backend</a> in Python.</li>
              </ul>
              <p>Fluent in Javascript for 5 years</p>
              <ul>
                <li>Frontend of <a href="https://github.com/korykilpatrick/aichetype" target='_blank'>this site</a> is Javascript/React (see <Link to='/devlog' className='internal-link'>DevLog</Link>)</li>
                <li>Completed a Javascript-based coding bootcamp in 2017</li>
                <li>Several Javascript projects on my <a href="https://github.com/korykilpatrick" target="_blank">github</a></li>
              </ul>
            </li>
            <li>
              <strong>Familiarity with C/C++/Rust</strong> 
              <p>Competency in C for 3 years. Not used in professional capacity, but familiar enough to become fluent quickly.</p>
              <ul>
                <li>Completed <a href="https://github.com/korykilpatrick/csprimer" target="_blank">projects</a> from <a href="https://www.csprimer.com" target="_blank">CSPrimer</a> in C</li>
                <li><a href="https://github.com/korykilpatrick/klox" target="_blank">Built</a> a language from scratch in C as part of <a href='https://craftinginterpreters.com/' target='_blank'>Crafting Interpreters</a></li>
                <li>Completed <a href="https://replit.com/@koryk" target="_blank">toy problems</a> in C and C++</li>
              </ul>
            </li>
            <li>
              <strong>Familiarity with container management and orchestration</strong> 
              <p>I'm familiar with Docker. We used it some in Better Data.</p>
            </li>
            <li>
              <strong>Familiarity with web application frameworks like Ruby on Rails or Django</strong> 
              <p>The backend of this site is in Flask. I have used Django as well. And Node express<Hoverable text="Is that still the JS backend of choice these days??"></Hoverable></p>
            </li>
            <li>
              <strong>Familiarity with HTML/CSS</strong> 
              <p>You're reading it :)</p>
            </li>
            <li>
              <strong>Experience with infrastructure development</strong> 
              <p>In building Better Data I gained experience with</p>
              <ul>
                <li>AWS - our software ran in the cloud</li>
                <li>Building backup/recovery/health check systems</li>
                <li>Network security</li>
                <li>Scripting - performing scheduled jobs e.g. code synchronization</li>
              </ul>
            </li>
          </ul>
          )}
        </section>
        <section>
          <h2 onClick={() => toggleSection('andMore')} className={`collapsible-header ${openSection.andMore ? 'active' : ''}`}>And More!</h2>
          {openSection.andMore && (
          // <p>Familiarity with AI techniques</p>
          <ul>
            <li>Implemented most exercises from Sutton/Barto's Reinforcement Learning book.</li>
            <li><a href='https://github.com/korykilpatrick/ai' target='_blank'>Implemented</a> Counterfactual Regret Minimization on small games</li>
            <li><a href="https://github.com/korykilpatrick/fastbook" target='_blank'>Implemented</a> most exercises from FastAI book</li>
            <li><a href="https://courses.edx.org/certificates/aa7d4e88285f4f85a6cbe2086ece2ffe?_gl=1*1ax0pfw*_ga*MTk2NTY5NDAzNS4xNjk5NTY2MTk2*_ga_D3KS4KMDT0*MTY5OTU2NjE5Ni4xLjEuMTY5OTU2NjI4OS4zMC4wLjA" target="_blank">Completed</a> a HarvardX program on Neuroscience <Hoverable text="This is my idea of fun 🤘">Fundamentals</Hoverable> </li>
          </ul>
          )}
        </section>
      </div>
    );
  };
  
  export default NeuralinkApplication;