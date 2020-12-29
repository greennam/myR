#1.mlbench 패키지의 BostonHousing 데이터셋은 보스턴 지역의 지역정보 및 평균주택 가격 (medv) 정보를 담고 있다.
# 다른 변수들을 이용하여 medv 를 예측하는 모델을 만드시오. (medv 를 예측하는데 도움이 되는 변수들만 사용할 것)

library(mlbench)
library(MASS)
data("BostonHousing")
str(BostonHousing)
head(BostonHousing)
plot(BostonHousing, pch=16, col='blue', main='Boston Housing')


# multivariate linear regression
# 처음에는 모든 변수 사용하여 선형회기 모델식의 parameter 구함
mod_1 <- lm(medv ~ ., data = BostonHousing)
# Akaike information criteria (AIC) 이용하여 최소값이 나오는 독립변수 조합을 구함
step <- stepAIC(mod_1, direction = "both")
# AIC로 구한 독립변수만 사용하여 선형회기 모델식 만들어 parameter 새로 구함
mod_2 <- lm(medv ~ crim + zn + chas + nox + rm + dis + rad + tax + ptratio + 
              b + lstat, data = BostonHousing )

# 위 식과 같은 내용(삭제할 독립변수 앞에 - 붙임): mod_2 <- lm(medv ~ . -indus -age, data = BostonHousing )

# summary(mod_1)
summary(mod_2)

# 2. 임의 데이터에 대한  medv 값 예측
# parameter ?
# coefficients(mod_2)
imsi <- c(1, 0.00632, 18,0, 0.538, 6.575, 4.0900, 1, 296, 15.3,396.90, 4.98); imsi
pred_medv <- sum(imsi * coefficients(mod_2));pred_medv
