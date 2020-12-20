# missing value 
# sum (x) : x
# sum (x, na.rm=T) # remove the missing value
x <- c(1, 2, 3, NA, 5, 8)
sum(x) # result is NA, error 
sum(x, na.rm = T) # ignore NA. NA, missing value be removed

is.na(x)
sum(is.na(x)) # qty of na. Like as sum(0,0,0,1,0,0)

z <- c(1,2,3,NA, 5, NA, 8)

z[is.na(z)] <- 0 # substitute 0 into NA

z <- c(1,2,3,NA, 5, NA, 8)
z[is.na(z)] <- 22 # substitute 22 into NA

z <- c(1,2,3,NA, 5, NA, 8)
y <- as.vector(na.omit(z)) # Omit N.A

######
# 2-dimension data's NA

# Insert NA in iris dataset
x <- iris
x[1,2] <- NA; x[1,3] <- NA
x[2,3] <- NA; x[3,4] <- NA
head(x)

col_na <- function(y){
  return(sum(is.na(y)))
}

na_count <- sapply(x, FUN=col_na) # sapply : apply a function over a List or Vector
# sapply: 컬럼을 하나하나 잘라서 input
na_count

is.na(x)
rowSums(is.na(x))
sum(rowSums(is.na(x))>0) #NA포함한 행수 

#NA 포함한 행 제외하고, 데이터 생성
head(x)
x[!complete.cases(x),]
y <- x[complete.cases(x),] # Gather row in which there's no NA
head(y)

# 결측값을 적당한 값으로 추정하는 방법
# install.packages("mice")
library(mice)
md.pattern(x) # missing data pattern : Diaply missing (NA) value pattern

# estimate NA value
result <- mice(x, m=5, maxit = 50,
               method = 'pmm', seed = 500)
# substitute with value
impute_x <- complete(result,2)
head(x)
head(impute_x)
head(iris)

# reference
# https://towardsdatascience.com/data-processing-for-non-techies-basic-terms-and-definitions-ea517038a4e5
