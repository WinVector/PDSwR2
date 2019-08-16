# informalexample 2.2 of section 2.1.2 
# (informalexample 2.2 of section 2.1.2)  : Starting with R and data : Starting with R : R programming 

example_vector <- c(10, 20, 30)                 	# Note: 1 
example_list <- list(a = 10, b = 20, c = 30)    	# Note: 2 

example_vector[1]                               	# Note: 3 
## [1] 10
example_list[1]
## $a
## [1] 10

example_vector[[2]]                             	# Note: 4 
## [1] 20
example_list[[2]]
## [1] 20

example_vector[c(FALSE, TRUE, TRUE)]            	# Note: 5 
## [1] 20 30
example_list[c(FALSE, TRUE, TRUE)]
## $b
## [1] 20
## 
## $c
## [1] 30

example_list$b                                  	# Note: 6 
## [1] 20

example_list[["b"]]
## [1] 20

# Note 1: 
#   Build an example vector. c() is R’s concatenate operator—it builds longer vectors and lists 
#   from shorter ones without nesting. For example 
#   c(1) is just the number 1, and c(1, c(2, 3)) is 
#   equivalent to c(1, 2, 3), which in turn is the 
#   integers 1 through 3 (though stored in a floating 
#   point format). 

# Note 2: 
#   Build an example list. 

# Note 3: 
#   Demonstrate vector and list use of []. Notice for the list [] returns a new short list, not the item. 

# Note 4: 
#   Demonstrate vector and list use of [[]]. In common cases [[]] forces a single item to be returned, though for nested lists of complex type this item itself could be a list. 

# Note 5: 
#   Vectors and lists be indexed by vectors of logicals, integers, and (if the vector or list has names) characters. 

# Note 6: 
#   For named examples, the syntax example_list$b is essentially a short-hand for 
#   example_list[["b"]] (the same is true for named 
#   vectors). 

