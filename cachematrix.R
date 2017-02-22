## Matrix inversion is usually a costly computation and there may be
## some benefit to caching the inverse of a matrix rather than compute
## it repeatedly.
## This scrpt contains of a pair of functions that cache the inverse of a matrix.

## This function creates a "matrix" object that can cache its inverse.

makeCacheMatrix <- function(x = matrix()){
    i <- NULL
    set <- function(y){
        x <<- y
        i <<- NULL
    }
    get <- function() x
    setinverse <- function(solve) i <<- solve
    getinverse <- function() i
    list(set = set, get = get,
         setinverse = setinverse,
         getinverse = getinverse)
}

## The function above computes the inverse of matrix .
## If the inverse has already been calculated than it brings the inverse from the chach.

chachSolve <- function(x, ...) {
    i <- x$getinverse()
    if(!is.null(i)){
        message("getting cached data")
        return(m)
    }
    data <- x$get()
    i <- solve(data, ...)
    x$setinverse(i)
    i
}