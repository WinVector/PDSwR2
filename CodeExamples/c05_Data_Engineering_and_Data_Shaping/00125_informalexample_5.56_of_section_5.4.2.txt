# informalexample 5.56 of section 5.4.2 
# (informalexample 5.56 of section 5.4.2)  : Data engineering and data shaping : Multi-table data transforms : Principled methods to combine data from multiple tables 

# note that merge orders the result by key column by default
# use sort=FALSE to skip the sorting
merge(productTable, salesTable, by = "productID", all=TRUE)

##   productID price unitsSold
## 1        p1  9.99        10
## 2        p2    NA        43
## 3        p3 19.99        55
## 4        p4  5.49         8
## 5        p5 24.49        NA

