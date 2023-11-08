import React, { useState } from 'react';
import '../css/NeuralinkApplication.css';
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
        {/* <h1 className="page-title">Neuralink Internship Application</h1> */}
        <p></p>
        <section>
          <h2 onClick={() => toggleSection('aboutYou')} className={`collapsible-header ${openSection.aboutYou ? 'active' : ''}`}>About you</h2>
          {openSection.aboutYou && (
          <ul>
            <li>
              <strong>You find large challenges exciting and enjoy discovering and defining problems as much as solving them.</strong> 
              <p>When I was 17 I told my parents in complete earnest that I was going to be one of the best poker players in the world one day. At the time online poker was incredibly new, and nobody thought you could make a living doing <Hoverable text="probably because nobody ever had!">it.</Hoverable> A small group of people from all corners of the globe congregated in an online forum, where we explored and <Link to="/poker" className='internal-link'>conquered</Link> these uncharted waters.</p>
              <p>
                In 2019, despite having no significant programming experience beyond standard coursework and study, I assured a longtime colleague that two friends and I could build a better software product than the one he was using to run his business that executes $100 million per year in trades. Within a year <Link to="/betterdata" className='internal-link'>we did</Link> just that.
              </p>
            </li>
            <li>
              <strong>You deliver. You may enjoy thoughtful conversations about problems and perfecting designs, but in the end, you know that what matters is delivering a manufacturable solution that works every time.</strong> 
              <p>I've found myself on both ends of the theory vs practice spectrum at various points in my life, but it has become abundantly clear to me that biasing towards delivering is necessary. A few examples:
                <ul>
                  <li>When starting <Link to="/betterdata" className='internal-link'>Better Data</Link>, each day that we could not traffic an exchange directly and explicitly translated to dollars lost out of our client's <Hoverable text="and, consequently, ours">pockets.</Hoverable>We had to get <em>something</em> up immediately. We did, and made the necessary rewrites when time permitted.</li>
                  <li>This website! This is not the cleanest <a href="https://github.com/korykilpatrick/aichetype" target="_blank">code</a> or writing. The <Link to="/poker" className='internal-link'>poker video</Link> was unscripted and one take. I'm not trying to create a perfect website, I'm trying to take the path that leads to me working on interesting problems (at Neuralink! 🤞) as soon as possible.<Hoverable text="Funny aside - I briefly got snagged on the perfection bit with this f**king blue box you're currently reading. Web development is not my strength. Correctly positioning and sizing this damn box got the best of me one day, before I eventually reminded myself that it didn't need to be perfect and settled for a mediocre implementation."></Hoverable></li>
                  <li>To survive in the gambling world you have to be extremely comfortable with moving forward in the face of uncertainty and with incomplete information. If you wait to have a perfect gameplan to get in a game there will be no openings left or the bad players will have already lost all their money.</li>
                </ul>
              </p>
            </li>
            <li>
              <strong>You are a cross-disciplinary team member. You are excited to work with and learn from software, mechanical, electrical, materials, biological engineers, and neuroscientists. You are comfortable communicating across teams.</strong> 
              <ul>
                <li>Excited is an understatement! See my <Link to="/bookshelf" className='internal-link'>bookshelf</Link> if you want a glimpse into the breadth of my interests.</li>
                <li>I played team sports growing up, including college <Hoverable text="where I was captain of the team for two of my four years">basketball.</Hoverable> Working with a small team toward a shared goal is where I thrive.</li>
              </ul>
            </li>
            <li>
              <strong>Resourceful, flexible and adaptable; no task is too big or too small.</strong> 
              <p>
                I grew up with parents who ran 4 am paper routes and worked multiple jobs to feed and care for my siblings and I, which instilled in me humility and resourcefulness. I've gotten burned by not handling the small stuff enough times to appreciate how important every detail is.
              </p>
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
              <p>6 years of experience. Completed <a href="https://www.galvanize.com/hack-reactor/" target="_blank">Hack Reactor</a> in 2017. Been addicted to the code since!</p>
            </li>
            <li>
              <strong>9+ months experience of application of technical skills outside of the classroom (examples: laboratory, research, extracurricular project teams, open source contributions, volunteering, personal projects or prior internship/work experience)</strong> 
              <p>5 years of non-classroom application of technical skills. Started personal projects in 2018. Started building production-grade products in 2019.</p>
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
                <li>Backend of <a href="https://github.com/korykilpatrick/aichetype" target='_blank'>this site</a> is Python</li>
                <li>A friend and I built an online version of Jeopardy to play over Zoom during the pandemic. I wrote the <a href="https://github.com/korykilpatrick/j-data" target="_blank">backend</a> in Python.</li>
              </ul>
              <p>Fluent in Javascript for 5 years</p>
              <ul>
                <li>Frontend of <a href="https://github.com/korykilpatrick/aichetype" target='_blank'>this site</a> is Javascript/React</li>
                <li>Completed a coding bootcamp in 2017 in Javascript</li>
                <li>Several Javascript projects on my <a href="https://github.com/korykilpatrick" target="_blank">github</a></li>
              </ul>
            </li>
            <li>
              <strong>Familiarity with C/C++/Rust</strong> 
              <p>Competency in C for 3 years. Not regularly used, but familiar enough to become fluent quickly.</p>
              <ul>
                <li>Completed some <a href="https://github.com/korykilpatrick/csprimer" target="_blank">projects</a> from <a href="https://www.csprimer.com" target="_blank">CSPrimer</a> in C</li>
                <li><a href="https://github.com/korykilpatrick/klox" target="_blank">Built</a> a language from scratch in C as part of <a href='https://craftinginterpreters.com/' target='_blank'>Crafting Interpreters</a></li>
                <li>Completed some random <a href="https://replit.com/@koryk" target="_blank">toy problems</a> in C and C++</li>
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
            <li>Completed most exercises from Sutton/Barto's Reinforcement Learning book.</li>
            <li>Implemented Counterfactual Regret Minimization on small <a href='https://github.com/korykilpatrick/ai' target='_blank'>games</a></li>
            <li>Completed most exercises from <a href="https://github.com/korykilpatrick/fastbook" target='_blank'>FastAI book</a></li>
          </ul>
          )}
        </section>
      </div>
    );
  };
  
  export default NeuralinkApplication;