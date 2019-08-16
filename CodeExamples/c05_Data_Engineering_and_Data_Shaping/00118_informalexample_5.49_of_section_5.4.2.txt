# informalexample 5.49 of section 5.4.2 
# (informalexample 5.49 of section 5.4.2)  : Data engineering and data shaping : Multi-table data transforms : Principled methods to combine data from multiple tables 

merge(productTable, salesTable, by = "productID", all.x = TRUE)

##   productID price unitsSold
## 1        p1  9.99        10
## 2        p3 19.99        55
## 3        p4  5.49         8
## 4        p5 24.49        NA

