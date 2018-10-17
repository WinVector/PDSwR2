# informalexample 5.35 of section 5.1.3 
# (informalexample 5.35 of section 5.1.3)  : Data Engineering and Data Shaping : Data Selection : Ordering rows 

library("dplyr")

data %>%
  arrange(., desc(x), desc(y))

