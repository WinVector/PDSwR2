# informalexample 5.31 of section 5.3.1 
# (informalexample 5.31 of section 5.3.1)  : Data engineering and data shaping : Aggregating transforms : Combining many rows into summary rows 

library("data.table")

iris_data.table <- as.data.table(iris)
iris_data.table <- iris_data.table[, 
                                   .(Petal.Length = mean(Petal.Length),
                                     Petal.Width = mean(Petal.Width)), 
                                   by = .(Species)]

# print(iris_data.table)

