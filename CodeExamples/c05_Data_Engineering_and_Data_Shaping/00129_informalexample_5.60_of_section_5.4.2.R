# informalexample 5.60 of section 5.4.2 
# (informalexample 5.60 of section 5.4.2)  : Data engineering and data shaping : Multi-table data transforms : Principled methods to combine data from multiple tables 

trades <- data.table(
  trade_id = c(32525, 32526),
  price = c(5.5, 9),
  quantity = c(100, 200),
  when = as.POSIXct(strptime(
    c("2018-10-18 2:13:42", 
      "2018-10-18 2:19:20"), 
    "%Y-%m-%d %H:%M:%S")))

print(trades)

##    trade_id price quantity                when
## 1:    32525   5.5      100 2018-10-18 02:13:42
## 2:    32526   9.0      200 2018-10-18 02:19:20

