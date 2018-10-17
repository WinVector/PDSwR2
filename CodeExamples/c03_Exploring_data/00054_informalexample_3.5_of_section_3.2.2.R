# informalexample 3.5 of section 3.2.2 
# (informalexample 3.5 of section 3.2.2)  : Exploring data : Spotting problems using graphics and visualization : Visually checking relationships between two variables 

ggplot(customer_data2, aes(x=age)) + 
  geom_density() + facet_wrap(~marital_status)

