import React from 'react';

const courses = [
  { id: 'c1', name: 'React Fundamentals', duration: '4 weeks' },
  { id: 'c2', name: 'Node.js API Development', duration: '6 weeks' },
  { id: 'c3', name: 'Full Stack Bootcamp', duration: '8 weeks' }
];

function CourseDetails() {
  return (
    <div>
      <h2>🎓 Course Details</h2>
      <ul>
        {courses.map(course => (
          <li key={course.id}>{course.name} - {course.duration}</li>
        ))}
      </ul>
    </div>
  );
}

export default CourseDetails;
