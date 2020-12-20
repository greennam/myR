sp <- split(iris, iris$Species)
sp

summary(sp)
class(sp)

# Select row when condition is 
subset(iris, Species == "setosa")
subset(iris, Sepal.Length > 5.1)
subset(iris, Sepal.Length > 5.1 &
         Sepal.Width > 3.9)
subset(iris, Sepal.Length > 5.1,
       select = c(Petal.Length, Petal.Width))

# select row number under condition
x <- c(3,1,7,8,5,9,4)
# select row when x > 5
which(x>5)
#
which(iris$Species=="setosa")
# select row number when Sepal.Length is max
which.max(iris$Sepal.Length)
which.min(iris$Sepal.Width)
