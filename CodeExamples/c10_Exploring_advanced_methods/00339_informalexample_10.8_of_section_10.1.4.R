# informalexample 10.8 of section 10.1.4 
# (informalexample 10.8 of section 10.1.4)  : Exploring advanced methods : Tree-based methods : Gradient-boosted trees 

model <- xgboost(data = dtm_train, label = labels,
                  params = list(
                    objective = "binary:logistic"
                  ),
                  nrounds = NROUNDS,
                  verbose = FALSE)

pred = predict(model, dtm_train)  
trainperf_xgb =  accuracyMeasures(pred, labels, "training")  

c(test_texts, test_labels) %<-% readRDS("IMDBtest.RDS")    	# Note: 1 
dtm_test = make_matrix(test_texts, vocab) 

pred = predict(model, dtm_test)
testperf_xgb = accuracyMeasures(pred, test_labels, "test")

perftable <- rbind(trainperf_xgb, testperf_xgb)
pandoc.table(perftable, justify = perf_justify)   
## 
## 
## model        accuracy       f1   dev.norm
## ---------- ---------- -------- ----------
## training       0.9891   0.9891     0.1723
## test           0.8725   0.8735     0.5955

# Note 1: 
#   Load the test data and convert it to a document-term matrix. 

