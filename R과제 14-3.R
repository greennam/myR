# 다음의 데이터셋을 이용하여 KNN 알고리즘을 테스트하시오.
# Target dataset : Breast Cancer Wisconsin (Diagnostic) Data Set
# http://archive.ics.uci.edu/ml/machine-learning-databases/breast-cancer-wisconsin/wdbc.data 클릭하기!
#   
#   (1) wdbc.csv 파일에 저장후 프로그램에서 읽어들인다.
# 첫번째 컬럼 : instance ID (삭제한다)
# 두번째 컬럼 : class 정보  (M,B)

library(class)

wdbc <- read.csv("wdbc.data.csv",stringsAsFactors = F, header=F, encoding = "utf-8" )
head(wdbc)
str(wdbc)
wdbc2 <- wdbc[,-1];head(wdbc2) # del instance ID
str(wdbc2)

cl <- as.factor(wdbc2$V2)

ds.scale <- scale(wdbc2[,-1]) # del V2


#unique(wdbc2[,1]) # M: 악성, B: 양성

# (2) 홀수번째 instance는 training data 로, 짝수번째 instance는 test data 로 이용한다.
# K = 3,5,7 로 하여 accuracy 를 비교한다.
# 
# idx.training <- (1:nrow(wdbc2) %% 2 == 1) # 285 obs.
# idx.test <- (1:nrow(wdbc2) %% 2 == 0)

idx.training <- as.integer(rownames(wdbc2[1:nrow(wdbc2) %% 2 == 1,])) # 285 obs.
idx.test <- as.integer(rownames(wdbc2[1:nrow(wdbc2) %% 2 == 0,]))

ds.training <- ds.scale[idx.training,]; head(ds.training)
ds.test <- ds.scale[idx.test,]; head(ds.test)

cl.training <- cl[idx.training]

# idx <- as.integer(rownames(ds[1:nrow(ds) %% 2 != 0,] ))
# trn_x <- ds.sclae[idx, ]
# trn_cl <- cl[idx]
# tst_x <- ds.sclae[-idx, ]
# tst_cl <- cl[-idx]
#  
# md.knn <- knn(train = trn_x, test = tst_x, cl = trn_cl, k = 3)

K = c(3, 5, 7)

for (i in 1:length(K)){
  pred <- knn(ds.training, ds.test, cl.training, K[i])
  acc <- mean(pred == cl.training)
  cat("Accuracy of ", K[i], " = " , acc, "\n")
}
