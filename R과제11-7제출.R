# 1. 
subway <- read.csv("subway.csv", header = T,
                   encoding = "UTF-8")
head(subway)
subway_latlong <- read.csv("subway_latlong.csv", 
                           header = T, encoding = "CP949")
head(subway_latlong)

subway.tot <- merge(subway, subway_latlong, by.x = c('X.U.FEFF.station'), 
      by.y = c('STATION_CD'), all.x = T) # left
