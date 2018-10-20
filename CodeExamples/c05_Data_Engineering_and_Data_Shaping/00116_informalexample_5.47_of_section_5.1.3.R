# informalexample 5.47 of section 5.1.3 
# (informalexample 5.47 of section 5.1.3)  : Data Engineering and Data Shaping : Data Selection : Ordering rows 

library("dplyr")

data %>%
  arrange(., desc(x), desc(y)) %>%
  group_by(., x) %>%
  mutate(., running_y_sum = cumsum(y)) %>%
  ungroup(.)

