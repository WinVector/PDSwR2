# example 10.3 of section 10.1.3 
# (example 10.3 of section 10.1.3)  : Exploring advanced methods : Tree-based methods : Using random forests to further improve prediction 
# Title: Using random forests 

library(randomForest)                                   	# Note: 1 
set.seed(5123512)                                     	# Note: 2 
fmodel <- randomForest(x = spamTrain[, spamVars],       	# Note: 3 
        y = spamTrain$spam,
        ntree = 100,                                   	# Note: 4 
        nodesize = 7,                                  	# Note: 5 
        importance = TRUE)                             	# Note: 6 
                    
pred <- predict(fmodel, 
                spamTrain[, spamVars], 
                type = 'prob')[, 'spam']
                
trainperf_rf <-  accuracyMeasures(predict(fmodel,      	# Note: 7 
   newdata = spamTrain[, spamVars], type = 'prob')[, 'spam'],
   spamTrain$spam == "spam", name = "random forest, train")

testperf_rf <-  accuracyMeasures(predict(fmodel,
   newdata = spamTest[, spamVars], type = 'prob')[, 'spam'],
   spamTest$spam == "spam", name = "random forest, test")
   
perftable <- rbind(trainperf_rf, testperf_rf)
pandoc.table(perftable, justify = perf_justify)

## 
## 
## model                    accuracy       f1   dev.norm
## ---------------------- ---------- -------- ----------
## random forest, train       0.9884   0.9852     0.1440
## random forest, test        0.9498   0.9341     0.3011

# Note 1: 
#   Load the randomForest package. 

# Note 2: 
#   Set the pseudo-random seed to a known value to try to make the random forest run 
#   repeatable. 

# Note 3: 
#   Call the randomForest() function to build the model 
#   with explanatory variables as x and the category to be predicted as 
#   y. 

# Note 4: 
#   Use 100 trees to be compatible with our bagging 
#   example. The default is 500 trees. 

# Note 5: 
#   Specify that each node of a tree must have a minimum of 7 elements to be compatible with the 
#   default minimum node size that rpart() uses on this training set. 

# Note 6: 
#   Tell the algorithm to save information to be used for 
#   calculating variable importance (we’ll see this later). 

# Note 7: 
#   Report the model quality. 

