# Quiz 11-1

library(mice)
ds <- ampute(iris[,1:4], 0.2)$amp

# 1. 각 컬럼별로 결측값이 몇개인지 보이시오

col_na <- function(y){
  return(sum(is.na(y)))
}

na_countds <- sapply(ds, FUN=col_na)
na_countds

# 2. 결측값이 포함된 행들의 데이터를 보이시오
