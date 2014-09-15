## Put comments here that give an overall description of what your
## functions do

## This function creates a list with the functions to manipulate a matrix() (get and set) and its inverse (getSol and setSol)

makeCacheMatrix <- function(x = matrix()) {
        Sol <- NULL
        set <- function(y) {
                x <<- y
                Sol <<- NULL
        }
        get <- function() x
        setSol <- function(solve) Sol <<- solve
        getSol <- function() Sol
        list(set = set, get = get,
             setSol = setSol,
             getSol = getSol)
}


## This function caches the inverse of a Matrix x. 

cacheSolve <- function(x, ...) {
        Sol <- x$getSol()
        if(!is.null(Sol)) {
                message("getting cached data")
                return(Sol)
        }
        data <- x$get()
        Sol <- solve(data, ...)
        x$setSol(Sol)
        Sol ## Return a matrix that is the inverse of 'x'
}