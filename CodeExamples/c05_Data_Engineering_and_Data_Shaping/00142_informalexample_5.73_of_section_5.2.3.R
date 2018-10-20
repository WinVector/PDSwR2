# informalexample 5.73 of section 5.2.3 
# (informalexample 5.73 of section 5.2.3)  : Data Engineering and Data Shaping : Basic Data Transforms : Parametric programming 

# this value may come to us from somewhere else
# or be very long and something we don't want
# to type over and over again.
columns_to_print <- c("x", "y") 

for(ci in columns_to_print) {
  print(ci)
  print(d[[ci]])
}

