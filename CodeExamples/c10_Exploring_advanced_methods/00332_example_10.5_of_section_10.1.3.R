# example 10.5 of section 10.1.3 
# (example 10.5 of section 10.1.3)  : Exploring advanced methods : Tree-based methods : Using random forests to further improve prediction 
# Title: Fitting with fewer variables 

sorted <- sort(varImp[, "MeanDecreaseAccuracy"],       	# Note: 1 
               decreasing = TRUE)

selVars <- names(sorted)[1:30]
fsel <- randomForest(x = spamTrain[, selVars],             	# Note: 2 
                        y = spamTrain$spam, 
                        ntree = 100,
                        nodesize = 7,
                        importance = TRUE)
                           
trainperf_rf2 <- accuracyMeasures(predict(fsel,
   newdata = spamTrain[, selVars], type = 'prob')[, 'spam'],
   spamTrain$spam == "spam", name = "RF small, train")

testperf_rf2 <- accuracyMeasures(predict(fsel,
   newdata=spamTest[, selVars], type = 'prob')[, 'spam'],
   spamTest$spam == "spam", name = "RF small, test")

perftable <- rbind(testperf_rf, testperf_rf2)              	# Note: 3 
pandoc.table(perftable, justify = perf_justify)
##
##
## model                   accuracy       f1   dev.norm
## --------------------- ---------- -------- ----------
## random forest, test       0.9498   0.9341     0.3011
## RF small, test            0.9520   0.9368     0.4000

# Note 1: 
#   Sort the variables by their importance, as 
#   measured by accuracy change. 

# Note 2: 
#   Build a random forest model using only the 30 
#   most important variables. 

# Note 3: 
#   Compare the two random forest models on the test set. 

