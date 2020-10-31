st<- data.frame(state.x77, state.name)
str(st)
radius <- sqrt(st$Population)
symbols(st$Income, st$Illiteracy,
        circles = radius,
        inches = 0.4,
        fg = "white",
        bg = "green",
        lwd = 1.5,
        xlab = "Income",
        ylab ="Illiteracy",
        main = "US State data")

text(st$Income, st$Illiteracy,
     st$state.name,
     cex = 0.8,
     col = "black")
