# informalexample 5.45 of section 5.4.1 
# (informalexample 5.45 of section 5.4.1)  : Data engineering and data shaping : Multi-table data transforms : Combining two or more ordered data frames quickly 

cbind(productTable, salesTable[, -1])

##   productID price sold_store sold_online
## 1        p1  9.99          6          64
## 2        p2 16.29         31           1
## 3        p3 19.99         30          23
## 4        p4  5.49         31          67
## 5        p5 24.49         43          51

