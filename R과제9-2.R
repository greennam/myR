library(ggmap)
library(ggplot2)
setwd("C:\\myR-main\\myR")
gc <- read.csv("서울시구청주소.csv", 
                     header = TRUE)
df <- data.frame(name = gc$구청명,
                 lon = gc$lon,
                 lat = gc$lat)
cen.lon <- as.numeric(mean(gc$LON))
cen.lat <- as.numeric(mean(gc$LAT))
cen <- c(cen.lon, cen.lat)
map <- get_googlemap("seoul",
                     maptype ="roadmap",
                     zoom = 11,
                     size = c(640,640))
#ggmap(map)
gmap <- ggmap(map)+geom_point(data = gc, 
                              aes(x=LON, y=LAT),
                              size=3,
                              alpha = 1)
gmap + geom_text(data=gc, aes(x=LON, y=LAT+0.01, label = 구청명, size =3))

# 과제 2 광역시 표기
lcity_names <- c("부산광역시", "대구광역시", 
                 "인천광역시", "광주광역시",
                 "대전광역시", "울산광역시")

lcity_gc <- geocode(enc2utf8(lcity_names))

lcity_df <- data.frame(name = lcity_names,
                       lon = lcity_gc$lon,
                       lat = lcity_gc$lat)

lcity_map <- get_googlemap("korea", maptype = "roadmap",
                           zoom = 7, size = c(640, 640), markers = lcity_gc)
#ggmap(lcity_map)
#lcity_map + geom_text(data = lcity_df, aes(x = lcity_gc$lon, y = lcity_gc$lat),label = lcity_names)

