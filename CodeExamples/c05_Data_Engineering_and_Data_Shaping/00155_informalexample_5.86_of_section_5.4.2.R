# informalexample 5.86 of section 5.4.2 
# (informalexample 5.86 of section 5.4.2)  : Data Engineering and Data Shaping : Multi-Table Data Transforms : Principled methods to combine data from multiple tables 

# data.table also overrides merge()
merge(productTable, salesTable, by = "productID", all.x = TRUE)

