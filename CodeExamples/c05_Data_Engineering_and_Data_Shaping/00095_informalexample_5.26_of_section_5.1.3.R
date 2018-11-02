# informalexample 5.26 of section 5.1.3 
# (informalexample 5.26 of section 5.1.3)  : Data Engineering and Data Shaping : Data Selection : Ordering rows 

purchases <- wrapr::build_frame( 	# Note: 1 
   "day", "hour", "n_purchase" |
   1    , 9     , 5            |
   2    , 9     , 3            |
   2    , 11    , 5            |
   1    , 13    , 1            |
   2    , 13    , 3            |
   1    , 14    , 1            )

# Note 1: 
#   Use wrapr::build_frame to type data in directly in legible column order. 

