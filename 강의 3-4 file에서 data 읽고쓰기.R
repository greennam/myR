# read
setwd("D:/myR")
mydata <- read.csv("3-4차시_파일.csv", header = T, 
                   encoding = "utf-8")
# mydata <- read.csv("D:/myR/3-4차시_파일.csv", header = T)
# mydata <- read.csv(file.choose(), header = T)

# 읽을때 한글 깨짐 해결
# Encoding method : UTF-8, euc-kr

head(mydata)

tail(mydata)
nrow(mydata)
ncol(mydata)
dim(mydata)

# write
mynew <- mydata[, c(2,3)]
write.csv(mynew, "kid_new.csv", row.names = F, quote = F)
