import React, { useState } from 'react';
import { Card, Button } from 'antd';
import { Link } from 'react-router-dom';

const IntroPost = () => {
  const [count, setCount] = useState(0);

  return (
    <div style={{ padding: '20px' }}>
      <Card title="Bridging the Gap Between Stream of Consciousness and Blogging" bordered={false}>
        <p>
          There's something intimidating about the empty space of a blank page. Despite the fact that I often have 
          countless ideas I want to share, sometimes translating thoughts into written words can be a daunting task. 
          However, the beauty of being in our digital age is the ease with which we can capture ideas. I love to talk 
          – sometimes, I feel that I could talk forever. And thus, I hatched the idea to convert my stream of 
          consciousness into a coherent written form, to make content creation a seamless process. 
        </p>

        <p>
          Teaming up with the brilliant tools developed by <a target="_blank" rel="noreferrer" href='https://openai.com'>OpenAI</a>, 
          I've been able to set up a pipeline where I input an audio file (a recording of me talking about a certain 
          topic) and it spits out a rough draft of a blog post. One of my main tools includes the latest GPT versions, 
          which have been extremely handy in transforming an audio transcript into a well-structured draft.  
        </p>

        <p>
        The goal is to make this effectively easy so that I can generate content quickly. One of the ideas includes 
        speaking my thoughts as I flip through books that have imparted meaningful insights and influenced my thinking. 
        These voice memos can later be transcribed and smart-prompted into a preparatory draft.
        </p>

        <p>
          The second reason driving this setup is the need for a portfolio. Explaining my work in detail, articulating 
          my process, approaches, and outcomes all in front of a recorder, and converting that audio file will make 
          this task much less cumbersome.
        </p>

        <p>
          The ultimate aim is to be able to ramble at any point, like in a car ride, knowing that it can provide a  
          good starting point for a blog post. It's the kind of thing that gets me excited about the future of content 
          creation!
        </p>

        <p>
        It's important to remember that I'm still in the testing phase. I have different models at my disposal and 
        while my budget isn’t infinite, it does seem like I'm going to see improved results from GPT-4 than from 3.5 – something 
        which isn’t all that surprising. It may cost me a little, but the potential merits make it a compelling investment.
        </p>

        <p>
          That said, I can't wait to see what turns out from my first three and a half minute message. Stay tuned for 
          more updates!
        </p>

        <Button type="primary" shape="round">
          <Link to="/my-works">Check out my works</Link>
        </Button>
      </Card>
    </div>
  );
};

export default IntroPost;
