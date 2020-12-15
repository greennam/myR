x <- data.frame(name=c('a', 'b', 'c'), math=c(90,80, 40))
y <- data.frame(name=c('a', 'b', 'd'), korean=c(75,60, 90))

merge(x, y, by=c('name')) #  공통
merge(x, y, by=c('name'), all.x = T) # left
merge(x, y, by=c('name'), all.y = T)
merge(x, y, by=c('name'), all = T)

c <- data.frame(name=c('a', 'b', 'c'), math=c(90,80, 40))
d <- data.frame(pp=c('a', 'b', 'd'), korean=c(75,60, 90))
#merge(p, q, by.p=c('name'), by.q=c('pp'))
merge(c, d, by.x=c("name"), by.y=c("pp")) #by.c 아니고 by.x
# merge(c, d, by=c('name'), by.y=c("pp"), all.c = T) # left, result is wrong
merge(c, d, by=c('name'), by.y=c("pp"), all.x = T) # by.c 아니고 by.x

x <- data.frame(name=c('a', 'b', 'c'), math=c(90,80, 40))
y <- data.frame(pp=c('a', 'b', 'd'), korean=c(75,60, 90))
merge(x,y,by.x = c("name"), by.y = c("pp"))

