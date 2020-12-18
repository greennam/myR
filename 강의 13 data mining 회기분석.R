# Linear Regression
# 독립변수 x, 종속변수 y 관계

head(cars)
plot(dist~speed, data=cars)

model <- lm(dist~speed, cars) # Linear regression model
model

# Compare predicted & actual value
speed <- cars[,1]
pred <- 3.932*speed - 17.579
pred
compare <- cbind(pred, cars[,2], abs(pred-cars[,2]))
compare

# show line
plot(dist~speed, data=cars)
abline(coef(model))

# multi linear regression
install.packages("car")
library(car)
head(Prestige)

newdata <- Prestige[, c(1:4)]
plot(newdata, pch=16, col="blue", main = "Matrix Scatterplot")

# model
# 독립변수 : education + prestige + women
# 종속변수 : income
mod1 <- lm(income~education + prestige + women, data=newdata)
mod1
summary(mod1)

# Auto select x variable
library(MASS)
newdata2 <- Prestige[, c(1:5)]
mod2 <- lm(income ~ education + prestige + women + census, data = newdata2)
step <- stepAIC(mod2, direction = "both")

mod3 <- lm(income ~ prestige + women, data=newdata2)
summary(mod3)

# Logistic regression
head(iris)
mod4 <- glm(as.integer(Species) ~., data = iris)
summary(mod4)

unique(iris$Species)
as.integer(unique(iris$Species))

pred <- 1.18650 + 5.1*(0.11191)+
  3.5 *(-0.04008) +
  1.4 *(0.22865) + 
  1.2 

unknown <- data.frame(rbind(c(5.1, 3.5, 1.4, 0.2)))
names(unknown) <- names(iris)[1:4]
unknown
mod4
pred <- predict(mod4, unknown)
pred
round(pred, 0)

# various data
test <- iris[,1:4]
pred <- predict(mod4, test)
pred
pred <-round(pred, 0)
pred
pred == as.integer(iris[,5])
acc <- mean(pred == as.integer(iris[,5]))
acc
