import React, { useState } from 'react';

const TechPost = () => {
  const [count, setCount] = useState(0);

  return (
    <div>
      <h2>Tech Post</h2>
      <p>This is a tech post about some cool technology.</p>
      <button onClick={() => setCount(count + 1)}>Click Me</button>
      <p>You clicked {count} times.</p>
    </div>
  );
};

export default TechPost;
