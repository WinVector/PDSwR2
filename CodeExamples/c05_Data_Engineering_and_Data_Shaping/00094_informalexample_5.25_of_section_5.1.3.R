# informalexample 5.25 of section 5.1.3 
# (informalexample 5.25 of section 5.1.3)  : Data Engineering and Data Shaping : Data Selection : Ordering rows 

data <- wrapr::build_frame( 	# Note: 1 
   "x", "y" |
   1  , 1   |
   0  , 0   |
   1  , 0   |
   0  , 1   |
   0  , 0   |
   1  , 1   )

# Note 1: 
#   Use wrapr::build_frame to type data in directly in legible column order. 

