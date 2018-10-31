# informalexample 5.28 of section 5.1.3 
# (informalexample 5.28 of section 5.1.3)  : Data Engineering and Data Shaping : Data Selection : Ordering rows 

library("data.table")

DT_ordered <- as.data.table(data)

# similar to base-R solution
order_index <- with(DT_ordered, order(x, y, decreasing = TRUE))
DT_ordered[order_index, ]

