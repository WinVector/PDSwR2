# informalexample 5.67 of section 5.4.1 
# (informalexample 5.67 of section 5.4.1)  : Data Engineering and Data Shaping : Multi-Table Data Transforms : Combining two or more ordered data.frames quickly 

# split them apart
tables <- split(rbind_base, rbind_base$table)
tables

