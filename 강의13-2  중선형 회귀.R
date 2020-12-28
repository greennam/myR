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

# install car library
library(car)
head(Prestige)
str(Prestige)
newdata1 <- Prestige[,c(1:4)]
plot(newdata2, pch=16, col="blue", 
     main="Matrix scatterplot")
# help("pairs")
# pairs(newdata2)
mod1 <- lm(income ~., data=newdata2)
summary(mod1)

# Select variable automatically
newdata2 <- Prestige[,c(1:5)]
# 초기 모델 만듬
mod2 <- lm(income ~., data=newdata2)
# 초기 모델 이용하여, step 으로 불필요한 요소 제거함
step <- stepAIC(mod2, direction = "both")
# 산출된 최적의 독립변수로 모델을 만듬
mod3 <- lm(income ~women+prestige, data=newdata2)
summary(mod3)
