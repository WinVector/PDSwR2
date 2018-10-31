# informalexample 5.26 of section 5.1.3 
# (informalexample 5.26 of section 5.1.3)  : Data Engineering and Data Shaping : Data Selection : Ordering rows 

order_index <- with(data, order(x, y, decreasing = TRUE)) 	# Note: 1 
  
data[order_index, , drop = FALSE]

# Note 1: 
#   with() executes the code in its second argument as if the columns of the first argument were variables. This lets us write "x" instead of "order$x". 

