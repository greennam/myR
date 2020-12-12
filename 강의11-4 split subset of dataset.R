sp <- split(iris, iris$Species) # split data by s-t
sp

summary(sp) # display qty
class(sp) # type is list
sp$setosa

# ----------- subset
subset(iris, Species == "setosa")

subset(iris, Sepal.Length > 5.1)

subset(iris, Sepal.Length > 5.1 & 
         Sepal.Width > 3.9)

subset(iris, Sepal.Length > 7.1,
       select = c(Petal.Length, Petal.Width))

# --- disp low number under condition : which row ?
x <- c(3,1,7,8,5,9,4)
which (x > 5)

which(iris$Species == "setosa")

which.max(iris$Sepal.Length)
