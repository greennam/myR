# 1. state.x77 , Income > 5000 
rich.income <- as.data.frame(state.x77)
rich.income$Income

rich <- subset(state.x77, 
               subset = (rich.income$Income > 5000))
