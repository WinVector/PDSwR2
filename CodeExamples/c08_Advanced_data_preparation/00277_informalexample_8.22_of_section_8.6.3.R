# informalexample 8.22 of section 8.6.3 
# (informalexample 8.22 of section 8.6.3)  : Advanced data preparation : Mastering the vtreat package : Indicator variables 

d <- build_frame(
   "x1"    , "x2"         , "x3", "y" |
   1       , "a"          , 6   , 10  |
   NA_real_, "b"          , 7   , 20  |
   3       , NA_character_, 8   , 30  )

print(d)
#   x1   x2 x3  y
# 1  1    a  6 10
# 2 NA    b  7 20                                                 	# Note: 1 
# 3  3 <NA>  8 30
plan2 <- vtreat::designTreatmentsZ(d, 
                                   varlist = c("x1", "x2", "x3"),
                                   verbose = FALSE)
vtreat::prepare(plan2, d)
#   x1 x1_isBAD x3 x2_lev_NA x2_lev_x_a x2_lev_x_b
# 1  1        0  6         0          1          0
# 2  2        1  7         0          0          1                  	# Note: 2 
# 3  3        0  8         1          0          0

# Note 1: 
#   The second value of x2 is “b” 

# Note 2: 
#   In the second row of the treated data, x2_lev_x_b = 1 

