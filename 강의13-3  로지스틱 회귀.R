# Logistic regression

# 로지스틱 회귀모델은 glm 함수 사용함
mod3 <- glm(as.integer(Species) ~., data=iris)

# coefficients(mod3)
# class(iris[1,1:4])

# iris 1st 행 사용하여 계산
pred <- sum(data.frame(1,iris[1,1:4])*coefficients(mod3))

# pred 값을 반올림한 것이 예측한 품종임
#
str(iris)

# iris 품종 예측 계산
unknown <- data.frame(rbind(c(5.1, 3.5, 1.4, 0.2)))
names(unknown) <- names(iris)[1:4]
unknown
mod3
# 예측 함, predict() 사용
pred <- predict(mod3, unknown)
pred

# 여러개 데이터 이용하여 예측

test <- iris[,1:4]
pred <- predict(mod3, test);pred
pred <- round(pred,0) # 반올림

# 예측값과 정답 비교. 맞으면 True, 틀리면 False
pred == as.integer(iris[,5])

# 정확도 계산
# Factor type 인 범주형 데이터를 as.integer로 변환
accuracy <- mean(pred == as.integer(iris[,5]))
accuracy
