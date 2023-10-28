import React from 'react';
import ReactMarkdown from 'react-markdown';
import '../css/BlueBox.css';

const BlueBox = ({ content, position, show, onMouseEnter, onMouseLeave }) => {
  return (
    <div className={`blue-box ${show ? 'show' : 'hide'}`}
    //  style={{ top: `${position.top}px`, left: `${position.left}px` }}
     onMouseEnter={onMouseEnter}
     onMouseLeave={onMouseLeave}
    >
      <ReactMarkdown>{content}</ReactMarkdown>
    </div>

  );
};

export default BlueBox;