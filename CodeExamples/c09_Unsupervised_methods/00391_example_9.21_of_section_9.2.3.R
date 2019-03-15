# example 9.21 of section 9.2.3 
# (example 9.21 of section 9.2.3)  : Unsupervised methods : Association rules : Mining association rules with the arules package 
# Title: Count how often each book occurs 

bookCount <- itemFrequency(bookbaskets, "absolute")
summary(bookCount)

##     Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
##    1.000    1.000    1.000    4.638    3.000 2502.000

