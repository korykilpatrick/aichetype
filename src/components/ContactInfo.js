import React from 'react';
import '../css/ContactInfo.css';

const ContactInfo = () => {
  return (
    <div className="contact-info">
      <div className="contact-info-box">
        <h2>Holler</h2>
        <a href="https://twitter.com/kory_kilpatrick" target="_blank" rel="noopener noreferrer">Twitter</a>
        {/*<a href="https://www.linkedin.com/in/kory-kilpatrick-b60707243/" target="_blank" rel="noopener noreferrer">LinkedIn</a>*/}
        <a href="mailto:koryrkilpatrick@gmail.com?subject=Hey%20good%20lookin&body=Are%20you%20a%20bank%20loan?%20Because%20you%20have%20my%20interest.">Email</a>
      </div>
    </div>
  );
};

export default ContactInfo;