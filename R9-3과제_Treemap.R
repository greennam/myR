# (1) treemap 패키지의 GNI2014 데이터셋을 이용하여 
# 유럽대륙의 각 나라의 위치에 그 나라의 인구수를
# 원의 크기로 표시하시오.
# (원의 색깔은 초록색, alpha=0.5)

library(ggmap)
library(ggplot2)
library(treemap)
data(GNI2014)
register_google(key = 'AIzaSyDhEDE1TNVNPWmRjgTClt9RM5tAjydGWtc')

gc <- geocode("Europe")
cen <- as.numeric(gc)
map <- get_googlemap(center = cen,
                     maptype ="roadmap",
                     zoom = 4,
                     marker = gc)

df <- data.frame(GNI2014$country, GNI2014$continent, GNI2014$population)


loc <- data.frame(df[df$GNI2014.continent == "Europe",])
gc_eu <- geocode(loc$GNI2014.country)
df_eu <- cbind(loc, gc_eu)

gmap <- ggmap(map)
gmap+geom_point(data = df_eu, # 원그리기
                aes(x=lon, y=lat, size=GNI2014.population), # size = population
                color = "green",
                alpha=0.5)+theme(axis.title.x = element_blank(),
                                 axis.text.x = element_blank(),
                                 axis.ticks.x = element_blank(),
                                 axis.title.y = element_blank(),
                                 axis.text.y = element_blank(),
                                 axis.ticks.y = element_blank())
