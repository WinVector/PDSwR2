# informalexample 5.57 of section 5.4.2 
# (informalexample 5.57 of section 5.4.2)  : Data engineering and data shaping : Multi-table data transforms : Principled methods to combine data from multiple tables 

library("data.table")

productTable_data.table <- as.data.table(productTable)
salesTable_data.table <- as.data.table(salesTable)

merge(productTable_data.table, salesTable_data.table, 
      by = "productID", all = TRUE)

##    productID price unitsSold
## 1:        p1  9.99        10
## 2:        p2    NA        43
## 3:        p3 19.99        55
## 4:        p4  5.49         8
## 5:        p5 24.49        NA

