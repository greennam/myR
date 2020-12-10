
# 1. 이상치가 존재하는지 boxplot 그려 확인하시오
st <- data.frame(state.x77)
head(st)

boxplot(st)
# 이상치 3개 변수에 있음

# 이상치 없는 변수들 박스플롯
boxplot(st$Illiteracy, st$Life.Exp, st$Murder, st$HS.Grad,
        xlab="Illiteracy, Life.Exp, Murder, HS.Grad",
        outline = T)

# 아래 3개 변수에 이상치 존재함
boxplot(st$Population, st$Income, xlab = "Population, Income", outline = T)
boxplot(st$Area, xlab = "Area", outline = T)

# 2. 이상치가 존재하는 경우 이상치를 NA 로 저장하시오.
income.out.val <- boxplot.stats(st$Income)$out # pick up outlier
st$Income[st$Income %in% income.out.val] <- NA

pop.out.val <- boxplot.stats(st$Population)$out
st$Population[st$Population %in% pop.out.val] <- NA

area.out.val <- boxplot.stats(st$Area)$out
st$Area[st$Area %in% area.out.val] <- NA

# 3. st 에서 NA 가 존재하는 행들을 제거하여 st2 에 저장하시오.
st2 <- st[complete.cases(st),]

dim(st)-dim(st2)
