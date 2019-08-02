# informalexample 5.11 of section 5.1.1 
# (informalexample 5.11 of section 5.1.1)  : Data engineering and data shaping : Data selection : Sub-setting rows and columns 

library("dplyr")

iris_dplyr <- iris %>% 
  select(.,
         Petal.Length, Petal.Width, Species) %>%
  filter(.,
         Petal.Length > 2)

head(iris_dplyr)

