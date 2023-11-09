import React, { useState } from 'react';
import NeuralinkApplication from './NeuralinkApplication';
import { Hoverable } from './component_utilities';
import '../css/Post.css';

const Neuralink = () => {
    const [openSection, setOpenSection] = useState({});

    const toggleSection = (section) => {
        setOpenSection(prevState => ({
        ...prevState,
        [section]: !prevState[section]
        }));
    };
    return (
    <div>
        {/* Intro video */}
        <div className='video'>
                    <iframe 
                        src="https://www.loom.com/embed/b44eb7ede50640b098df1772fa99cdbb?sid=3557c6e7-4500-43dc-8cfa-44bcb1de674d" 
                        frameBorder="0" 
                        allowFullScreen 
                        style={{ position: 'absolute', top: 0, left: 0, width: '100%', height: '100%' }}
                    ></iframe>
        </div>
        {/* Intro preamble */}
        <h3 onClick={() => toggleSection("introTranscript")} className={`collapsible-header ${openSection.introTranscript ? 'active' : ''}`}>Transcript</h3>
        {openSection.introTranscript && (
        <p>Some filler text</p>    
        )}
        {/* <h1>Neuralink Internship Application</h1> */}
        <NeuralinkApplication />
    </div>
    );
};

export default Neuralink;
