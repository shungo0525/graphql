# README

# Query

## post(id: 1)
```
{
	post(id: 1) {
    id
    title
    description
    comments {
      id
      content
    }
  }   
}
```

## posts
```
{
	posts {
    id
    title
    description
    comments {
      id
      content
    }
  }   
}
```

## posts_pagination
```
{
	postsPagination(first: 5, after: "") {
    edges {
      node {
        id
        title
        description
        comments {
          id
          content
        }
      }
    }
    pageInfo{
      endCursor
      hasNextPage
      startCursor
      hasPreviousPage
		}
	}
}
```


## comments
```
{
	comments {
    id
    content
    post {
      id
      title
      description
    }
  }   
}
```

# Mutation

## create_post
```
mutation { 
  createPost(
    input:{
      title: "title"
      description: "description"
    }
  ){
    post {
      id
      title
      description
    }
  }   
}
```


## update_post
```
mutation { 
  updatePost(
    input:{
      id: 1
      title: "title-updated"
      description: "description-updated"
    }
  ){
    post {
      id
      title
      description
    }
  }   
}
```


## delete_post
```
mutation { 
  deletePost(
    input:{
      id: 1
    }
  ){
    post {
      id
      title
      description
    }
  }   
}
```


## create_comment
```
mutation {
  createComment(
    input:{
      postId: 1
      content: "NEW COMMENT"
    }
  ){
    comment {
      id
      content
      post {
        id
        title
        comments {
          id
          content
        }
      }
    }
  }
}

```


## update_comment
```
mutation {
  updateComment(
    input:{
      id: 1
      content: "Edit COMMENT"
    }
  ){
    comment {
      id
      content
      post {
        id
        title
        comments {
          id
          content
        }
      }
    }
  }
}
```


## delete_comment
```
mutation {
  deleteComment(
    input:{
      id: 1
    }
  ){
    comment {
      id
      content
      post {
        id
        title
        comments {
          id
          content
        }
      }
    }
  }
}
```
