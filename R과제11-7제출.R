# 1. Merge
subway <- read.csv("subway.csv", header = T,
                   encoding = "UTF-8")
head(subway)
subway_latlong <- read.csv("subway_latlong.csv", 
                           header = T, encoding = "CP949")
head(subway_latlong)

subway.tot <- merge(subway, subway_latlong, by.x = c('X.U.FEFF.station'), 
      by.y = c('STATION_CD'), all.x = T) 

head(subway.tot)

# 2. Daily mean of on_tot, off_tot group by station name & date
# daily mean on = sum of on_tot[,4] / sum of station (24-5+1)
# daily mean off = sum of off_tot[,25] / sum of station (20)

attach(subway.tot)
daily.mean <- aggregate(subway.tot, 
                 by=list(stat_name), # d_mean_off = income_date),
                 FUN=mean)
head(daily.mean)
detach(subway.tot)


agg <- aggregate(iris[,-5], by=list(iris$Species),
                 FUN = mean);agg
