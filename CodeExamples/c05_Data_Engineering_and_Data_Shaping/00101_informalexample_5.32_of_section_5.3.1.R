# informalexample 5.32 of section 5.3.1 
# (informalexample 5.32 of section 5.3.1)  : Data engineering and data shaping : Aggregating transforms : Combining many rows into summary rows 

library("dplyr")

iris_summary <- iris %>% group_by(., Species) %>% 
  summarize(.,
            Petal.Length = mean(Petal.Length),
            Petal.Width = mean(Petal.Width)) %>%
  ungroup(.) 

# print(iris_summary)

