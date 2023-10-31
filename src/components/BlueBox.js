import React from 'react';
import ReactMarkdown from 'react-markdown';
import '../css/BlueBox.css';

const BlueBox = ({ content, position, show, onMouseEnter, onMouseLeave }) => {
  const boxWidth = content.length > 30 ? '400px' : 'fit-content'

  return (
    <div className={`blue-box ${show ? 'show' : 'hide'}`}
    //  style={{ top: `${position.top}px`, left: `${position.left}px` }}
     style={{ width: boxWidth }}
     onMouseEnter={onMouseEnter}
     onMouseLeave={onMouseLeave}
    >
      <ReactMarkdown>{content}</ReactMarkdown>
    </div>

  );
};

export default BlueBox;