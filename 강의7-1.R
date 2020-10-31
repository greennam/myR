#install.packages("treemap")
library(treemap)
data(GNI2014)
str(GNI2014) # 데이터 내용보기 
head(GNI2014)
treemap(GNI2014,
        index=c("continent","iso3"), # 대륙구획 밑 국가
        vSize="population", # 타일의 크기 - 인구
        vColor="GNI", # 타일의 컬러 - 1인당 소득
        type="value", # 타일 컬러링 방법 - vColor로
        bg.labels="yellow") # 레이블의 배경색



GNI2014$GNI.total <- GNI2014$population*GNI2014$GNI
GNI2014.a <- aggregate(GNI2014[,4:6], by=list(GNI2014$continent),sum)
GNI2014.a$GNI.percap <- GNI2014.a$GNI.total / GNI2014.a$population

treemap(GNI2014.a,
        index=c("Group.1"), # 대륙별  
        vSize="population", # 타일의 크기 - 인구구
        vColor="GNI.percap", # 타일의 컬러 - 인구수
        type="value", # 타일 컬러링 방법 - vColor로
        bg.labels="yellow") # 레이블의 배경색

