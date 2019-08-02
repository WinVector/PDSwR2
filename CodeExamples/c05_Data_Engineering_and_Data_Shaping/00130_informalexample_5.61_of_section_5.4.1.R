# informalexample 5.61 of section 5.4.1 
# (informalexample 5.61 of section 5.4.1)  : Data engineering and data shaping : Multi-table data transforms : Combining two or more ordered data frames quickly 

library("data.table")

rbindlist(list(productTable, 
               productTable2))

