import React from 'react';

const ListofPlayers = () => {
  const players = [
    { name: 'Virat Kohli', score: 90 },
    { name: 'Rohit Sharma', score: 85 },
    { name: 'Shubman Gill', score: 65 },
    { name: 'KL Rahul', score: 50 },
    { name: 'Hardik Pandya', score: 75 },
    { name: 'Jadeja', score: 95 },
    { name: 'Bumrah', score: 40 },
    { name: 'Shami', score: 88 },
    { name: 'Kuldeep Yadav', score: 58 },
    { name: 'Surya Kumar', score: 91 },
    { name: 'Ishan Kishan', score: 45 }
  ];

  // Filter players with score < 70 using arrow function
  const lowScorers = players.filter(player => player.score < 70);

  return (
    <div>
      <h2>All Players and Scores</h2>
      <ul>
        {players.map((player, index) => (
          <li key={index}>{player.name} - {player.score}</li>
        ))}
      </ul>

      <h2>Players with Score below 70</h2>
      <ul>
        {lowScorers.map((player, index) => (
          <li key={index}>{player.name} - {player.score}</li>
        ))}
      </ul>
    </div>
  );
};

export default ListofPlayers;
