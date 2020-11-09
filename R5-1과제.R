# 5-1-1. speed & dist Scatter plot of cars dataset
speed = cars[, "speed"]
dist = cars[, "dist"]
plot(speed, dist)
# 결과 설명 : 속도와 제동거리는 양의 상관관계 있음

# 5-1-2 Temperature vs. Pressure scatter plot
temp = pressure[, "temperature"]
vap_pressure = pressure[, "pressure"]
plot(temp, vap_pressure)
# 결과설명: 온도증가에 따라 증기압이(vapor pressure) 
# 기하급수적으로 상승함

# 5-1-3 Population, Income, Illiteracy, Area 상관관계 

#head(state.x77)
vars <- c("Population", "Income", "Illiteracy", "Area")
target <- state.x77[, vars]
pairs(target, main = "5-1-3. 변수간 산점도, 상관관계 관찰")
# 관찰 
# 인구가 중위권은 수입도 중위권, 인구적은 주는 수입의 range가 넓음
# 인구가 중위권 이상이면서 면적이 적은 주가 9개주 있음.
# 수입이 낮은 주에서 문맹률이 높음
# 수입이 높고, 면적이 큰 주가 한곳 있음.

# 5-1-4 (iris dataset) Species 정보에 따른 Sepal Length, Width 분포 
# head(iris)
iris_sepal <- iris[,1:2]
point <- as.numeric(iris$Species)
color <- c('red', 'green', 'blue')
plot(iris_sepal, pch=c(point), col=color[point])
