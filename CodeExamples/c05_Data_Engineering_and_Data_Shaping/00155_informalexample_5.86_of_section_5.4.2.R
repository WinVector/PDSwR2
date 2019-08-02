# informalexample 5.86 of section 5.4.2 
# (informalexample 5.86 of section 5.4.2)  : Data engineering and data shaping : Multi-table data transforms : Principled methods to combine data from multiple tables 

# data.table also overrides merge()
merge(productTable, salesTable, by = "productID", all.x = TRUE)

