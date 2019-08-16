# informalexample 5.16 of section 5.1.3 
# (informalexample 5.16 of section 5.1.3)  : Data engineering and data shaping : Data selection : Ordering rows 

order_index <- with(purchases, order(day, hour))                	# Note: 1 
purchases_ordered <- purchases[order_index, , drop = FALSE]

data_list <- split(purchases_ordered, purchases_ordered$day)    	# Note: 2 

data_list <- lapply(                                            	# Note: 3 
  data_list,
  function(di) {
    di$running_total <- cumsum(di$n_purchase)
    di
  })

purchases_ordered <- do.call(base::rbind, data_list)            	# Note: 4 
rownames(purchases_ordered) <- NULL                             	# Note: 5 

purchases_ordered

##   day hour n_purchase running_total
## 1   1    9          5             5
## 2   1   13          1             6
## 3   1   14          1             7
## 4   2    9          3             3
## 5   2   11          5             8
## 6   2   13          3            11

# Note 1: 
#   First: sort the data. 

# Note 2: 
#   Now split data into a list of groups. 

# Note 3: 
#   Apply the cumsum to each group. 

# Note 4: 
#   Put the results back to together into a single data.frame. 

# Note 5: 
#   R often keeps annotations in the rownames(). In this case it is storing the original row 
#   numbers of the pieces we are assembling. This can confuse users when printing, so 
#   it is good practice to remove these annotations as we do here. 

