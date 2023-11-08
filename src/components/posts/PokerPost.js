import React from "react";
import { Card, Button } from "react-bootstrap";
import { Image, Hoverable } from '../component_utilities';
import "../../css/Post.css";

const PokerPost = () => {
    return (
        <div className="container">
            <Card.Body>
                <Card.Title>
                    <h2 className='post-title'>Poker</h2>
                </Card.Title>
                <p>
                    I'm assuming Neuralink doesn't care much about the particulars of my poker career other than it being a proof of concept of competency. In case I'm misguided about that, I recorded a video of me playing a $2000 buy-in poker game and talking a bit about my history with the game. Below you will also find a database and graph of my results from playing sporadically since 2017.
                </p>
                <div className='video'>
                    <iframe 
                        src="https://www.loom.com/embed/b44eb7ede50640b098df1772fa99cdbb?sid=3557c6e7-4500-43dc-8cfa-44bcb1de674d" 
                        frameBorder="0" 
                        allowFullScreen 
                        style={{ position: 'absolute', top: 0, left: 0, width: '100%', height: '100%' }}
                    ></iframe>
                </div>
                <Card.Text>
                    <p>
                        That ended up being much longer than I was planning! The first half is just me rambling about my history with poker. At 31:42 I get into an interesting hand, then spend the rest of the video providing a high-level overview of <Hoverable text="while getting interrupted to play some big pots!">it,</Hoverable> giving insight into how I think about the game and its complexities.
                    </p>
                </Card.Text>
                <Image url="https://korykilpatrick-bucket.s3.us-west-1.amazonaws.com/pokerResultsTable.jpg" caption="" zoom={true}/>
                <Image url="https://korykilpatrick-bucket.s3.us-west-1.amazonaws.com/pokerResultsGraph.jpg" caption="My results since pseudo-retiring in 2017. The green line is actual results, but All-In Adj(usted) is a better indicator of performance." zoom={true} />
                <Card.Text>
                   <p></p>
                </Card.Text>
            </Card.Body>
            
        </div>
    );
};

export default PokerPost;