data("airquality")
head(airquality)

boxplot(Temp ~ Month, data = airquality,
        col="orange",
        ylab = "Temp",
        xlab = "Month Number",
        main = "Different boxplots for each month")

boxplot(Wind ~ Month, data = airquality,
        col="yellow",
        ylab = "Temp",
        xlab = "Wind",
        main = "Different boxplots for each month")

boxplot(Ozone ~ Month, data = airquality,
        col="gray",
        ylab = "Ozone",
        xlab = "Wind",
        main = "Different boxplots for each month")
