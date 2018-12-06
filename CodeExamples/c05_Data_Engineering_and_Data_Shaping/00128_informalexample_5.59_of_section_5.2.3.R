# informalexample 5.59 of section 5.2.3 
# (informalexample 5.59 of section 5.2.3)  : Data Engineering and Data Shaping : Basic Data Transforms : Parametric programming 

library("data.table")

d <- data.table(x = 1:2, y = 3:4, z = 5:6) 	# Note: 1 

COLS_WE_WANT <- c("x", "y") 	# Note: 2 

d[, ..COLS_WE_WANT] 	# Note: 3 
#    x y
# 1: 1 3
# 2: 2 4

NEW_COL_NAME <- "q" 	# Note: 4  
ARG1_NAME <- as.name("x") 	# Note: 5 
ARG2_NAME <- as.name("y")

d[ , eval(NEW_COL_NAME) := eval(ARG1_NAME) + eval(ARG2_NAME)] 	# Note: 6 

print(d)
#    x y z q
# 1: 1 3 5 4
# 2: 2 4 6 6

# Note 1: 
#   Example data 

# Note 2: 
#   List of columns we want to select, coming as a paremeter from somewhere else. 

# Note 3: 
#   Select the set of columns. 

# Note 4: 
#   Name of new column to produce, coming from somewhere else as a parameter. 

# Note 5: 
#   Names of columns to calculate with, to ensure they are interpreted as refering to values and not as strings we use as.naume(). 

# Note 6: 
#   Perform the calculation, signalling to data.table abstractions using eval(). 

