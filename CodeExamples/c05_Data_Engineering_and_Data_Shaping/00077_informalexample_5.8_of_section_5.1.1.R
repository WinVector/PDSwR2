# informalexample 5.8 of section 5.1.1 
# (informalexample 5.8 of section 5.1.1)  : Data Engineering and Data Shaping : Data Selection : Subsetting Rows and Columns 

library("data.table")

# convert to data.table class to 
# get data.table semantics
iris_data.table <- as.data.table(iris)

columns_we_want <- c("Petal.Length", "Petal.Width", "Species")
rows_we_want <- iris_data.table$Petal.Length > 2


iris_data.table <- iris_data.table[rows_we_want , ..columns_we_want]

head(iris_data.table)

