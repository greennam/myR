 library(ggmap)
 
 register_google(key = 'AIzaSyDhEDE1TNVNPWmRjgTClt9RM5tAjydGWtc')
 gc <- geocode(enc2utf8("용인"))
 cen <- as.numeric(gc)
 map <- get_googlemap(center = cen,
                      maptype ="roadmap",
                      marker = gc)
 ggmap(map)
 