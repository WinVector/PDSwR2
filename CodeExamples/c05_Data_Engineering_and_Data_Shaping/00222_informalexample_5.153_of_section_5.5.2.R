# informalexample 5.153 of section 5.5.2 
# (informalexample 5.153 of section 5.5.2)  : Data Engineering and Data Shaping : Reshaping Transforms : Moving data from multiple rows to multiple columns. 

library(ggplot2)

ggplot(ChickWeight, aes(x=Time, y=weight, color=Chick)) + 
  geom_point() + geom_line() + 
  ggtitle("Chick Weight Measurements") +
  theme(legend.position="none") # too many chicks

