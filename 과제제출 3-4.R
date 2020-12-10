# 1. state.x77 에서 Income > 5000 인 주 추출. CSV 로 저장
rich <- as.data.frame(state.x77)
#rich$Income

rich.income <- subset(state.x77, 
               subset = (rich$Income > 5000))
write.csv(rich.income, "rich_state.csv", row.names = T, quote = F)

# 2. rich_state.csv 파일을 읽어서 ds 변수에 저장후 ds 의 내용을 보이시오. 
ds <- read.csv("rich_state.csv", header = T, 
                   encoding = "utf-8")
ds
