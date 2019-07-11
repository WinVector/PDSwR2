# informalexample 5.100 of section 5.4.2 
# (informalexample 5.100 of section 5.4.2)  : Data Engineering and Data Shaping : Multi-Table Data Transforms : Principled methods to combine data from multiple tables 

library("data.table")

productTable_data.table <- as.data.table(productTable)
salesTable_data.table <- as.data.table(salesTable)

merge(productTable_data.table, salesTable_data.table, 
      by = "productID", all = TRUE)

