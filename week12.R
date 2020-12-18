

##########################################################################################################
# 본 과제 코든는 11주차와 이어지기 때문에 위에서 부터 차례로 실행 후, 과제문제 코드를 확인하셔야 합니다. #
##########################################################################################################

rm(list = ls())


# package 설치 및 불러오기
libs <- c("ggplot2", "ggmap", "tidyverse", 'reshape')
unlist(lapply(libs, require, character.only=TRUE))


# CSV 포맷의 파일을 다음과 같이 읽어 들인다.  
subway <- read.csv("subway.csv", stringsAsFactors = F, encoding = 'UTF-8', header = T)
head(subway)
str(subway)

# 정수형으로 저장된 `income_date` 변수를 시간을 나타내는 표준서식으로 변환하여 분석에 활용 가능토록 한다.  
subway[,3] <- as.character(subway[,3])
subway[,3] <- as.Date(subway[,3], format = "%Y%m%d")
head(subway,2)

# 2014년 자료는 7월까지의 정보만 포함하고 있으므로 2014년 자료를 분석에서 제외하고, 
# 나머지 연도의 자료를 `subway2` 이름의 데이터프레임으로 저장한다. 
subway2 <- separate(subway, income_date, into = c("year", "month", "day"), sep = "-")

subway2 <- cbind(subway2, subway[,3])

colnames(subway2)[which(names(subway2) == "subway[, 3]")] <- "income_date"
str(subway2)
subway2 <- subway2 %>%
  filter( year != "2014")

head(subway2)


# 자료에 포함된 역명이 실제 사용되는 역이름과 동일한지 확인한다.  
# 본 데이터에 사용되는 역명은 `역명(노선)` 형식의 값을 취하고 있으므로 이를 `역명`으로 변환하여 분석시 활용하도록 한다.  
sort(unique(subway[ , 'stat_name']))


# 역명에 노선번호가 붙은 행을 `grep()`을 이용하여 찾고, 이를 `strsplit()`을 이용하여 역명과 노선번호를 분리하여 
# 변수 `stat_name`에 노선번호가 붙지 않는 역명으로 대체하는 코드는 아래와 같다.  

idx <- grep( "\\(" , subway2[ , "stat_name"] )
unique(subway2[idx, "stat_name"])
stat_name <- subway2[ , "stat_name"]
tmp <- sapply(subway2[idx, "stat_name"], strsplit, "\\(", USE.NAMES=FALSE)
stat_renamed <- sapply(tmp, function(x) x[1])
subway2[idx, "stat_name"] <- stat_renamed


# `subway_latlong.csv` 파일을 읽는다.
subname <- read.csv("subway_latlong.csv", stringsAsFactors = F)
head(subname)

# `subway.csv` 파일로부터의 역명과 동일한 형식으로 주어지는지 확인을 위해 아래와 같이 역명을 출력하여 살펴봄.  
head(sort(unique(subname[ , "STATION_NM"])), 10)

# 아래 코드를 통해 지하철노선별 역명을 `Line` 이름의 리스트 객체에 저장하여 추후 분석에 활용한다.  
Line <- tapply(subname[,"STATION_NM"], subname[,"LINE_NUM"], unique)
sapply(Line, head)

# TIP 
# 역별 특정연도의 탑승객수를 합한하는 함수 `agg_fun()`을 정의하고, 이를 활용하여 요약된 결과를 데이터프레임에 저장

agg_fun <- function(vec, dat){
  sub_Line <- dat[dat[,"stat_name"] %in% vec, ]
  tot <- aggregate(on_tot ~ year + stat_name, sub_Line, sum)
  return( tot )
}

total <- lapply(Line[1:8], FUN=agg_fun, dat=subway2)
df1 <- lapply(total, xtabs, formula = on_tot ~ stat_name + year)
lapply(df1, head)


# 과제문제 ________________________________________________________________________________________


#----------------------------------#
#        12-3주차 모범 답안        #
#----------------------------------#


# (1) 탑승객 하위 10개역의 2013년도 월별 승객 추이도를 작성하시오.

# 1. 하위 10개역 인덱스 만들기 
cum_total <- lapply(total, xtabs, formula = on_tot ~ stat_name)
cum_total_vec <- unlist(cum_total)
names(cum_total_vec) <- unlist(lapply(strsplit(names(cum_total_vec),"\\."), function(x) x[2]))

idx_bot10 <- cum_total_vec <= sort(cum_total_vec, decreasing=FALSE)[10]
cum_total_vec[idx_bot10]
str(subway2)

# 2. 하위 10개역 중  2013년도 데이터만 추출
stat_bot10_2013 <- subset(subway2, subset = stat_name %in% names(cum_total_vec[idx_bot10]) & year == "2013", 
                          select = c("stat_name", "on_tot", "month"))


# 3. 탑승객 월별 합계 계산 
stat_bot10_2013 <- aggregate(on_tot ~ month + stat_name, stat_bot10_2013, sum)

# 4. 탑승객 하위 10개역 2013년도 데이터 시각화 
plt <- ggplot(stat_bot10_2013, aes(x = month, y = on_tot, colour = stat_name, group = stat_name))
plt <- plt + theme_classic() + geom_line() + geom_point(size = 6, shape = 19, alpha = 0.5)

