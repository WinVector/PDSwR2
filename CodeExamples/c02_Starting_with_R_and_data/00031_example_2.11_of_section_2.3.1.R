# example 2.11 of section 2.3.1 
# (example 2.11 of section 2.3.1)  : Starting with R and data : Working with relational databases : A production-size example 
# Title: Plotting the data 

WVPlots::ScatterHist(
  dpus, "AGEP", "PINCP",
  "Expected income (PINCP) as function age (AGEP)",
  smoothmethod = "lm",
  point_alpha = 0.025)

