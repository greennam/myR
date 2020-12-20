# sampling

x <- 1:100
# among 1 to 100, randomly select 10 numbers 
y <- sample(x, size=10, replace = FALSE) # false : 비복원추출
y

idx <- sample(nrow(iris), size=50, replace = FALSE)
iris.50 <- iris[idx, ]
head(iris.50)
class(iris.50)

# combination (조합)
combn(5,3) # among 5, cases of select 3

x=c("red", "green", "blue", "black", "white")
com <- combn(x, 2)
com
# print all
for (i in 1:ncol(com)){
  cat(com[,i], "\n")
}
