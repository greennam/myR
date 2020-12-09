# 1. 데이터 프레임 생성

id <- c(10,20,30,40,50)
name <- c("John", "Tom", "Paul", "Jane", "Grace")
score <- c(95,46,98,74,85)

df <-data.frame(id, name, score) # data frame

# 2. df$score 와 df[,3], df[,’score’] 의 결과를 비교하시오.
df$score
df[,3]
df[,'score']
# 비교 결과 동일하다

# 3. id 와 score 컬럼의 값들만 보이시오.
df[,c("id", "score")]

# 4. 2행과 3행의 값들만 보이시오.
df[2:3,]

# 5. 2행 3열의 값을 보이시오.
df[2,3]
