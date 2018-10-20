# informalexample 5.160 of section 5.4.2 
# (informalexample 5.160 of section 5.4.2)  : Data Engineering and Data Shaping : Multi Table Data Transforms : Princpled methods to combine data from multiple tables 

quotes[, quote_time := when]
quotes[trades, on = "when", roll = TRUE]

