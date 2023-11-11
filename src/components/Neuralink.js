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
        <div className='video' style={{ position: 'relative', paddingBottom: '56.25%', height: 0, overflow: 'hidden' }}>
            <div id="spinner" style={{ position: 'absolute', top: '50%', left: '50%', transform: 'translate(-50%, -50%)' }}>
            <div id="spinner" style={{display: 'flex', alignItems: 'center', justifyContent: 'center'}}>
                <div class="loader"></div>
            </div>
            </div>
            <iframe 
                src="https://www.loom.com/embed/39ba68e571d14cf7b89689c5cee52d54?sid=5f16e696-ce0c-49fe-a96b-5a664f357ca5" 
                frameborder="0" 
                webkitallowfullscreen mozallowfullscreen allowfullscreen 
                style={{ position: 'absolute', top: 0, left: 0, width: '100%', height: '100%' }}
                onLoad={() => document.getElementById('spinner').style.display = 'none'}>
            </iframe>
        </div>

        {/* Intro preamble */}
        <h3 onClick={() => toggleSection("introTranscript")} className={`collapsible-header ${openSection.introTranscript ? 'active' : ''}`} style={{color: 'gray', fontSize: '18px'}}>Transcript</h3>
        {openSection.introTranscript && (
        <div className='transcript'>
            <p>
                Thank you so much for clicking on this link and for your consideration. As the domain name may have given away, I built this website as part of my application for the software engineering internship at Neuralink.
            </p>
            <p>
                I've been fortunate to be able to work for myself professionally my entire life. I organically grew a broad network in the world of finance and investing and gambling. And as a result have had no particular need or desire to have a public presence of any kind. That is, until I applied for a full-time software engineering role at Neuralink, which made me fully appreciate that to make the kind of career pivot that I'm ready and longing to make, I need to come out from under the rock that I've lived under and showcase what I've been up to a bit more.
            </p>
            <p>
                I'm fortunate to have reached a very comfortable place where I can work if and when I want to. I have an abundance of opportunities to apply the software engineering skills that I've built over the past six and a half years in the real of finance and investing and gambling. But I'm not interested in that any longer. 
            </p>
            <p>
                I'm hungry. I'm hungry for a challenge. I'm hungry for meaningful work. I'm hungry to make a difference. And frankly, I'm hungry for Neuralink! I haven't been able to get Neuralink out of my head since I devoured the Wait But Why article on the day that it came out in 2017. It struck me as incredibly obvious that BCIs are the future. I believe wholeheartedly that Neuralink is doing the most interesting work in the world right now. I got into software engineering shortly after that article came out in large part with the intention of one day hoping to work with Neuralink.
            </p>
            <p>
                So out of respect for your time I will stop rambling and just say that I I try to be as succint as possible. I provided both short and long form versions of the work that I've done on this website, whichever is to your liking, beneath this video. You'll find a copy of all the bullets that Neuralink is listing wanting from an applicant for the software engineering position, complete with my responses of how I meet those bullets.
            </p>
            <p>
                I think that I'm a great candidate for the position. I hope you agree and either way, thank you very much for taking the time and I hope to talk soon. Thank you.
            </p>
        </div>
        )}
        <div class="thick-line-break"></div>

        <NeuralinkApplication />
    </div>
    );
};

export default Neuralink;
