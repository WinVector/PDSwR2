# informalexample 5.16 of section 5.1.2 
# (informalexample 5.16 of section 5.1.2)  : Data engineering and data shaping : Data selection : Removing records with incomplete data 

clean_base_1 <- msleep[complete.cases(msleep), , drop = FALSE]

summary(clean_base_1)

