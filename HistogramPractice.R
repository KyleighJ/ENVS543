
foo <- function( x, y ){
  z <- x * y
  
  return( z )
  
}


bar <- function () {
  
  return( rnorm( 100 ) )
}

myHist <- function( x ) {
  hist( x )
}

myHist( bar() )

