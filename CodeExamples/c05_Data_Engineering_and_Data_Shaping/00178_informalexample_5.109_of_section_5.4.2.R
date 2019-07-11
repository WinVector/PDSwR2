# informalexample 5.109 of section 5.4.2 
# (informalexample 5.109 of section 5.4.2)  : Data Engineering and Data Shaping : Multi-Table Data Transforms : Principled methods to combine data from multiple tables 

quotes[ , quote_time := when ]
trades[, trade_time := when]
quotes[ trades, on = "when", roll = TRUE ][
  , .(quote_time, bid_price, trade_price, ask_price, trade_id, trade_time) ]

