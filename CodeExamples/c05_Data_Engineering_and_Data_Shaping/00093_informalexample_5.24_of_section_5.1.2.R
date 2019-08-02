# informalexample 5.24 of section 5.1.2 
# (informalexample 5.24 of section 5.1.2)  : Data engineering and data shaping : Data selection : Removing records with incomplete data 

library("dplyr")

clean_dplyr <- msleep %>% 
  filter(., complete.cases(.))

nrow(clean_dplyr)

