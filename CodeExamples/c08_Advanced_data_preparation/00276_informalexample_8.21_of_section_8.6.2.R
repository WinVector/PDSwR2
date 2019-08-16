# informalexample 8.21 of section 8.6.2 
# (informalexample 8.21 of section 8.6.2)  : Advanced data preparation : Mastering the vtreat package : Missing values 

plan1 <- vtreat::design_missingness_treatment(d)
vtreat::prepare(plan1, d) %.>%            	# Note: 1 
   knitr::kable(.)

# Note 1: 
#   Here we are using wrapr’s dot pipe instead of 
#   magrittr’s forward pipe. The dot pipe requires the 
#   “explicit dot argument” notation discussed in 
#   chapter 5. 

