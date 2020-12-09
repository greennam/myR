# score matrix 
m <- c(10, 40, 60, 20)
f <- c(21, 60, 70, 30)
score <- cbind(m,f)
score

# Change column name
colnames(score) <- c("male", "female")
score

# 2행에 있는 모든 값을 보이시오.
score[2,]

# female 의 모든 값을 보이시오.
score[,"female"]

# 3행 2열의 값을 보이시오.
score[3,2]
