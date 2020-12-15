# website URL https://www.marsja.se/how-to-use-in-in-r/
a <- seq(1,5);a
b <- seq(3,12);b
which(a %in% b)

which(b %in% a)

which(seq(1, 10) %in% seq(5,13))
seq(1, 10) %in% seq(5:13)
c <- seq(1,10)      
d <- seq(5,13)
c %in% d

# Sequences of Letters:
a <- LETTERS[1:10]

# Second seq of ltters
b <- LETTERS[4:10]

# longer in shorter
a %in% b
b %in% a

g <-  c("D", "F", "E")
h <- c("A", "E", "B", "C", "D", "E", "A", "B", "C", "D", "F")
which(h %in% g)
which(h == g)

#---- work with dataframe
install.packages("tidyverse")
# install.packages("readxl")
library(readxl)
library(httr)

#URL to Excel File:
xlsx_URL <- 'https://mathcs.org/statistics/datasets/titanic.xlsx'

# Get the .xlsx file as an temporary file
GET(xlsx_URL, write_disk(tf <- tempfile(fileext = ".xlsx")))

# Reading the temporary .xlsx file in R:
dataf <- read_excel(tf)

# Checkiing dataframe:
head(dataf)

# %in% column 
2 %in% dataf$boat

# Creating a dataframe:
dataf2 <- data.frame(Type = c("Fruit","Fruit","Fruit","Fruit","Fruit",
                              "Vegetable", "Vegetable", "Vegetable", "Vegetable", "Fruit"),
                     Name = c("Red Apple","Strawberries","Orange","Watermelon","Papaya",
                              "Carrot","Tomato","Chili","Cucumber", "Green Apple"),
                     Color = c(NA, "Red", "Orange", "Red", "Green",
                               "Orange", "Red", "Red", "Green", "Green"))


# Adding a New Column:
dataf2 <- within(dataf2, {
  Red_Fruit = "No"
  Red_Fruit[Type %in% c("Fruit")] = "No"
  Red_Fruit[Type %in% "Vegetable"] = "No"
  Red_Fruit[Name %in% c("Red Apple", "Strawberries", "Watermelon", "Chili", "Tomato")] = "Yes"
})

library(dplyr)
dim(starwars)
head(starwars)
100 %>% sqrt %>% log

starwars %>%
  filter(!is.na(height)) %>%
  slice_max(height, n = 3)
