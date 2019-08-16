# informalexample 5.35 of section 5.3.1 
# (informalexample 5.35 of section 5.3.1)  : Data engineering and data shaping : Aggregating transforms : Combining many rows into summary rows 

library("dplyr")

iris_dplyr <- iris %>% 
  group_by(., Species) %>% 
  mutate(.,
         mean_Petal.Length = mean(Petal.Length),
         mean_Petal.Width = mean(Petal.Width)) %>%
  ungroup(.)

# head(iris_dplyr)

