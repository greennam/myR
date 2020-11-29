is.data.frame(iris)
iris["Species"]
iris[,c(1:2)]
iris[,c(1,3,5)]
iris[,c("Sepal.Length", "Species")]
iris[1:5,]
iris[1:5, c(3,4,5)]
iris.info
c <- NULL
d <- c(1,4,3,7,8)
d[-2] # R 에서는 2번째 제외, Python에서는 끝에서 2번째 
d[-c(3:4)] # Except 3rd, 4th data, show all

month = 1:12
late = c(5,8,7,9,4,6,12,13,8,6,6,4)
plot(month,
     late,
     main = "Late Student",
     type = "b", # kind of graph (alphabet)
     col =  'red', # ('red','blue','green'),
     lty = 6, # line type 
     lwd = 1, # line width
     xlab = "month",
     ylab = 'Late count')

# Draw 2 layers
late1 = c(5,8,7,9,4,6,12,13,8,6,6,4)
late2 = c(4,6,5,8,7,6,10,11,6,5,7,3)
plot(month,
     late1,
     main = "Late Student",
     type = "b", # kind of graph (alphabet)
     #col =  'red', # ('red','blue','green'),
     lty = 6, # line type 
     lwd = 1, # line width
     xlab = "month",
     ylab = 'Late count')
lines(month,
      late2,
      type = 'b',
      col = 'blue'
      )

#5-4 lecture

# Data inform
str(iris)
class(iris)
dim(iris)
table(iris$Species)
summary(iris[,1])
summary(iris[,'Sepal.Length'])
sd(iris[,1])


# 여러 산점도 비교, 품종별 비교
point <- as.numeric(iris$Species)
color <- c("red", 'green', 'blue')
pairs(iris[,-5],
      pch=c(point),
      col=color[iris[,5]])
