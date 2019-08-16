# example 7.14 of section 7.2.3 
# (example 7.14 of section 7.2.3)  : Linear and logistic regression : Using logistic regression : Making predictions 
# Title: Evaluating the chosen model 

( ctab.test <- table(pred = test$pred > 0.02, atRisk = test$atRisk)  )    	# Note: 1  
##        atRisk
## pred    FALSE TRUE
##   FALSE  9487   93
##   TRUE   2405  116

( precision <- ctab.test[2,2] / sum(ctab.test[2,]) )
## [1] 0.04601349

( recall <- ctab.test[2,2] / sum(ctab.test[,2]) )
## [1] 0.5550239

( enrichment <- precision / mean(as.numeric(test$atRisk))  )
## [1] 2.664159

# Note 1: 
#   Build the confusion matrix. The rows contain predicted negatives and 
#   positives; columns contain actual negatives and 
#   positives 

