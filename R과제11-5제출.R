# 1. split
st.region <-split(state.x77, state.region)
st.region

# 2. Subset
subset(state.x77, state.x77[,"Area"] > state.x77["Alabama","Area"] & 
         state.x77[,"Area"] < state.x77["California","Area"],
       select = c(Population, Income, Area))

# 3. sample
idx <- sample(nrow(iris), size = 40, replace = F)
idx
iris.40 <- iris[idx,]

idx.110 <- setdiff((1:nrow(iris)), idx)
idx.110
iris.110 <- iris[idx.110,]

iris.40
iris.110

# 4. pair 2 Species
x = c('setosa', 'versicolor', 'virginica')
twopair <- combn(x, 2)
twopair
