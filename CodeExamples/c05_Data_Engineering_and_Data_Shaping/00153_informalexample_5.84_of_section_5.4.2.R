# informalexample 5.84 of section 5.4.2 
# (informalexample 5.84 of section 5.4.2)  : Data Engineering and Data Shaping : Multi-Table Data Transforms : Principled methods to combine data from multiple tables 

library("data.table")

productTable_data.table <- as.data.table(productTable)
salesTable_data.table <- as.data.table(salesTable)

# index notation for join
# idea is rows are produced for each row inside the []
salesTable_data.table[productTable_data.table, on = "productID"]

