import React from 'react';

const blogs = [
  { id: 101, title: 'React Hooks Guide', writer: 'Praveena' },
  { id: 102, title: 'State vs Props', writer: 'Alex' },
  { id: 103, title: 'React Router 6', writer: 'Nina' }
];

function BlogDetails() {
  return (
    <div>
      <h2>📝 Blog Details</h2>
      <ul>
        {blogs.map(blog => (
          <li key={blog.id}>{blog.title} - by {blog.writer}</li>
        ))}
      </ul>
    </div>
  );
}

export default BlogDetails;
