## Put comments here that give an overall description of what your
## functions do

## Function to get, set a matrix and to get, set the inverse of that matrix

makeCacheMatrix <- function(x) { 
  ## x is a matrix
  m <- NULL
  ## To set the matrix to x
  set <- function(y)
  {
    
    x <<- y    
    
      
    m <<- NULL    
  }
  ## To get the matrix x
  get <- function()x
  
  ## To find and set the inverse of a given matrix
  setsolve <- function(solve) m <<-solve(x)
  
  ## To get the inverse of a matrix
  getsolve <- function()m
  list(set = set, get = get,
       setsolve = setsolve, getsolve = getsolve)
}


## This function checks the cache for the inverse matrix and returns from the cache 
## If it is not available in the cache then it caculates with the function.

cacheSolve <- function(ob, ...) {
        ## ob is an object of the function MakeCacheMatrix
  
  m <- ob$getsolve() ## gets the inverse from the function
  
  ## checks if the inverse is present in the cache and returns if it is present
  if(!is.null(m)) then 
  {  
    message("getting cached data")
    return(m)
  }
  
  ## if not in the cache, it calculates with the function and returns
  else
  {
  data <- ob$get()
  m <- solve(data,...)
  ob$setsolve(m)
  return(m)
  }
  
}

