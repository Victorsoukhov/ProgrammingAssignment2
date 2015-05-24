## Matrix inversion is usually a costly computation and there may be 
## some benefit to caching the inverse of a matrix rather than compute it repeatedly

## Fill initial cache of matrix inversion. Activates get set functions for use.
# set the value of the matrix
# get the value of the matrix
# setinvert the value of the invertion
# getinvert the value of the invertion

makeCacheMatrix <- function(x = matrix()) {
    m <- NULL
    set <- function (y){
        x <<- y
        m <<- NULL
    }
    get <- function (){
        x
    }
    setinvert <- function(solve){
        m <<- solve
    }
    getinvert <- function (){
        m
    }
    list(set = set, get = get, 
         setinvert = setinvert, getinvert = getinvert)    
}


## Resolve cash for matrix inversion. If not in cash - invert

cacheSolve <- function(x, ...) {
    m <- x$getinvert()
    if (is.null (m)){     #matrix not in cach
        data <- x$get()   #get original matrix
        m <- solve(data)  #invert matrix
        x$setinvert(m)    #cache inverted matrix
    }else {
        message ("getting cached data")
    }
    ## Return a matrix that is the inverse of 'x'
    m    
}
