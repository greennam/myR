setwd("d://myR//myR//myR")

#install.packages("googleVis")
#install.packages("ggmap")
library(googleVis)
library(ggmap)
register_google(key = 'AIzaSyDhEDE1TNVNPWmRjgTClt9RM5tAjydGWtc')

# data 전처리용
library(readr)
library(dplyr)
library(tidyr)

place<-readLines("제주여행코스utf8.txt",encoding="UTF-8")
lonlat<- geocode(place) # 경도 위도 저장
place <- gsub("제주 ","",place)
df_lst <- cbind(place,lonlat) # 여행지이름 경도 위도의 데이터프레임

latlon <- paste(df_lst$lat,":",df_lst$lon) #위도 경도로 재배치
latlon <- gsub(" ","",latlon)

placelst <- cbind(df_lst, latlon)

placePath <- gvisMap(placelst, "latlon" ,"place",
                     options=list(showTip=TRUE, showLine=TRUE,
                                 enableScrollWheel=TRUE, 
                                  mapType='hybrid', 
                                  useMapTypeControl=TRUE, 
                                  width=800,height=1000))
plot(placePath)
