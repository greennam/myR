# 1.
head(state.x77)
head(state.region)

st.region <- split(state.x77, state.region)
summary(st.region)
class(st.region)

# 2.
subset(state.x77, state.x77[,"Area"] > state.x77["Alabama","Area"] & state.x77[,"Area"] < state.x77["California","Area"])
