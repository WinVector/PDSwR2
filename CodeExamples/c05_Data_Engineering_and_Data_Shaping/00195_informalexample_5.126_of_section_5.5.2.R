# informalexample 5.126 of section 5.5.2 
# (informalexample 5.126 of section 5.5.2)  : Data Engineering and Data Shaping : Reshaping Transforms : Moving data from tall to wide form 

library("tidyr")

ChickWeight_wide1 <- spread(ChickWeight, 
                            key = Time, 
                            value = weight)

head(ChickWeight_wide1)

