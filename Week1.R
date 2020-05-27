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

#Vectors $ Objects

x <- c(0.5,0.6)
x
class(x)
x <- c(TRUE,FALSE)
x
class(x)
x <- c(T,F)
x
x <- c("a","b","c")
x
class(x)
x <- c(9:29)
x
x <- c(1+0i , 2+4i)
x
class(x)
x <- vector("numeric", length=10) # vector(class,length)
x
class(x)

y <- c(1.7,"a")
y
class(y)
y <- c(T,2)
y
class(y) # coercion occurs so that every element of a vector in in the same class.
y <- c("a",TRUE)
y


#explicitly coerced as.*function
x <- 0:6
class(x)

as.integer(x)
as.character(x)
as.logical(x) #0 is false and any number greater than zero is true
as.numeric(x)
as.complex(x)

#List
x <- list(1 ,"a" ,T , 1+4i)
x[[1]] #first element of list
x[1:3]#getting  first 3 elements of list

#Matrices are special types of vectors 
#it has an attributes called dimensions
 m  <- matrix(nrow=2,ncol=3)

dim(m) #first value=row, 2= col
attributes(m)
m <- 1:10
m
dim(m) <- c(2,5)
m
m[1,] #Prints the first row
m[2,4]
m[,5]# prints the whole 5th column


#cbind and rbind
 x <- 1:3
 y <- 10:12 

 cbind(x , y)
 rbind(x, y)
 
 
 
 #Factors = type of vector that represents categorical data
 # 2 types ordered, unoedered....takes input as a character
  x <- factor(c("yes","yes","no","yes"))
 table(x) # this gives me the count of the frequency of yes and no
unclass(x)# brings it down to integer

#Missing Values
#is.na() used for null objects
#is.nan() used for undefined mathematical operations

#data frames --- used to store tabular data 
#they are special types of list where every element of the list has the same length

#attributes of data types like ----- read.csv, read.table(), rows.names()

x <- data.frame( foo = 1:4, bar = c(T,T,F,F) )
x

 nrow(x) #uses two rows
 ncol(x)

 #Names
 
 x<- 1:3
 names(x)
 names(x) <- c("foo","bar","nox")
 x
 names(x)
 
 x <- list( a= 1, b=2, c=3 )
x

m <- matrix(1:4 , nrow = 2, ncol = 2)
dimnames(m) <- list(c("a","b"), c("neha ", "priyanka"))
m

#sunsetting a vector 
 x <- c("a","b","s","s","a")
x
x[2]
x[1:4]
x[ x > "b"]
y <- x > "a"
y


#subsetting a list


x <- list( foo =1:4 , bar = 0.6)
x[1] # list od sequence

x[[1]] #only sequence

x$bar
x["bar"]
x[["bar"]]

x <- list(foo=1:4, bar= 0.6, baz="hello") #to extract multiple elements of the list
x[c(1,3)]
 name <- "foo"
x[[name]] 
x$foo


# removing na values
x <- c(1,2,NA,4,5)
bad <- is.na(x)
x[ !bad ]

x <- c(1,2,NA,4,5,NA)
y <- c("1","2","3","4","5",NA)
good <- complete.cases(x,y)
good
x[good]
y[good]


