# informalexample 8.6 of section 8.5.2 
# (informalexample 8.6 of section 8.5.2)  : Advanced Data Preparation : The vtreat package in general : Missing values 

d <- wrapr::build_frame(
   "x1"    , "x2"         , "x3", "y" |
   1       , "a"          , 6   , 10  |
   NA_real_, "b"          , 7   , 20  |
   3       , NA_character_, 8   , 30  )

print(d)
##   x1   x2 x3  y
## 1  1    a  6 10
## 2 NA    b  7 20
## 3  3 <NA>  8 30
plan1 <- vtreat::design_missingness_treatment(d)
vtreat::prepare(plan1, d)
##   x1 x1_isBAD        x2 x3  y
## 1  1        0         a  6 10
## 2  2        1         b  7 20
## 3  3        0 _invalid_  8 30

