# 품종별 따로 따로 꽃잎, 꽃받침 폭폭과 길이 평균 산출

# mean
agg <- aggregate(iris[,-5], by=list(iris$Species),
                 FUN = mean);agg

agg <- aggregate(iris[,-5], by=list(mean_species = iris$Species),
                 FUN = mean);agg # Specify name to replace Group.1

# std deviation
agg <- aggregate(iris[,-5], by=list(iris$Species),
                 FUN = sd); agg

head(mtcars)
summary(mtcars)
dim(mtcars)

# max
agg <- aggregate(mtcars, by=list(mtcars$cyl,
                                 mtcars$vs),
                 FUN=max); agg

# max, group.1=cyl, group.2 = vs
agg <- aggregate(mtcars, by=list(cyl = mtcars$cyl,
                                 vs = mtcars$vs),
                 FUN=max); agg

# max, group 1=vs, group2 = cyl
agg <- aggregate(mtcars, 
                 by=list(vs = mtcars$vs, cyl = mtcars$cyl),
                 FUN=max); agg

# skip recursive dataset name by attach
attach(mtcars)
agg <- aggregate(mtcars, 
                 by=list(vs = vs, cyl = cyl),
                 FUN=max); agg
detach(mtcars)
