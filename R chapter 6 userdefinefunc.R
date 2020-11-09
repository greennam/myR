num <- round(runif(1)*100, digits = 0)
guess <- -1
cat("0 과 100 사이 숫자를 입력하시요. \n")

while(guess != num){
  guess <- readline(prompt = "숫자를 입력하세요: ")
  guess <- as.integer(guess)
  
  if(guess == num){
    cat("축하 합니다.", num, "맞습니다 \n")
  } else if (guess < num) {
    cat("작습니다. \n")
  } else if (guess > num) {
    cat(" 큽니다. \n")
  }
}
