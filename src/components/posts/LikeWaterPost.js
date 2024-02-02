import React, { useState } from 'react';
// import { Card, Button } from 'antd';
import { Link } from 'react-router-dom';
import { Image, Video, Hoverable } from '../component_utilities';
import '../../css/Post.css';

const LikeWater = () => {
  const [count, setCount] = useState(0);

  return (
    <div style={{ padding: '20px' }}>
        <p>
          Somewhere Bruce Lee is smiling.  
        </p>
        <Video embedUrl="https://www.youtube.com/embed/cJMwBwFj5nQ?si=FRfKmgmuvV3hTDkO" scale={.75}/>
        {/* <Button type="primary" shape="round">
          <Link to="/my-works">Check out my works</Link>
        </Button> */}
      {/* </Card> */}
    </div>
  );
};

export default LikeWater;
