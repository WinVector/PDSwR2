# informalexample 5.39 of section 5.1.3 
# (informalexample 5.39 of section 5.1.3)  : Data Engineering and Data Shaping : Data Selection : Ordering rows 

# first sort the data
order_index <- with(data, order(x, y, decreasing = TRUE))
odata <- data[order_index, , drop = FALSE]
# now split into groups
data_list <- split(odata, -odata$x)
# apply the cumsum to each group
data_list <- lapply(
  data_list,
  function(di) {
    di$running_y_sum <- cumsum(di$y)
    di
  })
# put the results back to together
odata <- do.call(rbind, data_list)
rownames(odata) <- NULL

print(odata)

