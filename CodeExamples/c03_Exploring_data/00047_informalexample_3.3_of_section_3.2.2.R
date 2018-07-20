# informalexample 3.3 of section 3.2.2 
# (informalexample 3.3 of section 3.2.2)  : Exploring data : Spotting problems using graphics and visualization : Visually checking relationships between two variables 

ggplot(customer_data_samp, aes(x=age, y=income)) + 
  geom_point() + geom_smooth() +
  ggtitle("Income as a function of age")

