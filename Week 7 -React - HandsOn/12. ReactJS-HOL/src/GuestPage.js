import React from 'react';

const GuestPage = () => {
  return (
    <div>
      <h2>Welcome Guest!</h2>
      <p>You can browse available flights below:</p>
      <ul>
        <li>Flight A - 10:00 AM - ₹4000</li>
        <li>Flight B - 1:30 PM - ₹5200</li>
        <li>Flight C - 7:00 PM - ₹4500</li>
      </ul>
      <p><strong>Please login to book tickets.</strong></p>
    </div>
  );
};

export default GuestPage;
