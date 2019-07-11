# informalexample 5.88 of section 5.4.2 
# (informalexample 5.88 of section 5.4.2)  : Data Engineering and Data Shaping : Multi-Table Data Transforms : Principled methods to combine data from multiple tables 

library("data.table")

joined_table <- productTable
joined_table$unitsSold <- salesTable$unitsSold[match(joined_table$productID, 
                                                    salesTable$productID)]
print(joined_table)

