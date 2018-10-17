# informalexample 5.29 of section 5.1.3 
# (informalexample 5.29 of section 5.1.3)  : Data Engineering and Data Shaping : Data Selection : Ordering rows 

library("data.table")

data_data.table <- as.data.table(data)

# similar to base-R solution
order_index <- with(data, order(x, y, decreasing = TRUE))
data[order_index, , drop = FALSE]

