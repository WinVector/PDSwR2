# informalexample 5.65 of section 5.2.3 
# (informalexample 5.65 of section 5.2.3)  : Data Engineering and Data Shaping : Basic Data Transforms : Parametric programming 

data <- wrapr::build_frame(
   "x", "y" |
   1  , 1   |
   0  , 0   |
   1  , 0   |
   0  , 1   |
   0  , 0   |
   1  , 1   )

order_cols <- c("x", "y")
ordering <- do.call(order, 
                    c(as.list(data[, order_cols, drop = FALSE]), 
                      list(decreasing = TRUE)))
data[ordering, , drop = FALSE]

