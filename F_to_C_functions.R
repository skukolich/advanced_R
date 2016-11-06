F_to_C <- function(temp) {
  C <- ((temp - 32) * (5/9))
  return(C)
}

K_to_C <- function(tempK) {
  celsius <- tempK - 273.15
  return(celsius)
}

F_to_K <- function(tempF) {
  kelvin <- ((tempF- 32) * (5/9)) + 273.15 #need parentheses because R can't do order of operations
  return(kelvin)
}