# 6-5-2

sum_m <- function(){
  a <- -1
  b <- -1
  while(a != 0 & b != 0){
    a <- readline(prompt = "첫번째 숫자를 입력하세요: ")
    b <- readline(prompt = "두번째 숫자를 입력하세요: ")
    a <- as.integer(a)
    b <- as.integer(b)
    cat("두수의 합은", (a + b), "입니다. \n")
    cat("두수의 곱은", (a * b), "입니다. \n")
  }
}