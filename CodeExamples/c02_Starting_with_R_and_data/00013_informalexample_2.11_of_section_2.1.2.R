# informalexample 2.11 of section 2.1.2 
# (informalexample 2.11 of section 2.1.2)  : Starting with R and data : Starting with R : R programming 

d <- data.frame(col1 = c(1, 2, 3), col2 = c(-1, 0, 1))
d$col3 <- d$col1 + d$col2
print(d)
#   col1 col2 col3
# 1    1   -1    0
# 2    2    0    2
# 3    3    1    4

