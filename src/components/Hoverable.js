import React, { useState } from "react";
import { BlueBox } from "./component_utilities";
import '../css/Hoverable.css';

const Hoverable = ({ text, children }) => {
  const [showBox, setShowBox] = useState(false);
  const [boxPosition, setBoxPosition] = useState({ top: 0, left: 0 });
  const [key, setKey] = useState(Math.random()); // New state for forcing re-render
  // forcing re-render because it resets some css styling fuckery

  const handleMouseEnter = (e) => {
    const rect = e.target.getBoundingClientRect();
    setBoxPosition({ top: rect.top, left: rect.left + rect.width });
    setShowBox(true);
  };

  const handleMouseLeave = () => {
    setShowBox(false);
    setKey(Math.random()); // Force re-render by changing key
  };

  return (
    <span className="hoverable-wrapper" key={key}>
      {children}
      <span
        className="hover-trigger-box"
        onMouseEnter={handleMouseEnter}
        onMouseLeave={handleMouseLeave}
      >
        ⓘ
      </span>
      <BlueBox content={text} position={boxPosition} show={showBox} />
    </span>
  );
};

export default Hoverable;
