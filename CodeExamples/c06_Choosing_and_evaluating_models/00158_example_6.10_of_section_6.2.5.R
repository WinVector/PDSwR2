# example 6.10 of section 6.2.5 
# (example 6.10 of section 6.2.5)  : Choosing and evaluating models : Evaluating models : Evaluating probability models 
# Title: Plotting the receiver operating characteristic curve 

library(WVPlots)
ROCPlot(spamTest,                                       	# Note: 1 
        xvar = 'pred', 
        truthVar = 'spam', 
        truthTarget = 'spam', 
        title = 'Spam filter test performance')

library(sigr)
calcAUC(spamTest$pred, spamTest$spam=='spam')       	# Note: 2 
## [1] 0.9660072

# Note 1: 
#   Plot the receiver operating characteristic (ROC) curve. 

# Note 2: 
#   Calculate the area under the ROC curve explicitly. 

