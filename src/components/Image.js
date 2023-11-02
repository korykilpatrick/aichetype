import React from 'react';
import ReactMarkdown from 'react-markdown';
import '../css/Image.css';

const Image = ({ url, caption, size = 1, zoom = false }) => {
  const handleMouseMove = (e) => {
    if (!zoom) return;

    const { left, top, width, height } = e.target.getBoundingClientRect();
    const x = ((e.clientX - left) / width) * 100;
    const y = ((e.clientY - top) / height) * 100;
    e.target.style.transformOrigin = `${x}% ${y}%`;
  };

  return (
    <div className="image-container">
      <div className="image-wrapper" style={{ width: `${size * 100}%`, height: "auto", objectFit: "contain" }} >
        <img
          src={url}
          alt={caption}
          className={`image ${zoom ? 'zoom' : ''}`}
          onMouseMove={handleMouseMove}
        />
      {/* <ReactMarkdown className="caption">{caption}</ReactMarkdown> */}
      <p className="caption" dangerouslySetInnerHTML={{ __html: caption }}></p>
      </div>
    </div>
  );
};

export default Image;
