# informalexample 5.63 of section 5.4.1 
# (informalexample 5.63 of section 5.4.1)  : Data Engineering and Data Shaping : Multi-Table Data Transforms : Combining two or more ordered data.frames quickly 

library("dplyr")

bind_rows(list(productTable, 
               productTable2))

