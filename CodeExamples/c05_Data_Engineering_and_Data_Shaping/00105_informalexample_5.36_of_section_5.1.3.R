# informalexample 5.36 of section 5.1.3 
# (informalexample 5.36 of section 5.1.3)  : Data Engineering and Data Shaping : Data Selection : Ordering rows 

order_index <- with(data, order(x, y, decreasing = TRUE)) 	# Note: 1 
odata <- data[order_index, , drop = FALSE]

data_list <- split(odata, -odata$x) 	# Note: 2 
        
data_list <- lapply( 	# Note: 3 
  data_list,
  function(di) {
    di$running_y_sum <- cumsum(di$y)
    di
  })

odata <- do.call(rbind, data_list) 	# Note: 4 
        
rownames(odata) <- NULL 	# Note: 5 

print(odata)

##   x y running_y_sum
## 1 1 1             1
## 2 1 1             2
## 3 1 0             2
## 4 0 1             1
## 5 0 0             1
## 6 0 0             1

# Note 1: 
#   First: sort the data. 

# Note 2: 
#   Now split data into a list of groups. 

# Note 3: 
#   Apply the cumsum to each group. 

# Note 4: 
#   Put the results back to together into a single data.frame. 

# Note 5: 
#   R often keeps annotations in the rownames(). In this case it is storing original row-numbers of the pieces we are assembling. This can confuse users in when printing, so it is good practice to remove these annotations as we do here. 

