# informalexample 5.15 of section 5.1.3 
# (informalexample 5.15 of section 5.1.3)  : Data engineering and data shaping : Data selection : Ordering rows 

library("dplyr")

res <- purchases %>%
  arrange(., day, hour) %>%
  mutate(., running_total = cumsum(n_purchase))
  
# print(res)

