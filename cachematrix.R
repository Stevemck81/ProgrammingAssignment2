## A pair of functions that calculate and cache the inverse of a matrix

## Creates a vector that is a list containing the four functions: 
## set, get, setinverse and getinverse.

makeCacheMatrix <- function(x = matrix()) {
        m <- NULL
        set <- function (y) {
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setinverse <- function (solve) m <<- solve
        getinverse <- function() m
        list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)
        
}


## A function to calculate the inverse of the matrix 'x' or retrieve it 
## from the cached vector if it has already been calculated

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        m <- x$getinverse()
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        m <- solve(data, ...)
        x$setinverse(m)
        m
        
}
