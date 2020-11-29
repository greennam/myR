# wordcloud2 Better shape than wordcloud

# install wordcloud2 library
# library(devtools)
# devtools::install_github("lchiffon/wordcloud2")

library(wordcloud2)
library(KoNLP)

# read file.txt
yung <- readLines("speech_nmh.txt") #, encoding = 'UTF-8')
# yung <- readline(file.choose())


# extract Noun
yung2 <- sapply(yung, extractNoun, USE.NAMES = F)

# unlist
yung3 <- unlist(yung2)

# gsub함수를 사용함으로써 생기는 공백(ex)숫자->""로 바꾸면 공백 생김)을 제거하기 위함

yung4 <- gsub('\\d+','',yung3)
yung4 <- gsub('-','',yung4)
yung4 <- gsub('""','',yung4)
write(unlist(yung4),'yeungnam1.txt')
#[출처] (R) wordcloud2로 더 예쁘게 시각화하기|작성자 종현

# make table
yung5 <- read.table('yeungnam1.txt')
head(yung5,200) # text are broken like as <u+633c>
wordcount <- table(yung5)


#---------------------------
# use alternative method to solve error, broken text
text <- readLines(file.choose())
noun <- sapply(text, extractNoun, USE.NAMES = F)

#추출된 명사 통합
noun2 <- unlist(noun)

# 단어 빈도수 계산
wordcount <- table(noun2)
temp <- sort(wordcount, decreasing = T)[1:50]
temp
temp <- temp[-1] # del blank

# wordcloud2, basic
wordcloud2(data=temp, fontFamily = '나눔바른고딕')

# wordcloud2, random-light or random-dart for fontcolor
wordcloud2(temp, color="random-light", 
           backgroundColor = "grey" )

# wordcloud2, make shape
letterCloud(data=temp, word="R", wordSize = 1)
# error, no output => solution: refresh display, push icon
