import React, { useState } from 'react';
import { Link } from 'react-router-dom';
import '../css/Post.css';
import { Hoverable } from './component_utilities';

const DevLog = () => {
    const [openSection, setOpenSection] = useState({});

    const toggleSection = (section) => {
      setOpenSection(prevState => ({
        ...prevState,
        [section]: !prevState[section]
      }));
    };

    return (
        <div>
            <h2 className='post-title'>DevLog</h2>
            <div className='post-subtitle'>Notes from the Underground</div>
            <p>
                My first commit on this project is from March 18th of this year. It was originally going to be a blog/personal site, but it quickly got cast into the Well of Projects Unfinished. In September I had the idea to leverage the power of React to build a digital library that felt more library-like than the soul-less list of titles I commonly see, which led to my online <Link to='bookshelf' className='internal-link'>bookshelf</Link>.
            </p>
            <p>
                Then I had the idea to use the OpenAI API to try to build a pipeline in which I could turn a voice memo into a blog post. I struggle to write about myself, but talking is much easier for me. I got that operational, but I couldn't get the GPT4 output to sound like me. 
            </p>
            <p>
                Then in late October I saw the software engineering internship role on the Neuralink site, and knew that I needed to turn this wandering project into part of my application. Since I'm open-sourcing this code, I thought I'd at least touch on these lingering Ghosts of Ideas Past, and talk a little about implementation decisions.
            </p>
            <h2><a href="https://github.com/korykilpatrick/aichetype" target="_blank">Code</a></h2>
            <section>
                <h2 onClick={() => toggleSection('techStack')} className={`collapsible-header ${openSection.techStack ? 'active' : ''}`}>Tech Stack</h2>
                {openSection.techStack && (
                <div>
                    <ul>
                        <li><strong>React/Javascript</strong></li>
                            <ul>
                                <li>Performance less important than easy expressibility. Want access to React's robust ecosystem of tools and libraries for rapid implementation of complex UI components</li>
                                <li>Familiarity</li>
                            </ul>
                        <li><strong>HTML/CSS</strong></li>
                        <li><strong>Python/Flask</strong></li>
                            <ul>
                                <li>Minimal backend needs</li>
                                <li>I wanted a Python-based backend so I could recycle a postgres wrapper I had already written and like</li>
                                <li>Flask &gt; Django because simple and lightweight suffices</li>
                            </ul>
                        <li><strong>PostgreSQL</strong></li>
                            <ul>
                                <li>Need relational database for books (if nothing else)</li>
                                <li>Familiarity + can recycle tooling I've already written</li>
                            </ul>
                        <li><strong>AWS</strong></li>
                            <ul>
                                <li>Need cloud provider</li>
                                <li>Familiarity with S3/RDS/EC2, which suffices for this project</li>
                            </ul>
                    </ul>
                </div>
                )}
            </section>
            <section>
                <h2 onClick={() => toggleSection('Architecture')} className={`collapsible-header ${openSection.Architecture ? 'active' : ''}`}>Architecture</h2>
                {openSection.Architecture && (
                <div>
                <h4>Hard-coded vs database content</h4>
                <p>
                    I deliberated whether to have content hard-coded into React components or stored in a database. Hard-coding is simpler<Hoverable text="just copy a template for a post, write the content, and voila!"></Hoverable>  and has faster page loads.<Hoverable text="since theres no db calls to fetch data"></Hoverable> Database content is more flexibile,<Hoverable text="you can dynamically manage content, like filtering, sorting, searching, or tagging posts"></Hoverable> more scalable,<Hoverable text="a 1:1 ratio of components to posts becomes ridiculous at some point"></Hoverable>, more maintainable,<Hoverable text="if you want to change the layout of posts, you only have to change it in one place"></Hoverable> and has a cleaner separation of concerns.<Hoverable text="the UI is only concerned with displaying data, not fetching it"></Hoverable> 
                </p>
                <p>
                    I decided to go with hard-coded content for now because:
                    <ul>
                        <li>Minimal marginal work is required to refactor to be database driven. Only additional work would be to write a script that parses the content from all the posts I've written and save them in the database.</li>
                        <li>I wanted to have the option to inject React features into my posts, so post-content is React code, not just plaintext or markdown. To create an efficient development cycle with database-fetched React content I would need to write some tools that allows me to load posts from my database in my text editor, edit them, and have them saved to the database when I save the file.<Hoverable text="We developed a workflow like this for Better Data"></Hoverable> This is a non-trivial amount of work.</li>
                        <li>I'm hoping to get hired by Neuralink and have no desire to scale this project!</li>
                    </ul>
                    
                </p>
                </div>
                )}
            </section>
            <section>
                <h2 onClick={() => toggleSection('deployment')} className={`collapsible-header ${openSection.deployment ? 'active' : ''}`}>Deployment</h2>
                {openSection.deployment && (
                <div>
                    <ul>
                        <li>Front end, backend, database all hosted on an AWS EC2 instance. Once I decided to hard code the content, the only work left for the backend is to grab the book data from the database. It seems unnecessary to make it more complicated with such minimal backend and db requirements.</li>
                        <li>Integrating changes is as simple as ssh'ing into the EC2 instance and running a script that pulls from the main branch of the github repo, installs new packages if needed, and restarts everything.</li>
                        <li>A cronjob runs <em>app/books/goodreads.py</em> once a day to pull in new updates I make to goodreads.</li>
                    </ul>
                </div>
                )}
            </section>
            <section>
                <h2 onClick={() => toggleSection('graveyard')} className={`collapsible-header ${openSection.graveyard ? 'active' : ''}`}>Graveyard</h2>
                {openSection.graveyard && (
                <div>
                    <h3>GPTme</h3>
                    <p>In <em>app/gptme</em> you will find code that uses the OpenAI API and <a href="https://www.langchain.com/" target="_blank">LangChain</a> to run an interactive prompt where you can dialogue with a GPT model trained on some writing of mine. I thought it would be funny for people to be able to talk to GPTkory, but I didn't have enough usable training data to make it any good. Maybe I'll add content from this site and resurrect it!</p>

                    <h3>Speech-To-Post</h3>
                    <p>
                        In <em>app/speech-to-post</em> you will find code that uses the OpenAI API to turn a voice memo into a blog post. It reads in a voice memo, transcribes it, uses the OpenAI API to generate a react component, and saves it in the appropriate place in my project. As a result I can ramble into my Iphone while driving, drag the voice memo file into a folder, then automatically have a blog post based on my voice memo displayed on my site!<Hoverable text="Apple doesn't save voice memos in a static location and it wasn't immediately obvious to me how to programmatically find where a new voice memo is saved. If I revisit this I will figure that out and automate the process of finding the voice memo and running the script, meaning whenever I make a voice memo it will automatically be rendered as a blog post on my site!"></Hoverable> I tried tweaking the prompt a few times to make it sound more authentic, but I eventually decided I needed more training data to make it sound like me. Here are a few examples of posts that it generated based on my voice memos:
                        <ul>
                            <li><Link to="/intro" className='internal-link'>Intro</Link></li>
                            <li><Link to="/careeroverview" className='internal-link'>Career Overview</Link></li>
                            <li><Link to="/macmiller" className='internal-link'>Mac Miller</Link></li>
                        </ul>
                        I think it's pretty cool that I can talk into my phone and have React code and a blog post automatically generated based on the content, but I have to fiddle with it some more to do anything serious with it.
                    </p>

                    <h3>Projects backend</h3>
                    <p>
                        I started writing the backend route for a 'projects' page, but pivoted to the hard-coded components instead. I left the code in case I want to pivot to a database-driven approach in the future.
                    </p>
                </div>
                )}
            </section>
            <section>
                <h2 onClick={() => toggleSection('techDebt')} className={`collapsible-header ${openSection.techDebt ? 'active' : ''}`}>Tech Debt</h2>
                {openSection.techDebt && (
                <div>
                    <ul>
                        <li><em>src/components</em> needs to be better organized</li>
                        <li>Config and environment variables could be handled better</li>
                        <li>A number of files have comments and print statements that should be replaced with tests</li>
                        <li>When the blue box has between ~10 and 30 characters<Hoverable text="like this damnit"></Hoverable> it displays awkwardly. This is because I almost drove myself mad trying to figure out how to both display the box in the correct place and have it be the correct width and height, before eventually capitulating and realizing I have better things to work on.</li>
                    </ul>
                </div>
                )}
            </section>
            <section>
                <h2 onClick={() => toggleSection('misc')} className={`collapsible-header ${openSection.misc ? 'active' : ''}`}>Misc.</h2>
                {openSection.misc && (
                <div>
                    <ul>
                        <li>You'll see the project repo is titled <strong>aichetype</strong>. This is a play on the word 'archetype' and 'AI'. Carl Jung is one of my biggest influences, and archetypes are a core part of his ideology. You may also see the term <strong>numinousloop</strong> in my project - a hat tip to Jung's concept of the numinous and Douglas Hofstadter's idea of consciousness as a 'strange loop'.</li>
                    </ul>
                </div>
                )}
            </section>
        </div>
    );
};

export default DevLog;
