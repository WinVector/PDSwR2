# informalexample 5.29 of section 5.1.3 
# (informalexample 5.29 of section 5.1.3)  : Data Engineering and Data Shaping : Data Selection : Ordering rows 

library("dplyr")

res <- purchases %>%
  arrange(., day, hour) %>%
  mutate(., running_total = cumsum(n_purchase))
  
# print(res)

