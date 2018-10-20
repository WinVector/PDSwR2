# informalexample 5.26 of section 5.1.2 
# (informalexample 5.26 of section 5.1.2)  : Data Engineering and Data Shaping : Data Selection : Removing records with incomplete data 

library("dplyr")

clean_dplyr <- msleep %>% 
  filter(., complete.cases(.))

nrow(clean_dplyr)

