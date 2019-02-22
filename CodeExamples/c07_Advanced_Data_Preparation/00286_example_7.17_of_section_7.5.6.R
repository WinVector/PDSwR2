# example 7.17 of section 7.5.6 
# (example 7.17 of section 7.5.6)  : Advanced Data Preparation : The vtreat package in general : Splines 
# Title: Example data 

library("ggplot2")
d <- data.frame(x = 0.03*(1:1000))
d$y <- sin(d$x)

ggplot(data = d, mapping = aes(x = x, y = y)) + 
  geom_point()

