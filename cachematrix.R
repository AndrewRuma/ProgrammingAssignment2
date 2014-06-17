## The function caches matrix and inverse matrix in its environment

makeCacheMatrix <- function(x = matrix()) {
        m <- NULL
        set <- function(y) {    ## creates a function for setting the value of the cached matrix and mean
                x <<- y
                m <<- NULL
        }
        get <- function() {     ## creates a function for returning the value of the cached matrix
                x  
        }
        setinv <- function(z){  ## creates a function for setting the value of the cached inverse matrix
                m <<- z
        }
        getinv <- function(){   ## creates a function for returning the value of the cached inverse matrix
                m
        }
        list(set = set, get = get, setinv = setinv, getinv = getinv)    ## output - list of the functions
}


## The function checks for cached inverse matrix and returns a matrix that is the inverse of 'x'

cacheSolve <- function(x, ...) {
        m <- x$getinv()         ## gets the cached inverse matrix
        if(!is.null(m)) {       ## checks for cached inverse matrix
                message("getting cached data")
                return(m)       ## output - inverse matrix
        }
        data <- x$get()         ## gets the cached value for matrix
        m <- solve(data)        ## calculates inverse matrix
        x$setinv(m)             ## sets cache inverse matrix
        m                       ## output - inverse matrix
}
