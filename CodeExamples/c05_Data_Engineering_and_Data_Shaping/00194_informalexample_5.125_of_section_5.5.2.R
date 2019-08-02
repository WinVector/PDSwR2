# informalexample 5.125 of section 5.5.2 
# (informalexample 5.125 of section 5.5.2)  : Data engineering and data shaping : Reshaping transforms : Moving data from tall to wide form 

library("tidyr")

ChickWeight_wide1 <- spread(ChickWeight, 
                            key = Time, 
                            value = weight)

head(ChickWeight_wide1)

