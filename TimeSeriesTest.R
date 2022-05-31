# Install TTR, forecast
#install.packages("TTR")
#install.packages("forecast")
library(TTR)
library(forecast)
# 영국 왕 사망시 나이 데이터
kings <- c(60,43,67,50,56,42,50,65,68,43,
           65,34,47,34,49,41,13,35,53,56,
           16,43,69,59,48,59,86,55,68,51,
           33,49,67,77,81,67,71,81,68,70,
           77,56)
kings
kingstimeseries <- ts(kings) 
# ts함수 활용, 데이터를 시계열데이터로 변환 
kingstimeseries

#plot.ts 함수 활용하여 시계열데이터를 도식화
plot.ts(kingstimeseries)

# 3년 주기로 이동평균 계산
kingsSMA3 <- SMA(kingstimeseries, n=3)
# plot
plot.ts(kingsSMA3)

# 8 year, 12 year average
kingsSMA8 <- SMA(kingstimeseries, n=8)
kingsSMA12 <- SMA(kingstimeseries, n=12)

#plot in one windows
par(mfrow=c(2,2))
plot.ts(kingstimeseries)
plot.ts(kingsSMA3)
plot.ts(kingsSMA8)
plot.ts(kingsSMA12)

# 차분하여 정상성 확인 하기 (difference)
# diff 함수를 활용하여 데이터 차분 하기

kingsdiff1 <- diff(kingstimeseries, differences = 1)
kingsdiff1

#2 번 차분하기
kingsdiff2 <- diff(kingstimeseries, differences = 2)
kingsdiff2

kingsdiff3 <- diff(kingstimeseries, differences = 3)

# kingsdiff2 가 정상성을 갖는가 ? 도표로 확인
par(mfrow=c(2,2))
plot.ts(kingstimeseries)
plot.ts(kingsdiff1)
plot.ts(kingsdiff2)
plot.ts(kingsdiff3)
# 결과 해석: 1번만 차분해도 정상성 같는다.

# 1 번 차분후 평균과 분산값은 ?
mean(kingsdiff1)
sd(kingsdiff1)

mean(kingsdiff2)
sd(kingsdiff2)

mean(kingsdiff3)
sd(kingsdiff3)

# ARIMA 모델 결정 하기 ARIMA (p, 1, q)
# ACF 함수와 PACF 함수를 사용하여 모형 결정하기
acf(kingsdiff1, lag.max = 20) #1차 차분한 데이터로 AFC 확인 
# ACF 결과 해석: 절단점은 2. 고로 MA(1) 모형 가질수 있다 

# 1 차 차분한 데이터로 PACF 확인
pacf(kingsdiff1, lag.max = 20)
# PACF 결과해석 : 절단점 cutpoint 는 4 (점선안에 들어옴), 
# 고로 AR(3) 모형을 가질수 있다

# ARIMA(3, 1, 1) 모형 가질수 있다

# 자동으로 모형 찾는 방법: auto.arima() 함수 사용한다
auto.arima(kings)
# result : ARIMA(0,1,1) 로 나옴. 가장 간단한 모형임

# 43대, 44대 왕의 수명 예측하면 ?
# 1) 예측한 모델 ARIMA(p,d,q)로 수명 예측하고
# 2) forecast() 함수 활용하여, 향후 5명 왕 수명 예측
kingsARIMA <- arima(kingstimeseries, order = c(0,1,1))
kingsARIMA
# 에측
kingsForecasts <- forecast(kingsARIMA, h=5)
kingsForecasts
# 시각화
plot(kingsForecasts)

# var2 = ts(var1) timeseries data로 변환
# plot.ts(var2)
# SMA(var2, n = x(원하는 단위숫자)) 이동 평균 확인
# var3 = 차분 diff(var2 , difference = x)
# acf( var3, lag.max = x) 
# pacf(var3, lag.max = x)
# 자동 선택 모델 계산auto.arima(var1)
# ARIMA 모형으로 데이터 보정하기(fitting), 
#   var4 = arima(var2, order=c(p,d,q)
# 에측 var5 = forecast(var4, h = x)
# 예측값 도식화 plot(var5)
