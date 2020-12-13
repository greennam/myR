# randomly sampling

x <- 1:100

y <- sample(x, size = 10, replace = F) # 비복원추출

idx <- sample(1:nrow(iris), size = 50, replace = F)
idx
iris.50 <- iris[idx,]
head(iris.50)

# 조합 combination
combn(5,3)

x = c('red', 'green', 'blue', 'black', 'white')
com <- combn(x, 2) # all cases to select two among x
com

for(i in 1:ncol(com)){
  cat(com[,i], "\n")
}
