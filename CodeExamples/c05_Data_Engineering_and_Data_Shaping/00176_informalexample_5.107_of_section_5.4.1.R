# informalexample 5.107 of section 5.4.1 
# (informalexample 5.107 of section 5.4.1)  : Data Engineering and Data Shaping : Multi Table Data Transforms : Combining two or more ordered data.frames quickly 

library("dplyr")

# pass in a list of data frames. This works with more than two data frames, as well
bind_rows(list(productTable, 
               productTable2))

