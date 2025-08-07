import React from 'react';
import i1 from './assets/i1.jpg';
import i2 from './assets/i1.jpg';
import i3 from './assets/i1.jpg';
const offices = [
  {
    name: "Tech Hub",
    rent: 55000,
    address: "123 Tech Street, Bengaluru",
    image:i1
  },
  {
    name: "Startup Studio",
    rent: 72000,
    address: "88 Innovate Lane, Chennai",
    image:i2
  },
  {
    name: "Work Loft",
    rent: 60000,
    address: "7 CoWork Avenue, Hyderabad",
    image: i3
  }
];

const App = () => {
  return (
    <div style={{ padding: '20px', fontFamily: 'Arial' }}>
      <h1>Office Space Rental</h1>

      {offices.map((office, index) => (
        <div key={index} style={{ border: '1px solid #ccc', margin: '20px 0', padding: '10px' }}>
          <img src={office.image} alt={office.name} style={{ width: '300px', height: '200px' }} />
          <h2>{office.name}</h2>
          <p><strong>Address:</strong> {office.address}</p>
          <p style={{
            color: office.rent < 60000 ? 'red' : 'green',
            fontWeight: 'bold'
          }}>
            ₹ {office.rent.toLocaleString()}
          </p>
        </div>
      ))}
    </div>
  );
}

export default App;
