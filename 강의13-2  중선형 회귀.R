# select variable

# (exercise)
mean(iris$Sepal.Length)
mean(iris$Sepal.Width)
mean(iris$Petal.Length)
mean(iris$Petal.Width)

# 같은 반복 기능을 단순히 연산 가능. for 대체가능 
library(purrr)
map_dbl(iris[, 1:4], mean)


# for(n in c(2,5,10,20,50)) {
#   x <- stats::rnorm(n)
#   cat(n, ": ", sum(x^2), "\n", sep = "")
# }
library(dplyr)

library(MASS)
library(car)
newdata2 <- Prestige[,c(1:5)]
Pres

