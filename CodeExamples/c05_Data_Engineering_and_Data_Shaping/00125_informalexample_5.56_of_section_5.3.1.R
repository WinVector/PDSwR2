# informalexample 5.56 of section 5.3.1 
# (informalexample 5.56 of section 5.3.1)  : Data Engineering and Data Shaping : Aggregating Transforms : Combining many rows into summary rows 

library("dplyr")

iris_dplyr <- iris %>% 
  group_by(., Species) %>% 
  mutate(.,
         mean_Petal.Length = mean(Petal.Length),
         mean_Petal.Width = mean(Petal.Width)) %>%
  ungroup(.)

# head(iris_dplyr)

