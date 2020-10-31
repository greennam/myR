library(MASS)
head(UScrime)
radius <- sqrt(UScrime$Pop) # State population
symbols(UScrime$U2, UScrime$y, # x, y axis
        circles = radius, # Population
        inches = 0.4, # factor for adjust radius value
        fg = "white", # circle circumference
        bg = "lightgray", 
        lwd = 1.5,
        xlab = "unemployment 35 - 39 males",
        ylab = "crime rate",
        main = "USCrime Data") 

# U2: unemployment rate of urban males 35--39
# y : rate of crimes in a particular category per head of population

text(UScrime$U2, UScrime$y,
     1:nrow(UScrime),
     cex = 0.8, # font size
     col = "brown")

#######
symbols(UScrime$Ineq, UScrime$y, # x, y axis
        circles = radius, # Population
        inches = 0.4, # radius adjustable value
        fg = "white", # circle circumference
        bg = "lightgray", 
        lwd = 1.5,
        xlab = "Income equity",
        ylab = "crime rate",
        main = "USCrime Data") 

# U2: unemployment rate of urban males 35--39
# y : rate of crimes in a particular category per head of population

text(UScrime$Ineq, UScrime$y,
     1:nrow(UScrime),
     cex = 0.8,
     col = "brown")
