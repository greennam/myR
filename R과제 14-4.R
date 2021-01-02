# mlbench 패키지에 포함된 유방암 데이터셋() 에 
# 대하여 KNN 으로 예측 정확도를 알아보되
# 10-fold cross validation 으로 하시오. 

library(class)
library(mlbench) # M.L bench marking data
data("BreastCancer")
head(BreastCancer)
str(BreastCancer)
bc <- BreastCancer

sum(is.na(bc)) # check whether missing data exits or not
colSums(is.na(bc)) # to show which col has NA
# 결측값 제외
bc2 <- bc
bc <- na.omit(bc) # Delete row which has NA

# k-fold cross validation
require("class")

# get fold no. for each rows
group.1 <- cut(seq(1,350), breaks = 10, labels = F)
group.2 <- cut(seq(351,683), breaks = 10, labels = F)
fold <- c(group.1, group.2)

acc <- c() # accuracy for each fold
for (i in 1:10){
  ds.tr <- bc[fold != i, 2:10]
  ds.ts <- bc[fold == i, 2:10]
  cl.tr <- factor(bc[fold != i, 11])
  cl.ts <- factor(bc[fold == i, 11])
  pred <- knn(ds.tr, ds.ts, cl.tr, k= 3)
  acc[i] <- mean(pred == cl.ts) # Accumulate from acc[1] ~ acc[10]
}
acc
mean(acc)
