# score matrix 
m <- c(10, 40, 60, 20)
f <- c(21, 60, 70, 30)
score <- cbind(m,f)

# Change column name
colnames(score) <- c("male", "female")

# Show 2nd row
score[2,]

# Show female column
score[,"female"]

# show 3 row, 2 col
score[3,2]
