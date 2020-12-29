# 1.
head(state.x77)
dim(state.x77)
sx77 <- data.frame(state.x77)
x <- sx77[,"Illiteracy"]
y <- sx77[,"Murder"]

model <- lm(y~x, sx77)
model
model$coefficients[2]

# 2. 
pred_Illiteracy = c(0.5, 1.0, 1.5)
pred_murder = model$coefficients[2] * pred_Illiteracy + model$coefficients[1]
pred_murder
