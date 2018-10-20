# informalexample 5.130 of section 5.4.2 
# (informalexample 5.130 of section 5.4.2)  : Data Engineering and Data Shaping : Multi Table Data Transforms : Princpled methods to combine data from multiple tables 

# data.table also overrides merge()
merge(productTable, salesTable, by = "productID", all.x = TRUE)

