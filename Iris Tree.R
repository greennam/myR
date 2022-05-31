head(iris)
boxplot(iris[,1:4])
head(iris)
str(iris)
unique(iris)
seto <- subset(iris, iris$Species == "setosa");seto
virg <- subset(iris, iris$Species == "virginica");virg
summary(virg$Petal.Length)
is.vector(virg$Petal.Length)
sd(virg$Petal.Length)

par(mfrow = c(2,1))
hist(seto[,1], main = paste("Histogram of sepal.length of setosa"))
hist(iris[,1], main = paste("Histogram of sepal.length"))

install.packages("DescTools")
# 수와 관련된 기술통계량 및 간단한 그래프를 보기 위한 유용한 패키지
library(DescTools)

Desc(mtcars, plotit=T)

Desc(mpg ~ disp + hp, data=mtcars)
