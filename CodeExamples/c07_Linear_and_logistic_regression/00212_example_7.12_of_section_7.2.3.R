# example 7.12 of section 7.2.3 
# (example 7.12 of section 7.2.3)  : Linear and logistic regression : Using logistic regression : Making predictions 
# Title: Plotting distribution of prediction score grouped by known outcome 

library(WVPlots)
DoubleDensityPlot(train, "pred", "atRisk", 
                  title = "Distribution of natality risk scores")

