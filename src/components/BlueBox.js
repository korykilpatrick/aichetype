import React from 'react';
import '../css/BlueBox.css';

const BlueBox = ({ content, show, onMouseEnter, onMouseLeave }) => {
  return (
    <div className={`blue-box ${show ? 'show' : 'hide'}`}
         style={{ position: 'absolute' }}
         dangerouslySetInnerHTML={{ __html: content }}
         onMouseEnter={onMouseEnter}
         onMouseLeave={onMouseLeave}
    >
    </div>
  );
};

  
export default BlueBox;