library(readr)
library(dplyr)
library(tidyr)

# 일정 규칙으로 작성한 여러개 파일명으로 list.files 만들기
# file gathering with all serial files, file_1, file_02
# base R의 기본 함수 list.files()를 사용하면 동일한 이름 형식을 가진 파일명을 모을 수 있다.

files <- list.files(pattern = "file_.*csv")

# list.files로 여러개 파일 읽어 들이기
# lapply()를 사용하면 위에서 모아놓은 파일명 리스트에 동일한 함수 read_csv를 적용할 수 있다. 
# 각각의 csv 파일로부터 각각의 데이터프레임을 읽어놓는 거다.

df_list <- lapply(files, read_csv)

# 여러개 파일 읽은것을 하나로 만들기
# dplyr의 bind_rows() 함수를 사용
bind_rows(df_list)

# 중복값 있는지 TRUE, FALSE ventor만들어, 고유값의 빈도 table 생성
duplicates <- df %>% duplicated() %>% table()

# 중복값 제거하기 distinct()
df %>% distinct()

# 참고 url : http://hleecaster.com/r-data-cleaning/