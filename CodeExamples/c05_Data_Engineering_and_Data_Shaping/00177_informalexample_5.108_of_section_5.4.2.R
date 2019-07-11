# informalexample 5.108 of section 5.4.2 
# (informalexample 5.108 of section 5.4.2)  : Data Engineering and Data Shaping : Multi-Table Data Transforms : Principled methods to combine data from multiple tables 

trades[, trade_price := price]
quotes[, `:=`(bid_price = bid, ask_price = ask) ]
quotes[trades, on = .(bid <= price, ask >= price) ][
  , .(when, bid, ask, bid_price, trade_price, ask_price, trade_id) ]

##                   when bid ask bid_price trade_price ask_price trade_id
## 1: 2018-10-18 01:03:17 5.5 5.5         5         5.5         6    32525
## 2: 2018-10-18 02:12:23 5.5 5.5         5         5.5         6    32525
## 3: 2018-10-18 02:17:51 9.0 9.0         8         9.0        10    32526

