# informalexample 5.69 of section 5.4.1 
# (informalexample 5.69 of section 5.4.1)  : Data Engineering and Data Shaping : Multi-Table Data Transforms : Combining two or more ordered data.frames quickly 

library("data.table")

# convert to data.table
dt <- as.data.table(rbind_base)

# arbitrary user defined function
f <- function(.BY, .SD) {
  max(.SD$price)
}

# apply the function to each group
# and collect results
dt[ , max_price := f(.BY, .SD), by = table]

print(dt)

