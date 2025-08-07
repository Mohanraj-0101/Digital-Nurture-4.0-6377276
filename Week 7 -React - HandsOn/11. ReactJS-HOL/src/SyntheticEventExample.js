import React from 'react';

const SyntheticEventExample = () => {
  const handleClick = (e) => {
    console.log(e); // synthetic event object
    alert("I was clicked!");
  };

  return (
    <div>
      <button onClick={handleClick}>OnPress</button>
    </div>
  );
};

export default SyntheticEventExample;
