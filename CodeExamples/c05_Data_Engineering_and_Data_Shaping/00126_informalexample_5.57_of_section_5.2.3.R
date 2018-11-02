# informalexample 5.57 of section 5.2.3 
# (informalexample 5.57 of section 5.2.3)  : Data Engineering and Data Shaping : Basic Data Transforms : Parametric programming 

data <- wrapr::build_frame(
   "x", "y" |
   1  , 1   |
   0  , 0   |
   1  , 0   |
   0  , 1   |
   0  , 0   |
   1  , 1   )

order_cols <- c("x", "y")
ordering <- wrapr::orderv(data[, order_cols, drop = FALSE])
data[ordering, , drop = FALSE]

