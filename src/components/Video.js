import React from 'react';
import '../css/Video.css';
import '../css/Post.css';

const Video = ({ embedUrl, scale = 1, title = "YouTube video player", frameBorder = "0", allow = "accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share", allowFullScreen = true, aspectRatio = 56.25, caption = "" }) => {
  const wrapperStyle = {
    width: `${scale * 100}%`, // Scale the width of the video wrapper
    margin: '0 auto' // Center the wrapper
  };

  const containerStyle = {
    paddingTop: `${aspectRatio}%`, // Maintain aspect ratio
    position: 'relative'
  };

  return (
    <div className="video-wrapper" style={wrapperStyle}>
      <div className="video-container" style={containerStyle}>
        <iframe
          src={embedUrl}
          title={title}
          frameBorder={frameBorder}
          allow={allow}
          allowFullScreen={allowFullScreen}
          className="video-frame"
        ></iframe>
      </div>
      <p className="caption" dangerouslySetInnerHTML={{ __html: caption }}></p>
    </div>
  );
};

export default Video;
