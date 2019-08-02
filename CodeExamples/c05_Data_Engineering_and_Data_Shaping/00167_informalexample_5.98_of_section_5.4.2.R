# informalexample 5.98 of section 5.4.2 
# (informalexample 5.98 of section 5.4.2)  : Data engineering and data shaping : Multi-table data transforms : Principled methods to combine data from multiple tables 

# note that merge orders the result by key column by default
# use sort=FALSE to skip the sorting
merge(productTable, salesTable, by = "productID", all=TRUE)

