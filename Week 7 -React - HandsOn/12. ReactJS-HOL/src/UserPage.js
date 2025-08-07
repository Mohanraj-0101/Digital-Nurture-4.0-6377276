import React from 'react';

const UserPage = () => {
  return (
    <div>
      <h2>Welcome User!</h2>
      <p>Here are available flights. Click 'Book Now' to proceed:</p>
      <ul>
        <li>Flight A - 10:00 AM - ₹4000 <button>Book Now</button></li>
        <li>Flight B - 1:30 PM - ₹5200 <button>Book Now</button></li>
        <li>Flight C - 7:00 PM - ₹4500 <button>Book Now</button></li>
      </ul>
    </div>
  );
};

export default UserPage;
