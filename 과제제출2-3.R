# 1. Creat Vector d, 101~200
d <-seq(101:200)

#2. show d
d

#3. 10 th value
d[10]

#4. show 10 from back
d[-c(1:90)]

#5. show even
d[seq(2, 100, 2)]

#6. Store front 20 in d.20 & show
d.20 <- d[c(1:20)]
d.20

#7. In d.20, except 5th, show all
d.20[-c(5)]

#8. In d.20, show all except 5, 7, 9th
d.20[-c(5, 7, 9)]
