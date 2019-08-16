# example 2.3 of section 2.2.2 
# (example 2.3 of section 2.2.2)  : Starting with R and data : Working with data from files : Using R with less-structured data 
# Title: Loading the credit dataset 

setwd("PDSwR2/Statlog")                 	# Note: 1 
d <- read.table('german.data', sep=' ',
   stringsAsFactors = FALSE, header = FALSE)

# Note 1: 
#   Replace this path with the actual path where you have saved PDSwR2. 

