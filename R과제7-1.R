library(treemap)
dat <- read.csv(file = "d:/myR/국회의원_선거구_유권자수.csv", header = T)
head(dat)
treemap(dat,
        index=c("시도","선거구명"),
        vSize="선거인.수", 
        vColor="선거인.수",
        type="value", 
        bg.labels="yellow")

dat.a <- aggregate(dat[,5], by=list(dat$시도),sum)
head(dat.a)

treemap(dat.a,
        index=c("Group.1"),
        vSize="x", 
        vColor="x",
        type="value", 
        bg.labels="yellow")

