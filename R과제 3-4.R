# 1. R 에서 제공하는 state.x77 데이터셋에서 
# 수입이 5000 이상인 주의 데이터만 추출하여 
# rich_state.csv 에 저장하시오.

st <- data.frame(state.x77)
head(st)
st1 <- subset(st, st$Income > 5000)
write.csv(st1, "rich_state.csv", row.names = F, quote = F)

# 2. read "rich_state.csv" & store into ds, show ds

ds <- read.csv("rich_state.csv", header = T)
head(ds)
