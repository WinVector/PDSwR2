# informalexample 5.18 of section 5.1.2 
# (informalexample 5.18 of section 5.1.2)  : Data Engineering and Data Shaping : Data Selection : Removing records with incomplete data 

clean_base_1 <- msleep[complete.cases(msleep), , drop = FALSE]

summary(clean_base_1)

