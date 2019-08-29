# informalexample 5.43 of section 5.4.1 
# (informalexample 5.43 of section 5.4.1)  : Data engineering and data shaping : Multi-table data transforms : Combining two or more ordered data frames quickly 

library("data.table")

dt <- as.data.table(rbind_base)
grouping_column <- "table"
dt[ , max_price := max(price), by = eval(grouping_column)]

print(dt)

##    productID price         table max_price
## 1:        p1  9.99  productTable     24.49
## 2:        p2 16.29  productTable     24.49
## 3:        p3 19.99  productTable     24.49
## 4:        p4  5.49  productTable     24.49
## 5:        p5 24.49  productTable     24.49
## 6:        n1 25.49 productTable2     33.99
## 7:        n2 33.99 productTable2     33.99
## 8:        n3 17.99 productTable2     33.99

