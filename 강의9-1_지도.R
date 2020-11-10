# 지진 진앙 크기 지도에 표기

library(ggmap)
library(ggplot2)

register_google(key = "AIzaSyDhEDE1TNVNPWmRjgTClt9RM5tAjydGWtc")

df <- head(quakes, 100)
cent <- c(mean(df$long), mean(df$lat))
gc <- data.frame(lon=df$long, lat=df$lat)
gc$lon <- ifelse(gc$lon>180, -(360-gc$lon), gc$lon)
map <- get_googlemap(center = cent,
                     maptype = "roadmap", zoom = 4, markers = gc)

ggmap(map)+theme(axis.title.x = element_blank(),
                 axis.text.x = element_blank(),
                 axis.ticks.x = element_blank(),
                 axis.title.y = element_blank(),
                 axis.text.y = element_blank(),
                 axis.ticks.y = element_blank())

map <- get_googlemap(center = cent,
                     maptype = "roadmap", zoom = 5)
gmap <- ggmap(map)
gmap+geom_point(data = df, # 원그리기
                aes(x=long, y=lat, size=mag),
                alpha=0.5)+theme(axis.title.x = element_blank(),
                 axis.text.x = element_blank(),
                 axis.ticks.x = element_blank(),
                 axis.title.y = element_blank(),
                 axis.text.y = element_blank(),
                 axis.ticks.y = element_blank())
