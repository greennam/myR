head(infert)

#1. infert 데이터셋의 education 컬럼 값을 잘라내어 edu 에 저장
edu <- infert[,"education"]
edu

#2. 중복제거
unique(edu)

#3. edu 도수 분포표
table(edu)

#4. edu 막대그래프
barplot(table(edu), main="Barplot of Education")

a <- c(2,4,6,7)
m <- mean(a)
m
(2-m)^2
v <- (a-m)^2
v
sum(v)/3
var(a)
boxplot(iris[,4]~Species,data=iris)
hist(state.x77[,"Income"], breaks = 2)
