# informalexample 5.22 of section 5.1.2 
# (informalexample 5.22 of section 5.1.2)  : Data Engineering and Data Shaping : Data Selection : Removing records with incomplete data 

library("data.table")

msleep_data.table <- as.data.table(msleep)

clean_data.table = msleep_data.table[complete.cases(msleep_data.table), ]

nrow(clean_data.table)

