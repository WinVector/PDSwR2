# informalexample 5.106 of section 5.4.2 
# (informalexample 5.106 of section 5.4.2)  : Data Engineering and Data Shaping : Multi-Table Data Transforms : Principled methods to combine data from multiple tables 

trades <- data.table(
  trade_id = c(32525, 32526),
  price = c(5.5, 9),
  quantity = c(100, 200),
  when = as.POSIXct(strptime(
    c("2018-10-18 2:13:42", 
      "2018-10-18 2:19:20"), 
    "%Y-%m-%d %H:%M:%S")))

print(trades)

