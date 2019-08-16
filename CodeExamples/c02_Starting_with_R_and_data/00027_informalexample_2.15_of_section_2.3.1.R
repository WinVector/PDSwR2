# informalexample 2.15 of section 2.3.1 
# (informalexample 2.15 of section 2.3.1)  : Starting with R and data : Working with relational databases : A production-size example 

levels(dpus$SCHL)                                 	# Note: 1 
## [1] "No Advanced Degree"                             "Associate's degree"                            
## [3] "Bachelor's degree"                              "Doctorate degree"                              
## [5] "Master's degree"                                "Professional degree beyond a bachelor's degree"

head(dpus$SCHL)                                  	# Note: 2 
## [1] Associate's degree Associate's degree Associate's degree No Advanced Degree Doctorate degree   Associate's degree
##   6 Levels: No Advanced Degree Associate's degree Bachelor's degree Doctorate degree ... Professional degree beyond a bachelor's degree

str(dpus$SCHL)                                   	# Note: 3 
##  Factor w/ 6 levels "No Advanced Degree",..: 2 2 2 1 4 2 1 5 1 1 ...

# Note 1: 
#   Show the possible levels for SCHL. 

# Note 2: 
#   Show the first few string values for SCHL. 

# Note 3: 
#   Show how the first few levels are represented as codes. 

