# informalexample 5.74 of section 5.3.1 
# (informalexample 5.74 of section 5.3.1)  : Data Engineering and Data Shaping : Aggregating Transforms : Replacing missing values. 

library("wrapr")

data$reading <- data$sensor1 %?% data$sensor2 %?% data$sensor3 %?% 0.0

print(data)

