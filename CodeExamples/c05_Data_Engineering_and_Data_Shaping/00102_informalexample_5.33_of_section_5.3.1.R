# informalexample 5.33 of section 5.3.1 
# (informalexample 5.33 of section 5.3.1)  : Data engineering and data shaping : Aggregating transforms : Combining many rows into summary rows 

iris_copy <- iris
iris_copy$mean_Petal.Length <- ave(iris$Petal.Length, iris$Species, FUN = mean)
iris_copy$mean_Petal.Width <- ave(iris$Petal.Width, iris$Species, FUN = mean)

# head(iris_copy)
# tail(iris_copy)

