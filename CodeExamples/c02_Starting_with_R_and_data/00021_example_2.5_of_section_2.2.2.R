# example 2.5 of section 2.2.2 
# (example 2.5 of section 2.2.2)  : Starting with R and data : Working with data from files : Using R with less-structured data 
# Title: Transforming the car data 

source("mapping.R")                      	# Note: 1 
for(ci in colnames(d)) {                     	# Note: 2 
   if(is.character(d[[ci]])) {
      d[[ci]] <- as.factor(mapping[d[[ci]]])  	# Note: 3 
   }
}

# Note 1: 
#   This file can be found at https://github.com/WinVector/PDSwR2/blob/master/Statlog/mapping.R . 

# Note 2: 
#   Prefer using column names to column indices. 

# Note 3: 
#   The [[]] notation is using the fact 
#   that data.frames are named lists of columns. So we 
#   are working on each column in turn. Notice the 
#   mapping lookup is vectorized: i.e. it is applied 
#   to all elements in the column in one step. 

