# informalexample 5.90 of section 5.4.2 
# (informalexample 5.90 of section 5.4.2)  : Data Engineering and Data Shaping : Multi-Table Data Transforms : Principled methods to combine data from multiple tables 

library("dplyr")

left_join(productTable, salesTable, by = "productID")

