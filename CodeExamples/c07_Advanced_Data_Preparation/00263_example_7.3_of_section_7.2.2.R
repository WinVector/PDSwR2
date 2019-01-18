# example 7.3 of section 7.2.2 
# (example 7.3 of section 7.2.2)  : Advanced Data Preparation : Building single-variable models : Using categorical features 
# Title: Tabulating churn grouped by variable 218 levels 

table218 <- table(
   Var218 = dTrain[,'Var218'], 
   churn = dTrain[,outcome], 
   useNA = 'ifany') 
print(table218)

##       churn
## Var218    -1     1
##   cJvF 19245  1220
##   UYBR 17860  1618
##   <NA>   423   152

