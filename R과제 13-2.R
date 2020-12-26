#1.mlbench 패키지의 BostonHousing 데이터셋은 보스턴 지역의 지역정보 및 평균주택 가격 (medv) 정보를 담고 있다.
# 다른 변수들을 이용하여 medv 를 예측하는 모델을 만드시오. (medv 를 예측하는데 도움이 되는 변수들만 사용할 것)

library(mlbench)
library(MASS)
data("BostonHousing")
str(BostonHousing)
plot(BostonHousing, pch=16, col='blue', main='Boston Housing')


# multivariate linear regression
mod1 <- lm(medv ~ ., data = BostonHousing)
step <- stepAIC(mod1, direction = "both")
