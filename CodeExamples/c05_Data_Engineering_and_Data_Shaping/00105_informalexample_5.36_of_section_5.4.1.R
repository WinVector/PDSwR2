# informalexample 5.36 of section 5.4.1 
# (informalexample 5.36 of section 5.4.1)  : Data engineering and data shaping : Multi-table data transforms : Combining two or more ordered data frames quickly 

productTable <- wrapr::build_frame(
   "productID", "price" |
   "p1"       , 9.99    |
   "p2"       , 16.29   |
   "p3"       , 19.99   |
   "p4"       , 5.49    |
   "p5"       , 24.49   )


salesTable <- wrapr::build_frame(
   "productID", "sold_store", "sold_online" |
   "p1"       , 6           , 64            |
   "p2"       , 31          , 1             |
   "p3"       , 30          , 23            |
   "p4"       , 31          , 67            |
   "p5"       , 43          , 51            )

productTable2 <- wrapr::build_frame(
   "productID", "price" |
   "n1"       , 25.49   |
   "n2"       , 33.99   |
   "n3"       , 17.99   )

productTable$productID <- factor(productTable$productID)
productTable2$productID <- factor(productTable2$productID)

