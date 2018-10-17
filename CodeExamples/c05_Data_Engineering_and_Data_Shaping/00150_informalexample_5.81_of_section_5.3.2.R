# informalexample 5.81 of section 5.3.2 
# (informalexample 5.81 of section 5.3.2)  : Data Engineering and Data Shaping : Aggregating Transforms : Combining many rows into summary rows 

ggplot(mapping = aes(x=Petal.Length, y=Petal.Width, 
                     shape=Species, color=Species)) + 
  geom_point(data = iris, # raw data
             alpha = 0.5) + 
  geom_point(data = iris_data.table, # per-group summaries
             size = 5) +
  ggtitle("Average Petal dimensions by iris species\n(with raw data for reference)")

