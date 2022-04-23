
# Ex. 1 -------------------------------------------------------------------

# For numbres between 1 and 100, checks if it is multiple of 3, 5 or both (15),
# print the appropriate word or number by a new line 

for(i in 1:100){
  if(i %% 15 == 0) cat("FizzBuzz \n")      
  else if(i %% 3 == 0) cat("Fizz \n")      
  else if(i %% 5 == 0) cat("Buzz \n")      
  else cat(i, "\n")                        
  
}


# Ex. 2.1 -----------------------------------------------------------------

library(types)

# a function for computing Fibonachi numbers
fibo <- function(n = ? integer){
  if(n < 2){
    return(n)
  }else return(fibo(n-1)+fibo(n-2))
}

# a function for computing the largest Fibonacci number smaller than input 
largest_fibo <- function(b = ? integer ? float){
  i = 1 #start from 1
  while (fibo(i) < b) {i = i+1} #check if fibo(i) is smaller than input
  return(fibo(i-1)) # return the largest Fibonacci number smaller than input
}

# Ex. 2.2 -----------------------------------------------------------------


inv <- function(n = ? integer){
  n <- as.character(n)  # transform the input integer to a character 
  b <- nchar(n)         # count the number of letters (digits) in a string
  a <- substr(n, b, b)  # extract the last (b'th) character in the string n
  
  # Concatenate the characters from the last one to the first one
  for (i in (b-1):1) {
    a <- paste0(a, substr(n, i, i))
  }
  return(a) #transform the inversed character to number and return it
}

inv(12345)







