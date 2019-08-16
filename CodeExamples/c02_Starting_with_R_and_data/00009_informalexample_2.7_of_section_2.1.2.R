# informalexample 2.7 of section 2.1.2 
# (informalexample 2.7 of section 2.1.2)  : Starting with R and data : Starting with R : R programming 

d <- data.frame(x = c(1, NA, 3))       	# Note: 1 
print(d)
#    x
# 1  1
# 2 NA
# 3  3                                 	# Note: 2 

d$x[is.na(d$x)] <- 0                   	# Note: 3 
print(d)
#   x
# 1 1
# 2 0
# 3 3

# Note 1: 
#   “data.frame” is R’s tabular data type, and the most important data type in R. A data.frame 
#   holds data organized in rows and columns. 

# Note 2: 
#   When printing data.frames, row numbers are shown in the fist (unnamed) column, and column 
#   values are shown under their matching column 
#   names. 

# Note 3: 
#   We can place a slice or selection of the x column of d on the left-hand side of an assignment to easily replace all NA values with zero. 

