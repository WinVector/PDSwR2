# informalexample 5.156 of section 5.4.2 
# (informalexample 5.156 of section 5.4.2)  : Data Engineering and Data Shaping : Multi Table Data Transforms : Princpled methods to combine data from multiple tables 

library("data.table")

quotes <- data.table(bid = c(5, 5, 7, 8),
                     ask = c(6, 6, 8, 10),
                     bid_quantity = c(100, 100, 100, 100),
                     ask_quantity = c(100, 100, 100, 100),
                     when = c(1, 2, 5, 7))

print(quotes)

