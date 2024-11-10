# author: Kwan Yu Chuk
# date: 5/26/2024

# ANOVA example
greenwaste <- read.csv("GreenWasteExperiment.csv", stringsAsFactors = T)

head(greenwaste)
str(greenwaste)
summary(greenwaste)

with(greenwaste, tapply(Dry_shoot_mass, Treatment_group, mean))
with(greenwaste, tapply(Dry_shoot_mass, Treatment_group, sd))

greenwaste$Treatment_group<-factor(greenwaste$Treatment_group, levels= c("100_PB", "75_PB.25_GW", "50_PB.50_GW", "25_PB.75_GW", "100_GW"))

with(greenwaste,boxplot(Dry_shoot_mass ~ Treatment_group,
                         names = c("100 PB", "75 PB 25 GW", "50 PB 50 GW", "25 PB 75 GW", "100 GW"), 
                         ylab = "Dried weight (g)",
                         xlab = "Treatment group (%)",
                         boxwex = 0.6,
                         cex.axis =0.8,
                         las = 1))  
text(x = 5, y = 12, labels = paste("PB: pine bark", "GW: green waste", sep = "\n"))

with(greenwaste, bartlett.test(Dry_shoot_mass ~ Treatment_group))

with(greenwaste,oneway.test(Dry_shoot_mass ~ Treatment_group, var.equal=FALSE ))

with(greenwaste,pairwise.t.test(Dry_shoot_mass, Treatment_group, pool.sd=FALSE))

