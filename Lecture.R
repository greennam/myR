#5-4. State.x77 dataset analysis

st <- data.frame(state.x77, state.region)
head(st)

dim(st)
names(st)
str(st)
class(st)
table(st$state.region)

