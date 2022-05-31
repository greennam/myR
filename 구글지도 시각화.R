# use ggmap, ggplot2 package
# get_map() : create info about specific area
# ggmap(): prepare google map
# geom_point() : print on map

library(ggmap)

register_google(key = "  ")

addr = geocode("창현초등학교")
addr
addr <- addr[1:2];addr

# lon lat
# 127.3019 37.64574
# 37.645775774907705, 127.30218365439903 : data from google map

addr <- cbind(addr, tt = 5)

map1 <- get_googlemap("CH Elem Sch", zoom=10, maptype = "roadmap")
map1 <- ggmap(map1)
map1 + geom_point(aes(x=127.3019, y=37.6457, size=tt), data=addr)

cen <- as.numeric(addr)
map2 <- get_googlemap(center = cen, zoom = 8, size = c(640,480), 
                      maptype = "roadmap")
gmap <- ggmap(map2)
gmap + geom_text(data=addr,
                 aes(x=lon, y=lat),
                 size=5,
                 label="CH Scl")
