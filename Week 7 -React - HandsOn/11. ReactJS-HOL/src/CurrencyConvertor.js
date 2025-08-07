import React, { useState } from 'react';

const CurrencyConvertor = () => {
  const [rupees, setRupees] = useState('');
  const [euros, setEuros] = useState('');

  const handleSubmit = (e) => {
    e.preventDefault();
    const euroValue = (parseFloat(rupees) / 90).toFixed(2); // Approx 1 Euro = ₹90
    setEuros(euroValue);
  };

  return (
    <div>
      <h2>Currency Convertor</h2>
      <form onSubmit={handleSubmit}>
        <input
          type="number"
          placeholder="Enter amount in ₹"
          value={rupees}
          onChange={(e) => setRupees(e.target.value)}
        />
        <button type="submit">Convert</button>
      </form>
      {euros && <p>Amount in Euro: €{euros}</p>}
    </div>
  );
};

export default CurrencyConvertor;
