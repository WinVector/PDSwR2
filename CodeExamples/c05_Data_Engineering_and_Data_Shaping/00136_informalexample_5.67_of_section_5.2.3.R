# informalexample 5.67 of section 5.2.3 
# (informalexample 5.67 of section 5.2.3)  : Data Engineering and Data Shaping : Basic Data Transforms : Parametric programming 

library("data.table")

d <- data.table(x = 1:2, y = 3:4, z= 5:6)
NEW_COL_NAME = "q"
ARG1_NAME = as.name("x")
ARG2_NAME = as.name("y")

d[ , c(NEW_COL_NAME) := eval(ARG1_NAME) + eval(ARG2_NAME)]

print(d)

