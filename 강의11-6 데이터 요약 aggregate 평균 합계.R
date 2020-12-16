# 품종별 따라 따로꽃잎, 꽃받침 포과 길이 평균

# sum
agg <- aggregate(iris[,-5], by=list(iris$Species),
                 FUN = mean);agg

agg <- aggregate(iris[,-5], by=list(iris$Species),
                 FUN = sd); agg

head(mtcars)
summary(mtcars)
dim(mtcars)
agg <- aggregate(mtcars, by=list(mtcars$cyl,
                                 mtcars$vs),
                 FUN=max); agg

# group.1=cyl, group.2 = vs
agg <- aggregate(mtcars, by=list(cyl = mtcars$cyl,
                                 vs = mtcars$vs),
                 FUN=max); agg

# group 1=vs, group2 = cyl
agg <- aggregate(mtcars, 
                 by=list(vs = mtcars$vs, cyl = mtcars$cyl),
                 FUN=max); agg

# skip recursive dataset name by attach
attach(mtcars)
agg <- aggregate(mtcars, 
                 by=list(vs = vs, cyl = cyl),
                 FUN=max); agg
detach(mtcars)
