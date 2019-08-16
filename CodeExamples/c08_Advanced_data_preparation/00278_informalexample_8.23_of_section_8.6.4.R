# informalexample 8.23 of section 8.6.4 
# (informalexample 8.23 of section 8.6.4)  : Advanced data preparation : Mastering the vtreat package : Impact coding 

d <- build_frame(
   "x1"    , "x2"         , "x3", "y" |
   1       , "a"          , 6   , 10  |
   NA_real_, "b"          , 7   , 20  |
   3       , NA_character_, 8   , 30  )

print(d)
#   x1   x2 x3  y
# 1  1    a  6 10
# 2 NA    b  7 20
# 3  3 <NA>  8 30
plan3 <- vtreat::designTreatmentsN(d, 
                                   varlist = c("x1", "x2", "x3"),
                                   outcomename = "y",
                                   codeRestriction = "catN",
                                   verbose = FALSE)
vtreat::prepare(plan3, d)
#   x2_catN  y
# 1     -10 10
# 2       0 20
# 3      10 30

