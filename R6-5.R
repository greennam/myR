# 6-5-1 세개 매개변수 입력 받아 가장 큰 수 추출

input3 <- function(a, b, c){
  a <- as.integer(a)
  b <- as.integer(b)
  c <- as.integer(c)
  temp <- c(a, b, c)
  return (max(temp))
}

input3(3, 16, 9)
input3(13, 10, 6)
input3(5, 14, 3)

# 6-5-2 화면에서 2개 입력받아 합과 곱 출력

input1 = -1
input2 = -1
while(input1 != 0 & input2 != 0){
  input1 <- readline(prompt = "1번째 숫자를 입력하시오: ")
  input2 <- readline(prompt = "2번째 숫자를 입력하시오: ")
  input1 <- as.integer(input1)
  input2 <- as.integer(input2)
  cat("두수의 합은: ", (input1 + input2), "입니다.\n")
  cat("두수의 곱은: ", (input1 * input2), "입니다.\n")
}

