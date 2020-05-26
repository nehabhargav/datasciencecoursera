#Everything that we manipulate are objects in R
#Objects classes 
x <-1
class(x)

x <-1L
class(x)

x <- 1/0
x #inf means infinity

x <- 0/0
x #NaN means not a number / missing value 
#attribute of an object can be accessed using attribute() func.