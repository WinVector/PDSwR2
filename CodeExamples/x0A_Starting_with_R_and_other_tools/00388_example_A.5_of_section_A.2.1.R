# example A.5 of section A.2.1 
# (example A.5 of section A.2.1)  : Starting with R and other tools : Starting with R : Primary features of R 
# Title: Call-by-value effect 

a <- c(1, 2)
b <- a

print(b)

a[[1]] <- 5            	# Note: 1 

print(a)

print(b)               	# Note: 2

# Note 1: 
#   “Alter a”. Actually this is 
#   implemented by building an entirely new vector and 
#   reassigning a to refer to this new vector. The old 
#   value remains as it was, and any references 
#   continue to see the old unaltered value. 

# Note 2: 
#   Notice b’s value is not 
#   changed. 

