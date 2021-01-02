head(mtcars)
carb <- mtcars[,"carb"]
table(carb)
barplot( table(carb), 
         xlab = " # of carburetors",
         ylab = " frequency",
         main = " Barplot of Carburetors",
         angle = "30", 
         col = "red")

# 한 화면에 여러 그래프 그리기
par(mfrow = c(1,3))

barplot( table(mtcars$carb), 
         xlab = " # of carburetors",
         ylab = " frequency",
         main = " Barplot of Carburetors",
         col = "lightblue")

barplot( table(mtcars$cyl), 
         xlab = " # of Cylender",
         ylab = " frequency",
         main = " Barplot of Cylenders",
         col = "mistyrose")

barplot( table(mtcars$gear), 
         xlab = " # of gear",
         ylab = " frequency",
         main = " Barplot of gear",
         angle = "30", 
         col = "violetred3")
