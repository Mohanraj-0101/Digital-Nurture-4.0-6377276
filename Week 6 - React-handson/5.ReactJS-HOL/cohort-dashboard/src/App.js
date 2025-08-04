import React from 'react';
import CohortDetails from './components/CohortDetails';

function App() {
  return (
    <div className="App">
      <h2>Cohort Dashboard</h2>
      <CohortDetails
        name="React Bootcamp"
        startDate="2025-06-01"
        endDate="2025-08-01"
        status="ongoing"
      />
      <CohortDetails
        name="Java Sprint"
        startDate="2025-03-01"
        endDate="2025-05-01"
        status="completed"
      />
    </div>
  );
}

export default App;
