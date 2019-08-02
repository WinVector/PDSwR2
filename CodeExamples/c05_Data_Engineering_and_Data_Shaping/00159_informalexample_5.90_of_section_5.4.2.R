# informalexample 5.90 of section 5.4.2 
# (informalexample 5.90 of section 5.4.2)  : Data engineering and data shaping : Multi-table data transforms : Principled methods to combine data from multiple tables 

library("dplyr")

left_join(productTable, salesTable, by = "productID")

