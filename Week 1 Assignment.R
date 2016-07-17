#Week 1 Assignment
#Christine Yuan, 7/17/16

#1. Calculate 12! 479001600

y <- 1
for (i in 1:12)
  y <- y*i
  
y

#http://stackoverflow.com/questions/15014719/factorial-for-loop

#2. Show how to create a numeric factor that contains the sequence from 20 to 50 by 5

numFac <- seq(20,50,5)
numFac

#http://www.astrostatistics.psu.edu/su07/R/html/base/html/seq.html

#3. Show how to take a trio of input numbers a, b, c and implement the quadratic equation

a <- 1
b <- -5
c <- 6

x1 <- -b + sqrt((b^2)-(4*a*c))/(2*a)
x2 <- -b - sqrt((b^2)-(4*a*c))/(2*a)

x1
x2

#http://rstudio-pubs-static.s3.amazonaws.com/275_8e3191f1f68f46229b30c361c6778dec.html