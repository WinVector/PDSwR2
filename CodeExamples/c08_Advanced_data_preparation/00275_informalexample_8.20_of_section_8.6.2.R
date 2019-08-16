# informalexample 8.20 of section 8.6.2 
# (informalexample 8.20 of section 8.6.2)  : Advanced data preparation : Mastering the vtreat package : Missing values 

library("wrapr")                       	# Note: 1 

d <- build_frame(
   "x1"    , "x2"         , "x3", "y" |
   1       , "a"          , 6   , 10  |
   NA_real_, "b"          , 7   , 20  |
   3       , NA_character_, 8   , 30  )

knitr::kable(d)

# Note 1: 
#   Bring in the wrapr package for build_frame and the 
#   wrapr “dot pipe”. 

