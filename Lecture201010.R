#5-4. State.x77 dataset analysis

st <- data.frame(state.x77, state.region)
head(st)

dim(st)
names(st)
str(st)
class(st)
table(st$state.region)

#6 week, User defined function
  
mymax <- function(x,y){
  num.max <- x
  if(y>x){
    num.max <- y
  }
  return(num.max)
}
mymax(30,15)

mydiv <- function(x, y=2){
  result<- x/y
  return(result)
}

mydiv(x=4)
mydiv(x=10, y=5)
mydiv(x=30,y=3)
mydiv(40)
mydiv(40, y=10)

myfunc<-function(x,y){
  val.sum <- x+y
  val.mul <- x*y
  return(list(sum=val.sum, mul=val.mul))
}

result <- myfunc(5,8)
result$mul

setwd("D:/myR/myR")
