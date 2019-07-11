# informalexample 5.79 of section 5.4.1 
# (informalexample 5.79 of section 5.4.1)  : Data Engineering and Data Shaping : Multi-Table Data Transforms : Combining two or more ordered data.frames quickly 

library("dplyr")

# list of data frames calling convention
dplyr::bind_cols(list(productTable, salesTable[, -1]))

