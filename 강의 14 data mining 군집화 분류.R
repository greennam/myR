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

# k-fold cross validation
require("class")

iris[order(iris$Sepal.Length),]
sort(iris[,"Sepal.Length"])
summary(iris)
aggregate(iris)
