# informalexample 5.11 of section 5.1.2 
# (informalexample 5.11 of section 5.1.2)  : Data engineering and data shaping : Data selection : Removing records with incomplete data 

library("dplyr")

clean_dplyr <- msleep %>% 
  filter(., complete.cases(.))

nrow(clean_dplyr)

## [1] 20

