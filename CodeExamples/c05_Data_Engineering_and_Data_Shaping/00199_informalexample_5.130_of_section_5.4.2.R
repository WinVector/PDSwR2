# informalexample 5.130 of section 5.4.2 
# (informalexample 5.130 of section 5.4.2)  : Data Engineering and Data Shaping : Multi Table Data Transforms : Princpled methods to combine data from multiple tables 

# note that merge orders the result by key column by default
# use sort=FALSE to skip the sorting
merge(productTable, salesTable, by = "productID", all=TRUE)

