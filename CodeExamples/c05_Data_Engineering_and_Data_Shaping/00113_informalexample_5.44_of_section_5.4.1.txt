# informalexample 5.44 of section 5.4.1 
# (informalexample 5.44 of section 5.4.1)  : Data engineering and data shaping : Multi-table data transforms : Combining two or more ordered data frames quickly 

rbind_base %>%
  group_by(., table) %>%
  mutate(., max_price = max(price)) %>%
  ungroup(.)

## # A tibble: 8 x 4
##   productID price table         max_price
##   <fct>     <dbl> <chr>             <dbl>
## 1 p1         9.99 productTable       24.5
## 2 p2        16.3  productTable       24.5
## 3 p3        20.0  productTable       24.5
## 4 p4         5.49 productTable       24.5
## 5 p5        24.5  productTable       24.5
## 6 n1        25.5  productTable2      34.0
## 7 n2        34.0  productTable2      34.0
## 8 n3        18.0  productTable2      34.0

