#1. Logistic regression modeling
data <- read.csv("ucla_admit__13-3.csv")
head(data)

# Select 70% as training using sample()
idx <- sample(1:nrow(data), 0.7*(nrow(data)));idx
training <- data[idx, ]
test <- data[-idx,]

lg_model_1 <- glm(admit ~., data = training)
summary (lg_model_1)

# 독립변수 최소화 시도
library(MASS)
step <- stepAIC(lg_model_1, direction = "both")
lg_model_2 <- glm(admit ~ gre + rank, data = training )
summary(lg_model_2)

#2. Using csv, predict admit

pred <- predict(lg_model_1, test)
pred <- round(pred,0) # 반올림

pred2 <- predict(lg_model_2, test)
pred2 <- round(pred2,0) # 반올림


#3. Accuracy
accuracy <- mean(pred == test[,1]); accuracy

accuracy2 <- mean(pred2 == test[,1]); accuracy

ac <- mean(pred == pred2);ac
