install_jdk()
install.packages("backports") # 이것이 에러제거 key임

install.packages("rJava")
install.packages("memoise")
install.packages('stringr')

install.packages("multilinguer") # install version 0.0.4
library(multilinguer) # install other program language like as python

 
# download 177.9 MB & install.packages('jJava') 
# into ‘D:/LeeSH/R/win-library/4.0’
install.packages(c("hash", "tau", "Sejong", "RSQLite", 
                   "devtools", "bit", "rex", "lazyeval", 
                   "htmlwidgets", "crosstalk", "promises", 
                   "later", "sessioninfo", "xopen", 
                   "bit64", "blob", "DBI", "memoise", 
                   "plogr", "covr", "DT", "rcmdcheck", 
                   "rversions"), type = "binary")
install.packages("remotes") # version 2.2.0
remotes::install_github('haven-jeon/KoNLP', upgrade = "never", INSTALL_opts=c("--no-multiarch"))
library(KoNLP)
# sessionInfo()
# my sessionInfo is
# R version 4.0.3 (2020-10-10)
# RStudio 1.3.1093
# Platform: x86_64-w64-mingw32/x64 (64-bit)
# Running under: Windows 10 x64 (build 17763)

# from github
install.packages('devtools')
devtools::install_github('haven-jeon/KoNLP')

# When error : 함수 "useSejongdic"를 찾을 수 없습니다
useNIADic() # OK. 1,213,109 words dictionary was built.
useSejongDic() # OK. 370,957 words dictionary was built.
