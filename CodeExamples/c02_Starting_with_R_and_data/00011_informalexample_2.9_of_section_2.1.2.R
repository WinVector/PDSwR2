# informalexample 2.9 of section 2.1.2 
# (informalexample 2.9 of section 2.1.2)  : Starting with R and data : Starting with R : R programming 

data <- data.frame(revenue = c(2, 1, 2),    	# Note: 1 
                   sort_key = c("b", "c", "a"), 
                   stringsAsFactors = FALSE)
print(data)

#   revenue sort_key
# 1       2        b
# 2       1        c
# 3       2        a

. <- data                                     	# Note: 2 
. <- .[order(.$sort_key), , drop = FALSE]     	# Note: 3 
.$ordered_sum_revenue <- cumsum(.$revenue)
.$fraction_revenue_seen <- .$ordered_sum_revenue/sum(.$revenue)
result <- .                                   	# Note: 4 

print(result)

#   revenue sort_key ordered_sum_revenue fraction_revenue_seen
# 3       2        a                   2                   0.4
# 1       2        b                   4                   0.8
# 2       1        c                   5                   1.0

# Note 1: 
#   Our notional, or example data. 

# Note 2: 
#   Assign our data to a temporary variable named “.”. The original values will remain available 
#   in the “data” variable, making it easy to re-start 
#   the calculation from the beginning if 
#   necessary. 

# Note 3: 
#   Use the order command to sort the rows. The “drop = FALSE” is not strictly needed, but it is 
#   good to get in the habit of including it. For 
#   single column data.frames without the “drop = 
#   FALSE” argument, the “[,]” indexing operator will 
#   convert the result to a vector, which is almost 
#   never the R user's true intent. The “drop = FALSE” 
#   argument turns off this conversion, and it is a 
#   good idea to include it “just in case” and a 
#   definite requirement when either the data.frame 
#   has a single column or when we don’t know if the 
#   data.frame has more than one column (as the 
#   data.frame comes from somewhere else). 

# Note 4: 
#   Assign the result away from “.” to a more memorable variable name. 

