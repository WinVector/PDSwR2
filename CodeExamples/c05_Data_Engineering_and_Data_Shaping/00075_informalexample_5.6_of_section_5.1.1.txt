# informalexample 5.6 of section 5.1.1 
# (informalexample 5.6 of section 5.1.1)  : Data engineering and data shaping : Data selection : Sub-setting rows and columns 

library("dplyr")

iris_dplyr <- iris %>% 
  select(.,
         Petal.Length, Petal.Width, Species) %>%
  filter(.,
         Petal.Length > 2)

head(iris_dplyr)

##   Petal.Length Petal.Width    Species
## 1          4.7         1.4 versicolor
## 2          4.5         1.5 versicolor
## 3          4.9         1.5 versicolor
## 4          4.0         1.3 versicolor
## 5          4.6         1.5 versicolor
## 6          4.5         1.3 versicolor

