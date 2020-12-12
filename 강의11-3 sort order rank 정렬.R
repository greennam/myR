order(iris$Sepal.Length) # ordering
head(iris)
iris[order(iris$Sepal.Length),] # all ordering by Sepal length
iris[1:5,]
iris[order(iris$Sepal.Length),][1:5,]

# decresing
iris[order(iris$Sepal.Length, decreasing = T),][1:5,]

# more two criteria sorting
iris[order(iris$Sepal.Length, iris$Petal.Length),][1:10,]

# order is used to sort 2-dimension data

# rank function
v3 <- c(1, 7,2,5)
order(v3) # for ordering, pick number
rank(v3) # display current rank


