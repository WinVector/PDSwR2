# informalexample 5.32 of section 5.1.3 
# (informalexample 5.32 of section 5.1.3)  : Data Engineering and Data Shaping : Data Selection : Ordering rows 

library("dplyr")

res <- purchases %>%
  arrange(., day, hour) %>%
  group_by(., day) %>%
  mutate(., running_total = cumsum(n_purchase)) %>%
  ungroup(.)

# print(res)

