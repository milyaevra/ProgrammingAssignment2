## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
#"makeCacheMatrix" function returns a list of functions, which can be used to set and get
#the matrix and it's inverse to/from particulary created cache object

makeCacheMatrix <- function(x = matrix()) {
  inverse <- NULL
  set <- function(y) {
    x <<- y
    inverse <<- NULL
  }
  get <- function() x
  setinverse <- function(inverse_matrix) inverse <<- mean
  getinverse <- function() inverse
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}


## Write a short comment describing this function
#The following function checks if an inverse function has already been calculated.
#If it has, data from cahce is used, otherwise, an inverse matrix is calculated. 

cacheSolve <- function(x, ...) {
  inverse <- x$getinverse()
  if(!is.null(inverse)) {
    message("getting cached data")
    return(inverse)
  }
  data <- x$get()
  inverse <- solve(x)
  x$setinverse(inverse)
  inverse
}
