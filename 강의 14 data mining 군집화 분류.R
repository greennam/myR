# 군집화 clustering
# draw scatterplot
# k-means clustering
# specify number of group

# kmeans(x, centers, iter.max = 10,
#        nstart = 1, algorithm = c("Hartigan-Wong",
#                                 "Lloyd", "Forgy", "MacQueen"))

require(graphics)

# create 2-dimensional example
x <- rbind(matrix(rnorm(100, sd=0.3), ncol=2),
           matrix(rnorm(100, mean=1, sd=0.3), ncol=2))
colnames(x) <- c("x", 'y')
cl <- kmeans(x, 2)
cl # show result

plot(x, col=cl$cluster)
points(cl$centers, col=1:2, pch=8, cex=2)

cl2 <- kmeans(x, 5, nstart = 25)
plot(x, col=cl2$cluster)
points(cl2$centers, col=1:2, pch=8, cex=2)

# 분류 classification
# 정확도 높은 모델을 만드는것이 목표임
# 정확도 = 정확히 예측된수/테스트 전체수
# kind = binary classification + 
# multiple classification

# KNN - K Nearest Neighbor
# knn(train, test, cl, k=1, l=0,
#      prob=FALSE, use.all=TRUE)

require("class")
tr.idx <- sample(1:nrow(iris), 0.7*nrow(iris))
ds.tr <- iris[tr.idx, 1:4]
ds.test <- iris[-tr.idx, 1:4]
#cl.tr <- iris[tr.idx, 5]
cl.tr <- factor(iris[tr.idx, 5])
cl.test <- factor(iris[-tr.idx, 5])
pred <- knn(ds.tr, ds.test, cl.tr, k=3, prob = T)
accuracy <- mean(pred == cl.test);accuracy 

# how to predic, show prediction status
table(pred, cl.test) # 대각선외 나머지는 예측 오류임
#cl.test
#pred         setosa versicolor virginica
#setosa         14          0         0
#versicolor      0          9         1
#virginica       0          2        19

#-----------------------------
# k-fold cross validation
require("class")

# get fold no. for each rows
group.1 <- cut(seq(1,50), breaks = 5, labels = F)
group.2 <- cut(seq(51,100), breaks = 5, labels = F)
group.3 <- cut(seq(101,150), breaks = 5, labels = F)
fold <- c(group.1, group.2, group.3)

acc <- c() # accuracy for each fold
for (i in 1:5){
  ds.tr <- iris[fold != i, 1:4]
  ds.ts <- iris[fold == i, 1:4]
  cl.tr <- factor(iris[fold != i, 5])
  cl.ts <- factor(iris[fold == i, 5])
  pred <- knn(ds.tr, ds.ts, cl.tr, k= 3)
  acc[i] <- mean(pred == cl.ts)
}
acc
mean(acc)
#-------------------------------

iris[order(iris$Sepal.Length),]
sort(iris[,"Sepal.Length"])
summary(iris)
aggregate(iris)
