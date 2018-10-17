# informalexample 5.6 of section 5.1.1 
# (informalexample 5.6 of section 5.1.1)  : Data Engineering and Data Shaping : Data Selection : Subsetting Rows and Columns 

columns_we_want <- c("Petal.Length", "Petal.Width", "Species")
rows_we_want <- iris$Petal.Length > 2

iris_base <- iris[rows_we_want, columns_we_want, drop = FALSE]

head(iris_base)

