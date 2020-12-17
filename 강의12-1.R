# 단국대 오세종 교수
# data source : http://kbig.kr

library(ggplot2)
library(ggmap)

# 전처리 작업
setwd("d:/myR/myR/myR")
subway <- read.csv("subway.csv", header = T,
                   stringsAsFactors = F, encoding = "UTF-8")
str(subway)
# incomedate 변수를 표준 날자 형식으로 전환
class(subway[, "income_date"]) <- "character"
subway[, "income_date"] <- as.Date(subway[,
      "income_date"], format = "%Y%m%d")
unique(format(subway[, "income_date"], "%Y"))

# 2014. data selection
idx <- format(subway[,"income_date"], "%Y") == "2014"

# show month of 2014
unique(format(subway[idx, "income_date"], "%m"))
# data has only upto July

# delete 2014 data if year is not 2014 & save to subway2
subway2 <- subset(subway, subset = format(subway[,"income_date"], "%Y") != "2014")
unique(format(subway2[, "income_date"], "%Y"))

# show name of subway in subway_latlong
subway[, "stat_name"] %>% unique %>% sort
#sort(unique(subway[, 'stat_name']))
