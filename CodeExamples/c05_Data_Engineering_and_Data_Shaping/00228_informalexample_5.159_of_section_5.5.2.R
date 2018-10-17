# informalexample 5.159 of section 5.5.2 
# (informalexample 5.159 of section 5.5.2)  : Data Engineering and Data Shaping : Reshaping Transforms : Moving data from multiple rows to multiple columns. 

library("tidyr")

ChickWeight_wide3 <- spread(ChickWeight, 
                            key = Time, 
                            value = weight)

