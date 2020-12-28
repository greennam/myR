
data <- read.csv("ucla_admit__13-3.csv")
head(data)
lg_model_1 <- glm(admit ~., data = data)
summary (lg_model_1)
# step <- stepAIC(lg_model_1, direction = "both")
