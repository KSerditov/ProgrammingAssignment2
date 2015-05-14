## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

## Similar to the caching vector mean example, this function creates 
## a list with functions to set and get original matrix and also to set and 
## get its inverse.
makeCacheMatrix <- function(x = matrix()) {

    m <- NULL
    set <- function(y) {
        x <<- y
        m <<- NULL
    }
    get <- function() x
    setsolve <- function(solve) m <<- solve
    getsolve <- function() m
    
    list(set = set, 
         get = get,
         setsolve = setsolve,
         getsolve = getsolve)
}


## Write a short comment describing this function

## This function works with "CacheMatrix" list created with the function above
## and checks if inverse matrix was already calculated
## to avoid unnecessary calculation.
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
    m <- x$getsolve()
    if(!is.null(m)) {
        message("getting cached data")
        return(m)
    }
    data <- x$get()
    m <- solve(data, ...)
    x$setsolve(m)
    m
}
