# 1. 1~100 사이의 정수 중 3의 배수들의 합과 개수
j=0
sum = 0
for (i in 1:100){
  if (i%%3 == 0) {
   sum <- sum + i
   j <- j+1
  }  
}
cat("배수들의 합 =" , sum, "\n")
cat(" 갯수 = " , j)

# 2. 101~200 사이 숫자 중 3과 4의 공배수 출력 
for (i in 101:200){
  if (i%%3 == 0){
    if (i%%4 == 0){
      print(i)
    }
  }
}

# 3. 24 의 약수 출력
for (i in 1:24){
  if (24%%i == 0){
    print(i)
  }
}

# 4. 10! 출력
fact <- 1
for (i in 1:10){
  fact <- fact * i
}
print(fact)

# 5. 0 ~ 40개의 피보나치 수열 출력

fibo <- c(0, 1)
while (length(fibo) < 40){
  i <- length(fibo)
  sum <- fibo[i] + fibo[i-1]
  fibo <- c(fibo, sum)
}
print(fibo)

