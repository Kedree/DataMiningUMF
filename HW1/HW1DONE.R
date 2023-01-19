#SETUP
setwd("C:/Users/Kedree Proffitt/Downloads")

#1
#a
su = read.delim("Su_raw_matrix.txt", header=TRUE, sep="\t")

#b
mean(su$Liver_2.CEL)
sd(su$Liver_2.CEL)

#c
colMeans(su)
colSums(su)

#2
n = 100000
o = rnorm(n, mean = 0, sd = 1)
hist(o, breaks = 30, xlim=c(-5, 5))

#a
a = rnorm(n, mean = 0, sd = 0.2)
hist(a, breaks = 30, xlim=c(-5, 5))
# a has the same mean as the standard o distribution. The only difference being the standard deviation being less giving
# higher histogram frequency closer to the center of the distribution (0), creating a taller, more compact spike still centered at 0 

#b
b = rnorm(n, mean = 0, sd = 0.5)
hist(b, breaks = 30, xlim=c(-5, 5))
# b has the same mean as the standard o distribution and a so its still centered at 0. The only difference being the standard deviation
# is 0.5, more compact than sd = 1 of o, more spread out compared to sd = 0.2 of a

#3
library(ggplot2)

#a
dat <- data.frame(cond = factor(rep(c("A","B"), each=200)),
                  rating = c(rnorm(200),rnorm(200, mean=.8)))
#b
# Overlaid histograms
ggplot(dat, aes(x=rating, fill=cond)) +
  geom_histogram(binwidth=.5, alpha=.5, position="identity")
# Wow very pretty! it overlays two histograms on the same x axis it seems and has a transparency value, love the colors

#c
# Interleaved histograms
ggplot(dat, aes(x=rating, fill=cond)) + geom_histogram(binwidth=.5, position="dodge")
# It places the hists by bin, so bin 1r 1b, 2r 2b, 3r 3b... great for direct comparison. I prefer #b, but this has its own purpose

#d
# Density plots
ggplot(dat, aes(x=rating, colour=cond)) + geom_density()
# Great for comparing curves relative, I used these a lot in Data Vis class

#e
# Density plots with semitransparent fill
ggplot(dat, aes(x=rating, fill=cond)) + geom_density(alpha=.3)
# A filled in version of d, might be more visually pleasing to some

#f
diabetes = read.csv("diabetes_train.csv", header=TRUE)

ggplot(diabetes, aes(x=mass, fill=class)) +
  geom_histogram(binwidth=1.25, alpha=.5, position="identity")
# The outliers at mass = 0 makes me sad but I dont think I am supposed to mess with the data rn, changed bin width

ggplot(diabetes, aes(x=mass, fill=class)) + geom_histogram(binwidth=1.25, position="dodge")
# Really cannot get behind this one

ggplot(diabetes, aes(x=mass, colour=class)) + geom_density()
# Reveals the shapes of the curve and relative heights as opposed to absolute heights, very useful

ggplot(diabetes, aes(x=mass, fill=class)) + geom_density(alpha=.3)
# Still do not know if I like the filled or the unfilled version more.

#4
quantile(diabetes$skin, c(0.1, 0.3, 0.5, 0.6))
# Glad using a list works, that's very nice!