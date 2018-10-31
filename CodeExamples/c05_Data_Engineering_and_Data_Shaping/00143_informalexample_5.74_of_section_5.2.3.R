# informalexample 5.74 of section 5.2.3 
# (informalexample 5.74 of section 5.2.3)  : Data Engineering and Data Shaping : Basic Data Transforms : Parametric programming 

library("dplyr")
d <- data.frame(x = 1:2, y = 3:4)

COLUMN_WE_WANT <- "y"
d %>% select(., !!COLUMN_WE_WANT)

