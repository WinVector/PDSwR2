# informalexample 5.13 of section 5.1.3 
# (informalexample 5.13 of section 5.1.3)  : Data engineering and data shaping : Data selection : Ordering rows 

order_index <- with(purchases, order(day, hour))                        	# Note: 1 
  
purchases_ordered <- purchases[order_index, , drop = FALSE]
purchases_ordered$running_total <- cumsum(purchases_ordered$n_purchase) 	# Note: 2 

purchases_ordered

##   day hour n_purchase running_total
## 1   1    9          5             5
## 4   1   13          1             6
## 6   1   14          1             7
## 2   2    9          3            10
## 3   2   11          5            15
## 5   2   13          3            18

# Note 1: 
#   with() executes the code in its second argument as if the columns of the first argument were 
#   variables. This lets us write “x” instead of “order$x”. 

# Note 2: 
#   Compute the running sum. 

