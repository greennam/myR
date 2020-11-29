library("ggmap")
register_google(key =" ")
names <- c("서울특별시청")
addr <- c("서울 중구 세종대로 110")
gc <- geocode(enc2utf8(addr))
df <- data.frame(name = names,
                 lon = gc$lon,
                 lat = gc$lat)
cen <- c(mean(df$lon), mean(df$lat))
map <- get_googlemap(center = cen, 
                     maptype = "roadmap",
                     zoom = 10, 
                     size = c(800, 800), 
                     markers = gc)
ggmap(map)

#2 금강산, "hybrid" type map
names <- c("금강산")
gc <- geocode(enc2utf8(names))
df <- data.frame(name = names,
                 lon = gc$lon,
                 lat = gc$lat)
cen <- c(mean(df$lon), mean(df$lat))
map <- get_googlemap(center = cen, 
                     maptype = "hybrid",
                     zoom = 8, 
                     size = c(640, 640), 
                     markers = gc)
ggmap(map)

#3 경도 103.867881, 위도 1.331017 지역의 지도
gc$lon = 103.867881
gc$lat = 1.331017
# name = as.character(revgeocode(gc))
df <- data.frame(lon = gc$lon,
                 lat = gc$lat)
cen <- c(mean(df$lon), mean(df$lat))
map <- get_googlemap(center = cen, 
                     maptype = "roadmap",
                     zoom = 9, 
                     size = c(640, 640), 
                     markers = gc)
ggmap(map)

