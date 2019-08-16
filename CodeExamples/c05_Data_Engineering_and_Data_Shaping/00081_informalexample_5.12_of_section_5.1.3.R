# informalexample 5.12 of section 5.1.3 
# (informalexample 5.12 of section 5.1.3)  : Data engineering and data shaping : Data selection : Ordering rows 

purchases <- wrapr::build_frame(                 	# Note: 1 
   "day", "hour", "n_purchase" |
   1    , 9     , 5            |
   2    , 9     , 3            |
   2    , 11    , 5            |
   1    , 13    , 1            |
   2    , 13    , 3            |
   1    , 14    , 1            )

# Note 1: 
#   Use wrapr::build_frame to type data in directly in legible column order. 

