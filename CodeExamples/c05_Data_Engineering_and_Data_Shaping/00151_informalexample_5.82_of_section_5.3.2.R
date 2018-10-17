# informalexample 5.82 of section 5.3.2 
# (informalexample 5.82 of section 5.3.2)  : Data Engineering and Data Shaping : Aggregating Transforms : Combining many rows into summary rows 

library("dplyr")

iris %>% group_by(., Species) %>% 
  summarize(.,
            Petal.Length = mean(Petal.Length),
            Petal.Width = mean(Petal.Width)) %>%
  ungroup(.) -> iris.summary

iris.summary

