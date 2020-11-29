library(wordcloud)
library(RColorBrewer)
library(KoNLP)
useNIADic()
useSejongDic()
pal2 <- brewer.pal(8, "Dark2")

buildDictionary(ext_dic = "woorimalsam") # OK. 629,897 words dictionary was built.

text <- readLines(file.choose())
noun <- sapply(text, extractNoun, USE.NAMES = F)

#추출된 명사 통합
noun2 <- unlist(noun)

# 단어 빈도수 계산
wordcount <- table(noun2)

# 내림차순. 빈도수 많은것 앞에서 10개 자름
temp <- sort(wordcount, decreasing = T)[1:10] 
#
temp
temp <- temp[-1] # 첫번째 space, del blank

barplot(temp, las = 2, names.arg = names(temp),
        col = "lightblue", 
        main = "Most frequent words",
        ylab = "Word frequencies")

wordcloud(names(wordcount),
          freq = wordcount, # 단어 빈도
          scale = c(6, 0.7),
          min.freq = 3, #출력될 단어의 최소 빈도
          random.order = F, # F : 빈도크면 중앙배치 
          rot.per = .1, # 90도 회전 단어 비율
          colors = pal2)

#' 전처리 계획을 세웠다.
#' 
#' @ 트윗 태그 제거
#' URL 제거
#' 명사 추출
#' 문장 부호 제거
#' 숫자 제거
#' 영어 소문자화
#' 불용어 제거