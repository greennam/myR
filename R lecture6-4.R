# apply series function
apply(iris[,1:4], 1, mean) # row
apply(iris[,1:4], 2, mean) # column

# lapply : result will be "list format"
la <- lapply(iris[,1:4], mean) # column

# sapply : user can decide vector or list
sav <- sapply(iris[,1:4], mean)
sal <- sapply(iris[,1:4], mean, simplify = F)

# user function 
sapply(iris[,1:4], maxmin)

n <- readline(prompt = "숫자를 입력하세요: ")
cat("입력한 숫자는", n, "입니다. \n")
