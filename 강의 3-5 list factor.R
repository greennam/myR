# 여러 종류 data 형태 넣을수 있음

# data 추출시 리스트는 꺾쇠 2개를 사용 함 : member[[1]]

member <- list(name='Kim', address = 'pusan', tel='0102122121',
               age=20, married=FALSE)
member

member[[1]] # list에서 요소 값만 불러올때 꺾쇠 2개 사용
member[[2]]
member[[3]]

member[1]
member[2]

member$name
member$address

#_____________________
# factor : 문자형 변수 (숫자는 안됨). 
# 특정 종류의 값만 가질수 있는 데이터 타입 (예: 혈액형)
blood.factor <- factor(c('A', 'A', 'AB', 'O', 'B'))
blood.factor
is.factor(blood.factor)
blood.factor[6] <- 'C' # 에러 나옴. 

# vector는 따움표 있다. List는 따움표 없고, Levels 있음
blood.vector <- c('A', 'A', 'AB', 'O', 'B')
blood.vector

# factor는 label 순서대로 숫자로 변환할 수 있다
blood.factor
as.numeric(blood.factor)

# read.csv로 파일 읽으면 "문자열 column은 factor"로 저장된다 

# Levels를 알고 싶으면
levels(blood.factor)

# 숫자의 level을 알고 싶으면. 3 rd ?
levels(blood.factor)[3]
