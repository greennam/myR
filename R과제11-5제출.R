# 1.
st.region <-split(state.x77, state.region)
st.region

# 2.
subset(state.x77, state.x77[,"Area"] > state.x77["Alabama","Area"] & 
         state.x77[,"Area"] < state.x77["California","Area"],
       select = c(Population, Income, Area))

# 3. 
idx <- sample(nrow(iris), size = 40, replace = F)
idx
iris.40 <- iris[idx,]

#iris.110 <- 
remain <- 1:150
idx110 <- (remain == idx)
