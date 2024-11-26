# author: Kwan Yu Chuk

# oneway ANOVA example 1
group <- read.csv("oneway ANOVA example.csv", stringsAsFactors = T)

head(group)
str(group)
summary(group)

# use boxplot to visualize data
with(group, boxplot(length~group))

# bartlett test: check variance across groups
# H0: equal variance
# H1: variances are not equal
with(group, bartlett.test(length~group))

# oneway test: check mean
# H0: equal mean
# H1: means are not equal
with(group, oneway.test(length~group, var.equal=FALSE))

# pairwise.t.test: multiple comparison between groups
# H0: the means of 2 groups are equal
# H1: not equal
with(group, pairwise.t.test(length, group, pool.sd=FALSE))


