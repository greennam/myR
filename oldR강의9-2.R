 library(ggmap)
 
 register_google(key = 'AIzaSyDhEDE1TNVNPWmRjgTClt9RM5tAjydGWtc')
 names <- c("용인입니다")
 gc <- geocode(enc2utf8("용인"))
 df <- data.frame(name = names,
                  lon = gc$lon,
                  lat = gc$lat)
 cen <- as.numeric(gc)
 map <- get_googlemap(center = cen,
                      maptype ="roadmap",
                      zoom = 10,
                      size = c(640,480),
                      marker = gc)
 ggmap(map)
 gmap <- ggmap(map)
 gmap + geom_text(data = df,
                  aes(x = lon, y = lat),
                  size = 5,
                  label = names)
 