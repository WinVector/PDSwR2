# informalexample 5.143 of section 5.4.2 
# (informalexample 5.143 of section 5.4.2)  : Data Engineering and Data Shaping : Multi Table Data Transforms : Principled methods to combine data from multiple tables 

trades[, trade_price := price]
quotes[, `:=`(bid_price = bid, ask_price = ask) ]
quotes[trades, on = .(bid <= price, ask >= price) ][
  , .(when, bid, ask, bid_price, trade_price, ask_price, trade_id) ]

