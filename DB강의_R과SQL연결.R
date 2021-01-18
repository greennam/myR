library(readxl)
cust <- read_excel(path='서점DB.xls', sheet='고객',col_names = T)
book <- read_excel(path='서점DB.xls', sheet='도서',col_names = T)
order <- read_excel(path='서점DB.xls', sheet='주문',col_names = T)

library(writexl)
write_xlsx(book, "도서2.xls", format_headers = T)
write_xlsx(book, "도서3.xls", col_names=F, format_headers=F)

# install.packages("RODBC")
library(RODBC)

conn <- odbcConnect("rConn")
class(conn)

cust1 <- sqlQuery(conn, "SELECT * FROM 고객")
book2 <- sqlQuery(conn, "SELECT * FROM 도서")

# 주소 변경
sqlQuery(conn, "SELECT * FROM 고객 WHERE 이름=\'박지성\'")
test <- sqlQuery(conn, "update 고객 set 주소 = \'대한민국 제주\' where 이름 = \'박지성\'")

test <- sqlQuery(conn, "insert into 도서 values(11, \'데이터언어\', \'Pearson\', 13000)")

# sqldf 에 의한 그룹처리
install.packages("sqldf")
library(sqldf)

cust2 <- read.csv("고객.txt", sep="\t", stringsAsFactors = T, 
                  encoding = "utf-8" ); cust2
cust3 <- read.csv("고객.txt", sep="\t", stringsAsFactors = T); cust3
book2 <- read.csv("도서.txt", encoding = "utf-8", sep="\t");book2
order2 <- read.csv("주문.txt", stringsAsFactors = T , encoding = "utf-8", sep="\t");order2

sel_cust <- sqldf("select * from cust2");sel_cust
#sel_cust <- sqldf("select * from cust2 where 이름=\'박지성\'");sel_cust
