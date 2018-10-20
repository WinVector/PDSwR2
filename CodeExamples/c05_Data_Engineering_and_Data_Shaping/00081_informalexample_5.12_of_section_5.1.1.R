# informalexample 5.12 of section 5.1.1 
# (informalexample 5.12 of section 5.1.1)  : Data Engineering and Data Shaping : Data Selection : Subsetting Rows and Columns 

library("dplyr")

iris_dplyr <- iris %>% 
  select(.,
         Petal.Length, Petal.Width, Species) %>%
  filter(.,
         Petal.Length > 2)

head(iris_dplyr)

