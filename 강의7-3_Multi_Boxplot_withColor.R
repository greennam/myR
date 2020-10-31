setwd("d:/myR")
ds <- read.csv("seoul_temp_2017.csv")
head(ds)
summary(ds$avg_temp)
boxplot(ds$avg_temp,
        col = "yellow",
        ylim = c(-15,40),
        xlab = "Seoul 1 yr temp",
        ylab = "Temp (deg C)")

month.avg <- aggregate(ds$avg_temp,
                       by = list(ds$month), median)[2]
odr <- rank(-month.avg) # for coloring
boxplot(avg_temp ~ month, data = ds,
        col=heat.colors(12)[odr],
        ylim = c(-20, 40),
        ylab = "Temp",
        xlab = "Month",
        main = "Seoul monthly Temp (2017)")
