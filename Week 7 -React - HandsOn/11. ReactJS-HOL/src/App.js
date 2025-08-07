import React from 'react';
import Counter from './Counter';
import WelcomeButton from './WelcomeButton';
import SyntheticEventExample from './SyntheticEventExample';
import CurrencyConvertor from './CurrencyConvertor';
import './App.css'

function App() {
  return (
    <div className="App">
      <h1>React Event Examples</h1>
      <Counter />
      <WelcomeButton />
      <SyntheticEventExample />
      <CurrencyConvertor />
    </div>
  );
}

export default App;
