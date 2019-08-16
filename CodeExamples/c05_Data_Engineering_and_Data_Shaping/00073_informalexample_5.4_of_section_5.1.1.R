# informalexample 5.4 of section 5.1.1 
# (informalexample 5.4 of section 5.1.1)  : Data engineering and data shaping : Data selection : Sub-setting rows and columns 

library("data.table")

iris_data.table <- as.data.table(iris)                                	# Note: 1 

columns_we_want <- c("Petal.Length", "Petal.Width", "Species")
rows_we_want <- iris_data.table$Petal.Length > 2

iris_data.table <- iris_data.table[rows_we_want , ..columns_we_want]  	# Note: 2 

head(iris_data.table)

##    Petal.Length Petal.Width    Species
## 1:          4.7         1.4 versicolor
## 2:          4.5         1.5 versicolor
## 3:          4.9         1.5 versicolor
## 4:          4.0         1.3 versicolor
## 5:          4.6         1.5 versicolor
## 6:          4.5         1.3 versicolor

# Note 1: 
#   Convert to data.table class to get data.table semantics. 

# Note 2: 
#   The “..” notation tells data.table that “columns_we_want” isn’t itself the name of a column 
#   but a variable referring to names of columns. 

