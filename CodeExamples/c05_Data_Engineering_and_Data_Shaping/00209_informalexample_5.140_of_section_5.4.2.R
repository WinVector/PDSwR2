# informalexample 5.140 of section 5.4.2 
# (informalexample 5.140 of section 5.4.2)  : Data Engineering and Data Shaping : Multi Table Data Transforms : Princpled methods to combine data from multiple tables 

library("dplyr")

inner_join(productTable, salesTable, by="productID")

