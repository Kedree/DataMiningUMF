mt = mtcars

cor(mt$mpg, mt$wt)

plot(mt$wt, mt$mpg, main="Weight vs Fuel Efficiency", xlab="Car Weight", ylab="Miles Per Gallon")