# informalexample 2.3 of section 2.1.2 
# (informalexample 2.3 of section 2.1.2)  : Starting with R and data : Starting with R : R programming 

x <- 1:5
print(x)                                  	# Note: 1 
# [1] 1 2 3 4 5

x <- cumsumMISSPELLED(x)                  	# Note: 2 
# Error in cumsumMISSPELLED(x) : could not find function "cumsumMISSPELLED"

print(x)                                  	# Note: 3 
# [1] 1 2 3 4 5

x <- cumsum(x)                            	# Note: 4 
print(x)
# [1]  1  3  6 10 15

# Note 1: 
#   Define a value we are interested in and store it in the variable x. 

# Note 2: 
#   Attempt, and fail, to assign a new result to x. 

# Note 3: 
#   Notice in addition to supply a useful error message, R preserved the original value of x. 

# Note 4: 
#   Try the operation again, using the correct spelling of cumsum(). cumsum(), short for cumulative sum, is a useful function that computes running totals quickly. 

