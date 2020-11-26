library(wordcloud)
library(KoNLP)
library(RColorBrewer)

useSejongDic()
pal2 <- brewer.pal(8, "Set2")
text <- readLines(file.choose())
noun <- sapply(text, extractNoun, USE.NAMES = F)

#추출된 명사 통합
noun2 <- unlist(noun)

# 단어 빈도수 계산
wordcount <- table(noun2)
temp <- sort(wordcount, decreasing = T)[1:10]
temp
temp <- temp[-1] # del blank

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
