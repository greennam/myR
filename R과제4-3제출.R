# R 4-3 과제 제출

#1. 과목별 성적을 score벡터에 저장
score <- c(90,85,73,80,85,65,78,50,68,96)
names(score) <- c('KOR', 'ENG', 'MATH', 'HIST',
                  'SOC', 'MUSIC', 'BIO', 'EARTH',
                  'PHY', 'ART')
#2 score 벡터 내용
print(score)

#3 전체 성적의 평균?
mean(score)

#4 Median?
median(score)

#5 Standard deviation?
sd(score)

#6 성적이 높은 과목의 이름?
which(score == max(score))

#7 Boxplot
boxplot(score)

#8 Histogram
hist(score, main = "Hong's score", col = "purple" )

# mtcars dataset

#9 wt mean, median, trimmed mean(15%), standard deviation
# head(mtcars)
wt <- mtcars[,'wt']

mean(wt)
median(wt)
mean(wt, trim = 0.15)
sd(wt)

#10 summary of wt
summary(wt)

#11 cyl 도수분포표
cyl <- mtcars[, "cyl"]
table(cyl)

#12 Bar chart of cyl table
barplot(table(cyl))

#13 wt histogram, cyl & gear bar graph in one screen
par(mfrow = c(1,3))
hist(wt)
barplot(cyl)
gear <- mtcars[, 'gear']
barplot(gear)

#14 wt boxplot
par(mfrow = c(1,1))
boxplot(wt)

#15 disp boxplot()
disp <- mtcars[, 'disp']
boxplot(disp)
# summary(disp)
#관찰: 배기량의 평균은 230.7, 중앙값은 196.3,  이상치 없음.



