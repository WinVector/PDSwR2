# informalexample 5.178 of section 5.5.2 
# (informalexample 5.178 of section 5.5.2)  : Data Engineering and Data Shaping : Reshaping Transforms : Moving data from tall to wide form 

library("tidyr")

ChickWeight_wide3 <- spread(ChickWeight, 
                            key = Time, 
                            value = weight)

