import React, { useState } from 'react';
import BookDetails from './BookDetails';
import BlogDetails from './BlogDetails';
import CourseDetails from './CourseDetails';
import './App.css';

function App() {
  const [active, setActive] = useState('book'); // book | blog | course

  // 1. Element variable conditional rendering
  let content;
  if (active === 'book') {
    content = <BookDetails />;
  } else if (active === 'blog') {
    content = <BlogDetails />;
  } else {
    content = <CourseDetails />;
  }

  return (
    <div className="App">
      <h1>📚 Blogger App</h1>
      <div>
        <button onClick={() => setActive('book')}>Show Book Details</button>
        <button onClick={() => setActive('blog')}>Show Blog Details</button>
        <button onClick={() => setActive('course')}>Show Course Details</button>
      </div>

      <hr />

      {/* 2. Rendering using element variable */}
      {content}

      {/* 3. Conditional rendering using ternary operator */}
      {/* {active === 'book' ? <BookDetails /> : active === 'blog' ? <BlogDetails /> : <CourseDetails />} */}

      {/* 4. Conditional rendering using && */}
      {/* {active === 'book' && <BookDetails />}
      {active === 'blog' && <BlogDetails />}
      {active === 'course' && <CourseDetails />} */}
    </div>
  );
}

export default App;
