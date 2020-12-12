# 1.
#st <- as.data.frame(state.x77)
#class(st)
#st[order(st$Population),]
head(state.x77)
state.x77[order(state.x77[,1]),][1:10,] # order by Population

# 2.
#st[order(st$Income, decreasing = T),]
state.x77[order(state.x77[,2],decreasing = T),][1:10,] # order by Income, decreasing

# 3. 
#st[order(st$Illiteracy),][1:10, c(1,3)]
state.x77[order(state.x77[,3]),][1:10,3] # order by Illiteracy

