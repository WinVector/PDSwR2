# informalexample 5.39 of section 5.1.3 
# (informalexample 5.39 of section 5.1.3)  : Data Engineering and Data Shaping : Data Selection : Ordering rows 

library("data.table")

data_data.table <- as.data.table(data)

# sort data
setorderv(data_data.table, c("x", "y"), order = -1L)
# apply operation in each x-defined group
data_data.table[ , running_y_sum := cumsum(y), by = "x"]

data_data.table

