# informalexample 5.17 of section 5.1.3 
# (informalexample 5.17 of section 5.1.3)  : Data engineering and data shaping : Data selection : Ordering rows 

library("data.table")

# new copy for result solution
DT_purchases <- as.data.table(purchases)[order(day, hour), 
             .(hour = hour,
               n_purchase = n_purchase, 
               running_total = cumsum(n_purchase)),
             by = "day"]                      	# Note: 1 
# print(DT_purchases)                             	# Note: 2 

# in-place solution
DT_purchases <- as.data.table(purchases)
order_cols <- c("day", "hour")
setorderv(DT_purchases, order_cols)
DT_purchases[ , running_total := cumsum(n_purchase), by = day]
# print(DT_purchases)                              	# Note: 3 

# don't reorder the actual data variation!
DT_purchases <- as.data.table(purchases)
DT_purchases[order(day, hour), 
             `:=`(hour = hour,
               n_purchase = n_purchase, 
               running_total = cumsum(n_purchase)),
             by = "day"]
# print(DT_purchases)                               	# Note: 4

# Note 1: 
#   Adding the “by” keyword converts the calculation into a per-group calculation.. 

# Note 2: 
#   First solution: result is a second copy of the data .(=) notation. Only columns used in the 
#   calculation (such as “day”) and those explicitly assigned to are in the 
#   result. 

# Note 3: 
#   Second solution: result is computed in-place by ordering the table before the grouped 
#   calculation. 

# Note 4: 
#   Third solution: result is in same order as the original table, but the cumulative some is 
#   computed as if we sorted the table, computed the grouped 
#   running sum, and then returned the table to the original order. 

