import React, { Component } from 'react';

class Posts extends Component {
  constructor(props) {
    super(props);
    this.state = {
      posts: [],
      hasError: false,
    };
  }

  // Fetch data using Fetch API
  loadPosts = async () => {
    try {
      const response = await fetch('https://jsonplaceholder.typicode.com/posts');
      const data = await response.json();
      this.setState({ posts: data });
    } catch (error) {
      console.error("Fetch error: ", error);
      this.setState({ hasError: true });
    }
  };

  // Called after component is mounted
  componentDidMount() {
    this.loadPosts();
  }

  // Error boundary for catching errors
  componentDidCatch(error, info) {
    alert("Something went wrong in Posts component!");
    console.error("Error caught: ", error, info);
    this.setState({ hasError: true });
  }

  render() {
    const { posts, hasError } = this.state;

    if (hasError) {
      return <h2>Something went wrong while loading posts.</h2>;
    }

    return (
      <div>
        <h1>Blog Posts</h1>
        {posts.slice(0, 10).map(post => (
          <div key={post.id} style={{ marginBottom: '20px' }}>
            <h2>{post.title}</h2>
            <p>{post.body}</p>
          </div>
        ))}
      </div>
    );
  }
}

export default Posts;
