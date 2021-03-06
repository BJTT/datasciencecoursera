## makeCacheMatrix creats a special matrix that can cache its inverse
## cacheSolve computes the inverse


#  This function creates a special "matrix" object that can cache its inverse
makeCacheMatrix <- function(x = matrix()) {  
  #  x is a matrix  
  
  inv <- NULL
  set <- function(y) {
    x <<- y
    inv <<- NULL
  }
  get <- function() x
  setinv <- function(solve) inv <<- solve
  getinv <- function() inv
  list(set = set, get = get,
       setinv = setinv,
       getinv = getinv)
  
}



# This function computes the inverse of the special "matrix"   
# returned by makeCacheMatrix . 
# If the inverse has already been calculated (and the matrix has not changed), 
# then the cachesolve should retrieve the inverse from the cache.
cacheSolve <- function(x, ...) {
  # x is a matrix creat by the makeCacheMatrix.R
  
  ## Return a matrix that is the inverse of 'x'
  
  inv <- x$getinv()
  if(!is.null(inv)) {
    message("getting cached data")
    return(inv)
  }
  data <- x$get()
  if(det(data)==0){
    print("Sorry, the inverse of this matrix doesn't exist!")   # calculate the det of the matrix to judge whether the inverse  exists or not
  }else{   
    inv <- solve(data, ...)
    x$setinv(inv)
    inv
  }
}
