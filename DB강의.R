library(readxl)
cust <- read_excel(path='서점DB.xls', sheet='고객',col_names = T)
book <- read_excel(path='서점DB.xls', sheet='도서',col_names = T)
order <- read_excel(path='서점DB.xls', sheet='주문',col_names = T)

library(writexl)
write_xlsx(book, "도서2.xls", format_headers = T)
write_xlsx(book, "도서3.xls", col_names=F, format_headers=F)

install.packages("RODBC")
library(RODBC)

conn <- odbcConnect("rConn")
class(conn)
