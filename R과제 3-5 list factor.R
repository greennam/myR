# 1. 
Group <- iris[,5]
Data <- iris[,1:4]
myiris <- list(Group, Data)

# 2. myiris 의 첫번째 요소와 두번째 요소의 내용을 보이시오.
myiris[[1]][1:5]
myiris[[2]][1:5,]

# 3. 영어의 요일(Sun, Mon, …)을 가지고 factor 변수 weekdays 를 생성하고 weekdays 의 내용을 보이시오.
weekdays = factor(c('Sun', 'Mon', 'Tue', 'Wed', 'Thur', 'Fri', 'Sat'))
weekdays

# 4. weekdays 의 값들을 숫자로 바꾸어 보이시오.
as.numeric(weekdays)
