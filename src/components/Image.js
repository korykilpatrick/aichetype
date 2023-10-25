import React from 'react';
import '../css/Image.css';

const Image = ({ url, caption }) => {
  const handleMouseMove = (e) => {
    const { left, top, width, height } = e.target.getBoundingClientRect();
    const x = ((e.clientX - left) / width) * 100;
    const y = ((e.clientY - top) / height) * 100;
    e.target.style.transformOrigin = `${x}% ${y}%`;
  };

  return (
    <div className="image-container">
      <div className="image-wrapper">
        <img
          src={url}
          alt={caption}
          className="image"
          onMouseMove={handleMouseMove}
        />
      </div>
      <p className="caption">{caption}</p>
    </div>
  );
};

export default Image;