plt + scale_x_discrete("2013년", labels = paste0(unique(as.numeric(stat_bot10_2013$month)), "월")) +
  ylab("월별 탑승객수") +
  scale_colour_discrete(name = c("지하철역"))




# (2) 상위10개역의 추이와 비교하여 다른 점이 있다면 서술하시오.
# 1. 상위 10개역 인덱스 만들기 
idx_top10 <- cum_total_vec >= sort(cum_total_vec, decreasing=TRUE)[10]
cum_total_vec[idx_top10]

# 2. 상위 10개역 중  2013년도 데이터만 추출
stat_top10_2013 <- subset(subway2, subset = stat_name %in% names(cum_total_vec[idx_top10]) & year=="2013",
                          select=c("stat_name", "on_tot", "month"))

# 3. 탑승객 월별 합계 계산 
stat_top10_2013 <- aggregate(on_tot ~ month + stat_name, stat_top10_2013, sum)


# 4. 탑승객 상위 10개역 2013년도 데이터 시각화 
plt <- ggplot(stat_top10_2013, aes(x=month, y=on_tot, colour=stat_name, group=stat_name))
plt <- plt + theme_classic() + geom_line() + geom_point(size=6, shape=19, alpha=0.5)
plt + scale_x_discrete("2013년", labels=paste0(unique(as.numeric(stat_top10_2013$month)), "월")) +
  ylab("월별 탑승객수") +
  scale_colour_discrete(name=c("지하철역"))



# 상위 10개역의 경우 2월, 8월 및 9월에 탑승객수의 일시적인 감소를 보이는 반면, 하위 10개역에서는 이러한 현상이 뚜렷이 나타나지 않는다.  
# 특이사항으로는 마곡역의 경우, 계절에 상관없이 지속적으로 탑승객수가 증가하는 현상을 볼 수 있다.  
# 이는 최근(2013년) 마곡지구의 개발로 인한 인구수 증가로 인하여 이용자가 증가하는 것으로 파악된다. 





#----------------------------------#
#        12-5주차 모범 답안        #
#----------------------------------#

# (1) 천호역의 시간대별 탑승인원과 하차인원 추이 그래프를 작성하시오.

# 시간 변수 데이터 중 타입이 character인 변수를 numeric으로 

subway2[,5:47] <- apply(subway2[,5:47], 2, FUN=as.integer)
str(subway2)


# 역명이 천호인 데이터만 추출 
ds <- subway2[subway2$stat_name == '천호',]

# 연도별 시간대에 따른 탑승객수   
subway.agg_on <- aggregate(ds[,c(7:26)], by = list(year = ds$year), FUN = sum)

# 연도별 시간대에 따른 하차승객 수
subway.agg_off <- aggregate(ds[,c(28:47)], by = list(year = ds$year), FUN = sum)

# year 변수를 중심으로 데이터 재구조하기 
melted_on <- melt(subway.agg_on, id.vars = 'year', na.rm = T)

melted_off <-melt(subway.agg_off, id.vars = 'year', na.rm = T)


# 연도별로 시간대별 탑승객 수 시각화 
plt1 <- ggplot(melted_on, aes(x= melted_on$variable, y = melted_on$value, colour = year, group = year)) +
  theme_classic() + geom_line() + geom_point(size=3, shape=19, alpha=0.5) +
  scale_x_discrete("탑승시간대", labels=as.character(5:24)) + ylab("누적탑승객수") + scale_colour_discrete(name=c("연도"))

plt1

# 연도별로 시간대별 하차승객 수 시각화 
plt2 <- ggplot(melted_off, aes(x= melted_on$variable, y = melted_on$value, colour = year, group = year)) +
  theme_classic() + geom_line() + geom_point(size=3, shape=19, alpha=0.5) +
  scale_x_discrete("하차시간대", labels=as.character(5:24)) + ylab("누적탑승객수") + scale_colour_discrete(name=c("연도"))

plt2


#----------------------------------#
#        12-6주차 모범 답안        #
#----------------------------------#
# (1) 누적 탑승 인원을 각 역별로 수치화하고 이를 지하철역 위치에 크기에 비례하는 원으로 표현하시오.

# 지하철 역별 누적 탑승객수 구하기
dat2 <- aggregate(on_tot ~ stat_name, subway2, sum)

# 지하철역 좌표 정보가 포함된 데이터와 합치기 
dat2 <- merge(dat2, subname, by.x="stat_name", by.y="STATION_NM")

# 서울지역 구글맵 불러오기 
register_google(# key = ''
  )

Map_Seoul <- get_map(location=c(lat=37.55, lon=126.97), zoom=11, maptype="roadmap") # 서울역의 위도 경도
MM <- ggmap(Map_Seoul)

# 지도위에 매핑하기 
MM3 <- MM + geom_point(aes(x=YPOINT_WGS, y=XPOINT_WGS, size=on_tot), alpha=0.5, data=dat2)
MM3 + scale_size_area(name=c("탑승객수"), max_size=15) + 
  geom_text(aes(x=YPOINT_WGS, y=XPOINT_WGS, label=stat_name), colour="red", vjust=3, size=3.5, fontface="bold", data=dat2) +
  labs(x="경도", y="위도")

