import React from 'react';
import '../css/BlueBox.css';

const BlueBox = ({ content, position, show, onMouseEnter, onMouseLeave }) => {
    return (
      <div className={`blue-box ${show ? 'show' : 'hide'}`}
           style={{ top: `${position.top - 30}px`, left: `${position.left}px` }}
           dangerouslySetInnerHTML={{ __html: content }}
           onMouseEnter={onMouseEnter}
           onMouseLeave={onMouseLeave}
      >
        {/* {content} */}
      </div>
    );
  };
  
export default BlueBox;