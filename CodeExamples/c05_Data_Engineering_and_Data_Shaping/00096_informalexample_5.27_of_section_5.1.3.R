# informalexample 5.27 of section 5.1.3 
# (informalexample 5.27 of section 5.1.3)  : Data Engineering and Data Shaping : Data Selection : Ordering rows 

order_index <- with(data, order(x, y, decreasing = TRUE))
  
data[order_index, , drop = FALSE]

