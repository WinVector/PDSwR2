# example 7.13 of section 7.2.3 
# (example 7.13 of section 7.2.3)  : Linear and logistic regression : Using logistic regression : Making predictions 
# Title: Exploring modeling trade-offs 

library("WVPlots")
library("ggplot2")
plt <- PRTPlot(train, "pred", "atRisk", TRUE,    	# Note: 1 
        plotvars = c("enrichment", "recall"),
        thresholdrange = c(0,0.05),                                       
        title = "Enrichment/recall vs. threshold for natality model")  
plt + geom_vline(xintercept = 0.02, color="red", linetype = 2)   	# Note: 2

# Note 1: 
#   Call PRTPlot() where “pred” is the column 
#   of predictions, “atRisk” is the true outcome 
#   column, and TRUE is the class of interest. 

# Note 2: 
#   Add a line to mark threshold = 0.02. 

