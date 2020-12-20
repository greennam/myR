# 단국대 오세종 교수
# data source : http://kbig.kr

library(ggplot2)
library(ggmap)

# 전처리 작업
setwd("d:/myR/myR/myR")
subway <- read.csv("subway.csv", header = T,
                   stringsAsFactors = F, encoding = "UTF-8")
# stringsAsFactors : 문자열 있으면 그대로 문자열 (해당명령 없으면 factor로 됨 )

str(subway)

# income_date data type을 날자 형식으로 전환
# int 형 날짜를 문자형으로 바꾼후 as.Date로 바꿈
class(subway[, "income_date"]) <- "character"

# chr => to as.Date
subway[, "income_date"] <- as.Date(subway[,
      "income_date"], format = "%Y%m%d")

# Display all years
unique(format(subway[, "income_date"], "%Y"))

# True or false if data is 2014
# data selection to delete
idx <- format(subway[,"income_date"], "%Y") == "2014"
# idx2 <- subway[,"income_date"] %>% format("%Y") == "2014"


# show month of 2014
unique(format(subway[idx, "income_date"], "%m"))
# data has only upto July

# delete 2014 data if year is not 2014 & save to subway2
# income_date가 2014년이 아닌 것만 선택 subset해서 subway2에 저장 
subway2 <- subset(subway, subset = format(subway[,"income_date"], 
                                          "%Y") != "2014")

# 확인
unique(format(subway2[, "income_date"], "%Y"))

# 역명에서 () 있는 행 검색
help("grep")
idx <- grep("\\(", subway2$stat_name)

# 괄호있는 역 이름 도출
unique(subway2$stat_name[idx]) %>% sort

# help("nchar") : count the number of characters
# delete () by replacing substrings "substr(x, start, stop)
# 괄호있는 역이름을 역이름 글자 1부터 뒤에서 3뺀 글자로 대체 
subway2$stat_name[idx] = substr(subway2$stat_name[idx], 1, 
                                nchar(subway2$stat_name[idx])-3)

# data pretreatment
# add column of year, month
tail(subway2)
year <- format(subway2[,"income_date"], "%Y")
# same:year<- format(subway2$income_date, "%Y)
month <- format(subway2[,"income_date"], "%m")
# help("cbind")
subway2 <- cbind(subway2, year, month)

# read data > delete 2014 month data, > del () > add col of yr, month

subname <- read.csv("subway_latlong.csv", header = T,
                    stringsAsFactors = F)
head(subname)

# show name of subway in subway_latlong
subname[, "STATION_NM"] %>% unique %>% sort
#sort(unique(subway[, 'stat_name']))

# "역이름당" 탑승객 합계 계산
tot <- aggregate(subway2[,"on_tot"], 
                 by=list(stat_name = subway2$stat_name),
                 FUN=sum); tot

# tot & subname 자료 합병 to get subway line number
cc = merge(tot, subname, by.x = "stat_name", by.y = "STATION_NM", all.x = T)
#help("merge")
#help("names")
# names(cc$x) <- "tot_on"

# dataframe 만듬. (역명, 라인번호, 탑승객합계)
df2 <- data.frame(cc, stat_name=cc$stat_name, 
                  line_num=cc$LINE_NUM, 
                  on_tot=cc$x)
#help("data.frame"): creates data frames

# 노선별로 정리 order by line_num
df2 <- df2[with(df2, order(line_num)),]
df2 <- df2[order(df2$line_num),]

df2$stat_name <- factor(df2$stat_name, levels = df2$stat_name)
#help("factor")
# The function factor is used to encode a vector as a factor 
# (the terms ‘category’ and ‘enumerated type’ are also used for factors). 
# If argument ordered is TRUE, the factor levels are assumed to be ordered. 
# For compatibility with S there is also a function ordered.

plt<-ggplot(df2, aes(x=stat_name, y=on_tot,
                     fill=line_num, order=line_num))
plt+theme_bw() + 
  geom_bar(stat="identity", colours="white") +
  scale_x_discrete("지하철역", labels=NULL) +
  ylab("탑승객 수") +
  scale_fill_discrete(name=c("노선선"))

# 역순
df3 <- df2[order(-df2$on_tot),]
df3 <- df3[1:10,]

# top 10 station
ten.station <- df3#stat_name

# 2013 year data
tmp <- subset(subway2.subset = stat_name %in%
                ten.station & year == "2013",
              )