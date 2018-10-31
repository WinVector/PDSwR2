# informalexample 5.87 of section 5.3.2 
# (informalexample 5.87 of section 5.3.2)  : Data Engineering and Data Shaping : Aggregating Transforms : Combining many rows into summary rows 

library("data.table")

iris_data.table <- as.data.table(iris)
iris_data.table <- iris_data.table[, 
                                   .(Petal.Length = mean(Petal.Length),
                                     Petal.Width = mean(Petal.Width)), 
                                   by = .(Species)]

iris_data.table

##       Species Petal.Length Petal.Width
## 1:     setosa        1.462       0.246
## 2: versicolor        4.260       1.326
## 3:  virginica        5.552       2.026

ggplot(mapping = aes(x=Petal.Length, y=Petal.Width, 
                     shape=Species, color=Species)) + 
  geom_point(data = iris, # raw data
             alpha = 0.5) + 
  geom_point(data = iris_data.table, # per-group summaries
             size = 5) +
  ggtitle("Average Petal dimensions by iris species\n(with raw data for reference)")

