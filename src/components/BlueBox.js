import React from 'react';
import '../css/BlueBox.css';

const BlueBox = ({ content, position, show }) => {
    return (
      <div className={`blue-box ${show ? 'show' : 'hide'}`} style={{ top: `${position.top - 30}px`, left: `${position.left}px` }}>
        {content}
      </div>
    );
  };
  
export default BlueBox;