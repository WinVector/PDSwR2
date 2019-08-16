# informalexample 2.17 of section 2.3.1 
# (informalexample 2.17 of section 2.3.1)  : Starting with R and data : Working with relational databases : A production-size example 

table(schooling = dpus$SCHL, sex = dpus$SEX)                 	# Note: 1 
                                                
##                                                 sex
## schooling                                         Male Female
##   No Advanced Degree                             13178   9350
##   Associate's degree                              1796   2088
##   Bachelor's degree                               4927   4519
##   Doctorate degree                                 361    269
##   Master's degree                                 1792   2225
##   Professional degree beyond a bachelor's degree   421    379

tapply(                                                   	# Note: 2 
   dpus$PINCP,                                       	# Note: 3 
   list(dpus$SCHL, dpus$SEX),                        	# Note: 4 
   FUN = mean                                        	# Note: 5 
   )

##                                                     Male   Female
## No Advanced Degree                              44304.21 33117.37
## Associate's degree                              56971.93 42002.06
## Bachelor's degree                               76111.84 57260.44
## Doctorate degree                               104943.33 89336.99
## Master's degree                                 94663.41 69104.54
## Professional degree beyond a bachelor's degree 111047.26 92071.56

# Note 1: 
#   Use the table command to count how even each pair of SCHL and SEX occurs. 

# Note 2: 
#   Use tapply to tally how often each pair of SCHL of SEX occurs 

# Note 3: 
#   This argument is the vector of data we are aggregating or summarizing in the tapply. 

# Note 4: 
#   This argument list specifies how we are grouping the data, in this case simultaneously by SCHL and SEX. 

# Note 5: 
#   The argument specifies how we are aggregating values, in this case we are taking the mean or average using the mean function. 

