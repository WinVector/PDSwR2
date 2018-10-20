# informalexample 5.41 of section 5.1.3 
# (informalexample 5.41 of section 5.1.3)  : Data Engineering and Data Shaping : Data Selection : Ordering rows 

library("data.table")

DT_ordered <- as.data.table(data)

DT_ordered[order(-x, -y), running_y_sum := cumsum(y), by = "x"]

print(DT_ordered[])

