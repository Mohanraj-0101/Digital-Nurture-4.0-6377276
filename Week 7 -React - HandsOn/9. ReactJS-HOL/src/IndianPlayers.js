import React from 'react';

const IndianPlayers = () => {
  const team = [
    'Virat', 'Rohit', 'Gill', 'Rahul', 'Hardik',
    'Jadeja', 'Bumrah', 'Shami', 'Kuldeep', 'Surya', 'Ishan'
  ];

  // Destructuring to separate odd and even indexed players
  const oddPlayers = team.filter((_, index) => index % 2 === 0);
  const evenPlayers = team.filter((_, index) => index % 2 !== 0);

  // Two different player arrays
  const T20players = ['Virat', 'Rohit', 'Hardik'];
  const RanjiTrophyPlayers = ['Pujara', 'Rahane'];

  // Merge arrays using spread operator
  const mergedPlayers = [...T20players, ...RanjiTrophyPlayers];

  return (
    <div>
      <h2>Odd Team Players</h2>
      <ul>
        {oddPlayers.map((player, index) => <li key={index}>{player}</li>)}
      </ul>

      <h2>Even Team Players</h2>
      <ul>
        {evenPlayers.map((player, index) => <li key={index}>{player}</li>)}
      </ul>

      <h2>Merged Players (T20 + Ranji)</h2>
      <ul>
        {mergedPlayers.map((player, index) => <li key={index}>{player}</li>)}
      </ul>
    </div>
  );
};

export default IndianPlayers;
