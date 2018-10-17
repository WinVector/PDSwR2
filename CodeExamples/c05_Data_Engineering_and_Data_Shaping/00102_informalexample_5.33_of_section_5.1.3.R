# informalexample 5.33 of section 5.1.3 
# (informalexample 5.33 of section 5.1.3)  : Data Engineering and Data Shaping : Data Selection : Ordering rows 

library("wrapr")

order_cols <- c("x", "y")
order_index <- orderv(data[order_cols], decreasing = TRUE)
data[order_index, , drop = FALSE]

