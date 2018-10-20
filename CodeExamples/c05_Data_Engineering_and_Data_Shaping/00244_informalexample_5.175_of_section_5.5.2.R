# informalexample 5.175 of section 5.5.2 
# (informalexample 5.175 of section 5.5.2)  : Data Engineering and Data Shaping : Reshaping Transforms : Moving data from tall to wide form 

library("data.table")

ChickWeight_wide <- dcast.data.table(
  as.data.table(ChickWeight), 
  Chick ~ Time,
  value.var = "weight")

head(ChickWeight_wide)

