# informalexample 5.4 of section 5.1.1 
# (informalexample 5.4 of section 5.1.1)  : Data engineering and data shaping : Data selection : Sub-setting rows and columns 

ggplot(iris, 
       aes(x = Petal.Length, y = Petal.Width, 
           shape = Species, color = Species)) + 
  geom_point(size =2 ) + 
  ggtitle("Petal dimensions by iris species: all measurements")

