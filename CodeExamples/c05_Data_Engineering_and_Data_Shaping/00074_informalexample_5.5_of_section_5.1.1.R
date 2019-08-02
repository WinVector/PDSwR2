# informalexample 5.5 of section 5.1.1 
# (informalexample 5.5 of section 5.1.1)  : Data engineering and data shaping : Data selection : Sub-setting rows and columns 

columns_we_want <- c("Petal.Length", "Petal.Width", "Species")
rows_we_want <- iris$Petal.Length > 2

# before
head(iris)

