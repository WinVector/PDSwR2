# informalexample 5.41 of section 5.4.1 
# (informalexample 5.41 of section 5.4.1)  : Data engineering and data shaping : Multi-table data transforms : Combining two or more ordered data frames quickly 

# add an extra column telling us which table
# each row comes from
productTable_marked <- productTable
productTable_marked$table <- "productTable"
productTable2_marked <- productTable2
productTable2_marked$table <- "productTable2"

# combine the tables
rbind_base <- rbind(productTable_marked, 
                    productTable2_marked)
rbind_base

##   productID price         table
## 1        p1  9.99  productTable
## 2        p2 16.29  productTable
## 3        p3 19.99  productTable
## 4        p4  5.49  productTable
## 5        p5 24.49  productTable
## 6        n1 25.49 productTable2
## 7        n2 33.99 productTable2
## 8        n3 17.99 productTable2

# split them apart
tables <- split(rbind_base, rbind_base$table)
tables

## $productTable
##   productID price        table
## 1        p1  9.99 productTable
## 2        p2 16.29 productTable
## 3        p3 19.99 productTable
## 4        p4  5.49 productTable
## 5        p5 24.49 productTable
## 
## $productTable2
##   productID price         table
## 6        n1 25.49 productTable2
## 7        n2 33.99 productTable2
## 8        n3 17.99 productTable2

