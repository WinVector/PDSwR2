# informalexample 5.10 of section 5.1.2 
# (informalexample 5.10 of section 5.1.2)  : Data engineering and data shaping : Data selection : Removing records with incomplete data 

library("data.table")

msleep_data.table <- as.data.table(msleep)

clean_data.table = msleep_data.table[complete.cases(msleep_data.table), ]

nrow(clean_data.table)

## [1] 20

