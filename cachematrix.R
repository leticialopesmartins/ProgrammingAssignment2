## Put comments here that give an overall description of what your
## functions do

## This function creates a special matrix object that can cache its inverse

makeCacheMatrix <- function(x = matrix()) {
        ## Initialize the inverse property
        inv <- NULL
         ## set the matrix
        set <- function (y){
                x <<- y
                inv <<- NULL
        }
         ## get the matrix
       get <- function () {
                ## Return the matrix
               x
       } 
         ## Method to set the inverse of the matrix
       setInverse <- function (inverse){
               inv <<- inverse
       }
         ## Method to get the inverse of the matrix
       getInverse <- function (){
                ## Return the inverse property
               inv
       }
        ## Return a list of the methods
       list(set=set, get=get,setInverse=setInverse, getInverse=getInverse )

}


## This function computes the inverse of the matrix returned by "makeCacheMatrix".

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
         inv<- x$getInverse()
        if (!is.null(inv)){
                message("getting cached data")
                return(inv)
        }
        mat<- x$get()
        inv<- solve (mat, ...)
        x$setInverse(inv)
        inv
}
