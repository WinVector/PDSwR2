# informalexample 5.14 of section 5.1.3 
# (informalexample 5.14 of section 5.1.3)  : Data engineering and data shaping : Data selection : Ordering rows 

library("data.table")

DT_purchases <- as.data.table(purchases)

order_cols <- c("day", "hour")            	# Note: 1 
setorderv(DT_purchases, order_cols)

DT_purchases[ , running_total := cumsum(n_purchase)]

# print(DT_purchases)

# Note 1: 
#   Re-order data 

