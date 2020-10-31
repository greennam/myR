setwd("d:/myR")
hospital <- read.csv("Hospital.csv")
head(hospital)
table(hospital)
mosaicplot(~freq+stay, data = hospital, 
           color=c("green", "blue", "red"),
           main = "병원 내원 빈도 vs 치료기간간")

tbl <- table(hospital)
tbl
mosaicplot(tbl, color = TRUE, main ="병원 내원 빈도 vs 치료기간간" )

mosaicplot(Titanic,
           main="Survival in the Titanic",
           color=c("red", "green"),
           off = 1)
