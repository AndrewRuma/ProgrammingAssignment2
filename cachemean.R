
## The function caches matrix and mean values in its environment

makeCacheMatrix <- function(x = matrix()) {
        m <- NULL
        set <- function(y) { ## creates a function for setting the value of the cached matrix and mean
                x <<- y
                m <<- NULL
        }
        get <- function() { ## creates a function for returning the value of the cached matrix
                x  
        }
        setmean <- function(mean){ ## creates a function for setting the value of the cached mean
                m <<- mean
        }
        getmean <- function(){ ## creates a function for returning the value of the cached mean
                m
        }
        list(set = set, get = get, setmean = setmean, getmean = getmean) ## output - list of the functions
}


## The function checks for cached mean value and returns a matrix that is the inverse of 'x'

cacheSolve <- function(x, ...) {
        m <- x$getmean() ## gets the cached mean value
        if(!is.null(m)) { ## checks for cached mean value
                message("getting cached data")
                return(m)
        }
        data <- x$get() ## gets the cached value for matrix
        m <- mean(data, ...) ## calculates mean value
        x$setmean(m) ## sets new cache mean value
        m
}
