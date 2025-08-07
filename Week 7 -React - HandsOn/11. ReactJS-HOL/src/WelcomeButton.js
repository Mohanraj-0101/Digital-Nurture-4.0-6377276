import React from 'react';

const sayMessage = (msg) => {
  alert(msg);
};

const WelcomeButton = () => {
  return (
    <div>
      <button onClick={() => sayMessage("Welcome!")}>Say Welcome</button>
    </div>
  );
};

export default WelcomeButton;
