import React, { useState } from 'react';

const PenguinPost = () => {
  const [count, setCount] = useState(0);

  return (
    <div>
      <h2>Penguins are Awesome!</h2>
      <p>
        Penguins are flightless birds that live in the Southern Hemisphere,
        particularly Antarctica.
      </p>
      <button onClick={() => setCount(count + 1)}>
        Click me to count penguins!
      </button>
      <p>You've counted {count} penguins.</p>
    </div>
  );
};

export default PenguinPost;
