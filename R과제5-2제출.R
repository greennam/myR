#5-2-1
Income <- c(125000,100000,40000,35000,41000,
            29000,35000,24000,50000,60000)
YearsOfEducation <- c(19,20,16,16,18,12,14,12,16,17)
#plot(Income, YearsOfEducation)
table_1 <- data.frame(cbind(Income, YearsOfEducation))
table_1
plot(YearsOfEducation~Income, data = table_1)
res = lm(YearsOfEducation~Income, data = table_1)
abline(res)
cor(YearsOfEducation, Income)

#5-2-2
GPA <- c(3.1,2.4,2.0,3.8,2.2,3.4,2.9,3.2,2.7,2.5)
TV_hr <- c(14,10,20,7,25,9,15,13,4,21)
table_2 <- data.frame((cbind(GPA, TV_hr)))
table_2
plot(GPA~TV_hr, data = table_2)
res = lm(GPA~TV_hr, data = table_2)
abline(res)
cor(GPA, TV_hr)
