# informalexample 5.10 of section 5.1.1 
# (informalexample 5.10 of section 5.1.1)  : Data Engineering and Data Shaping : Data Selection : Subsetting Rows and Columns 

library("data.table")

df <- data.frame(x = 1:2, y = 3:4) 	# Note: 1 

df[, x] 	# Note: 2 
## Error in `[.data.frame`(df, , x) : object 'x' not found

x <- "y"  	# Note: 3 
dt <- data.table(df)

dt[, x]  	# Note: 4 
## [1] 1 2

dt[, ..x] 	# Note: 5 
##    y
## 1: 3
## 2: 4

# Note 1: 
#   Example data.frame. 

# Note 2: 
#   Notice writing df[, x] instead of df[, "x"] is an error (assuming x is not bound to a value in our environment). 

# Note 3: 
#   Set up data.table example. 

# Note 4: 
#   Notice this returns the column x much like d$x would. 

# Note 5: 
#   This uses data.table's "look up" idiom to get a data.table of columns referred to by the variable x. 

