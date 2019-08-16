# informalexample 5.30 of section 5.3.1 
# (informalexample 5.30 of section 5.3.1)  : Data engineering and data shaping : Aggregating transforms : Combining many rows into summary rows 

iris_summary <- aggregate(
  cbind(Petal.Length, Petal.Width) ~ Species, 
  data = iris, 
  FUN = mean)

print(iris_summary)

#      Species Petal.Length Petal.Width
# 1     setosa        1.462       0.246
# 2 versicolor        4.260       1.326
# 3  virginica        5.552       2.026

library(ggplot2)
ggplot(mapping = aes(x = Petal.Length, y = Petal.Width, 
                     shape = Species, color = Species)) + 
  geom_point(data = iris, # raw data
             alpha = 0.5) + 
  geom_point(data = iris_summary, # per-group summaries
             size = 5) +
  ggtitle("Average Petal dimensions by iris species\n(with raw data for reference)")

