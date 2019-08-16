# example 2.6 of section 2.2.2 
# (example 2.6 of section 2.2.2)  : Starting with R and data : Working with data from files : Using R with less-structured data 
# Title: Summary of Good_Loan and Purpose 

setwd("PDSwR2/Statlog")               	# Note: 1 
d <- readRDS("creditdata.RDS")        	# Note: 2 

table(d$Purpose, d$Good_Loan) 
                     
##                       BadLoan GoodLoan
##   business                 34       63
##   car (new)                89      145
##   car (used)               17       86
##   domestic appliances       4        8
##   education                22       28
##   furniture/equipment      58      123
##   others                    5        7
##   radio/television         62      218
##   repairs                   8       14
##   retraining                1        8

# Note 1: 
#   Set the working directory. You will have to replace PDSwR2/Statlog with the actual full path to Statlog on your machine. 

# Note 2: 
#   Read the prepared statlog data. 

