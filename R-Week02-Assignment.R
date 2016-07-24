#Week 2 Assignment
#Your task is to write your own variation of the choose()
#n! / (( n - r)! * r!).

n
r

recur_factorial <- function(n) {
  
  if(n == 1) {
    return(n)
  } else { 
    return(n*recur_factorial(n-1))
  }
}

x<-recur_factorial(n)
y<-recur_factorial(n-r)
z<-recur_factorial(r)

n=10
r=2
x/(y*z)