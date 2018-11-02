# informalexample 5.64 of section 5.2.3 
# (informalexample 5.64 of section 5.2.3)  : Data Engineering and Data Shaping : Basic Data Transforms : Parametric programming 

library("dplyr")

d <- data.frame(x = 1:2, y = 3:4, z= 5:6)
NEW_COL_NAME = "q"
ARG1_NAME = as.name("x")
ARG2_NAME = as.name("y")

d %>%
  mutate(., !!NEW_COL_NAME := !!ARG1_NAME + !!ARG2_NAME)

