
# 1
# kmeans(x, centers, iter.max = 10,
#        nstart = 1, algorithm = c("Hartigan-Wong",
#                                 "Lloyd", "Forgy", "MacQueen"))

require(graphics)

# create 2-dimensional example
x1 <- iris[,1:4]
ccl <- kmeans(x1, 3);ccl # show result

plot(x, col=ccl$cluster)


points(cluster$centers, col=1:2, pch=8, cex=2)
