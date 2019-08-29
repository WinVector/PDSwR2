# informalexample 5.39 of section 5.4.1 
# (informalexample 5.39 of section 5.4.1)  : Data engineering and data shaping : Multi-table data transforms : Combining two or more ordered data frames quickly 

library("data.table")

rbindlist(list(productTable, 
               productTable2))

##    productID price
## 1:        p1  9.99
## 2:        p2 16.29
## 3:        p3 19.99
## 4:        p4  5.49
## 5:        p5 24.49
## 6:        n1 25.49
## 7:        n2 33.99
## 8:        n3 17.99

