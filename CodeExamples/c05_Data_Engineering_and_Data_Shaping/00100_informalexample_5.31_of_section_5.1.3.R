# informalexample 5.31 of section 5.1.3 
# (informalexample 5.31 of section 5.1.3)  : Data Engineering and Data Shaping : Data Selection : Ordering rows 

# in-place solution
order_cols <- c("x", "y")
setorderv(data_data.table, order_cols, order = -1L)
data_data.table

