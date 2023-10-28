import React from "react";
import { Card, Button } from "react-bootstrap";
import { NavLink } from "react-router-dom";
import axios from 'axios';

const PokerPost = () => {
    return (
        <div className="container">
            <Card.Body>
                <Card.Title>
                    <h1>My Journey into the World of Poker</h1>
                </Card.Title>
                <Image url="https://korykilpatrick-bucket.s3.us-west-1.amazonaws.com/pokerResultsTable.jpg" caption="" zoom={true}/>
                <Image url="https://korykilpatrick-bucket.s3.us-west-1.amazonaws.com/pokerResultsGraph.jpg" caption="My results since pseudo-retiring in 2017. The green line is actual results, but All-In Adj(usted) is a better indicator of performance." zoom={true} />
                <Card.Text>
                    <p>In 2003, Chris Moneymaker's stunning victory in the <a href='https://www.wsop.com/'>World Series of Poker</a> set shockwaves across the globe, 
                    demonstrating that even an accountant from Tennessee could rule the poker world. This event defied my 14-year-old self and sparked my interest in poker.</p>

                    <p>Over time, my passion for the game evolved. I learned about online poker at 17 and was faced with a paradigm shift as 
                    poker was no longer just about reading faces across a table. My first encounter with online poker was on a free site, and I 
                    came across <a href='https://www.pocketfives.com/' target='_blank'>pocketfives.com</a>, and <a href='https://www.twoplustwo.com/' target='_blank'>twoplustwo.com</a>. These platforms were a revelation, opening a completely 
                    mesmerizing world of online poker where teenagers were making big money playing the game.</p>

                    <p><b>Next Step: Online Poker</b></p>

                    <p>I was hooked and invested time and energy into this fascinating world. Be it reading poker handbooks under my school desk or analyzing poker moves late into the night, 
                    there was an intense drive to figure out the game. My dedication bore fruit when I won second place in my first online poker tournament, taking home $500. However, despite the monetary gain, 
                    what I cherished more was the thrill of the game, the rush of competing, and the dream of being the best poker player in the world.</p>

                    <p>For the next eight or nine years, I committed myself to poker. In high school, I made around $50,000 from poker tournaments. By the time I graduated, I was already on the top 25 rankings list. 
                    In college, I juggled basketball, studies, and poker, focusing more on cash games than tournaments.</p>

                    <p>Despite my love for Texas Hold'em, I pivoted towards Pot Limit Omaha because of its growth potential and game dynamics. With the help of Omaha Ranger, a tool for data analysis, 
                    I was able to analyze my strategies. The road had ups and downs, but the journey was essential for growth. While the swings in Pot Limit Omaha were breathtakingly wild, I got my biggest break when I won a bracelet 
                    in No Limit Hold'em in 2014.</p>

                    <p>After college, I decided to take a different route. Poker had served its purpose and it was time to move on. Even though I had achieved a lot, the game's inherent ambiguity and variability meant there was always room for debate about "the best". 
                    Hence, I decided to focus on mission-oriented goals and took up "earn to give", using my poker skills to make money and donate it.</p>

                    <p>And that marks the end of my poker journey. Even today I play occasionally, but my main focus has shifted towards more substantial life works. And to any aspiring poker player reading this, remember, it's not only about the money, it's more about understanding the game, 
                    the thrill of competing, and the determination to be the best.</p>
                </Card.Text>
            </Card.Body>
            
        </div>
    );
};

export default PokerPost;