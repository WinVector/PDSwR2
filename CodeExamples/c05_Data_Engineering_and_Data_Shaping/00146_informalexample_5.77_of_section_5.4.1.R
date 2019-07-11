# informalexample 5.77 of section 5.4.1 
# (informalexample 5.77 of section 5.4.1)  : Data Engineering and Data Shaping : Multi-Table Data Transforms : Combining two or more ordered data.frames quickly 

library("data.table")

cbind(as.data.table(productTable), 
      as.data.table(salesTable[, -1]))

