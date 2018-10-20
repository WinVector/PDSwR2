# informalexample 5.43 of section 5.1.3 
# (informalexample 5.43 of section 5.1.3)  : Data Engineering and Data Shaping : Data Selection : Ordering rows 

order_cols <- c("x", "y")
setorderv(DT_ordered, order_cols, order = -1L)

DT_ordered

