
# 1
# kmeans(x, centers, iter.max = 10,
#        nstart = 1, algorithm = c("Hartigan-Wong",
#                                 "Lloyd", "Forgy", "MacQueen"))

require(graphics)

# create 2-dimensional example
x <- iris[,1:4]
cl <- kmeans(x, 3)
cl # show result

plot(x, col=cl$cluster)
points(cl$centers, col=1:2, pch=8, cex=2)
