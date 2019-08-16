# informalexample 2.8 of section 2.1.2 
# (informalexample 2.8 of section 2.1.2)  : Starting with R and data : Starting with R : R programming 

d <- data.frame(x = 1, y = 2)      	# Note: 1 
d2 <- d                            	# Note: 2 
d$x <- 5                           	# Note: 3 
        
print(d)
#   x y
# 1 5 2

print(d2)
#   x y
# 1 1 2

# Note 1: 
#   Create some example data and refer to it by the name d. 

# Note 2: 
#   Create an additional reference d2 to the same data. 

# Note 3: 
#   Alter the value referred to by d. 

