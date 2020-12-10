# 입력 오류 or 실제 data 일수도 있음
# 논리적으로 이상치 탐색한다
# 상식에서 벗어난 값을 찾아 본다
# Boxplot 을 그려 알아본다

st <- data.frame(state.x77)
boxplot(st$Income)
boxplot.stats(st$Income)$out #show value of outlier

# Put NA on outlier and treat

out.val <- boxplot.stats(st$Income)$out # pick up outlier
st$Income[st$Income %in% out.val] <- NA
st$Income # Outlier value is replaced with NA

new.data <- st[complete.cases(st),] # NA 제외하고 자료수집 함 
