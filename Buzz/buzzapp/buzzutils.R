
library(randomForest)

loglikelihood <- function(y, py) {
  pysmooth <- ifelse(py == 0, 1e-12,
                     ifelse(py == 1, 1-1e-12, py))
  sum(y * log(pysmooth) + (1 - y) * log(1 - pysmooth))
}

# renderTable calls as.data.table() on the confusion matrix, which
# changes the layout of the confusion matrix.
# So here we manually turn it into a matrix (of the correct shape)
# and give it legible row and column names
reformatCM <- function(confusionMat) {
  confusionMat <- unclass(confusionMat) # now it's a matrix
  
  # fix the colnames and rownames to be more legible
  rownames(confusionMat) <- c("truth: FALSE", "truth: TRUE")
  colnames(confusionMat) <- c("pred: FALSE", "pred: TRUE")
  confusionMat
}

# return the model's performance measures
accuracyMeasures <- function(pred, truth, threshold=0.5) {
  
  # kludge to handle threshold boundaries
  if(threshold >= max(pred)) {
    threshold = max(pred) - 0.0001
  }
  if(threshold <= min(pred)) {
    threshold = min(pred) + 0.0001
  }
  
  ctable <- table(truth = truth,
                  pred = pred > threshold)

  accuracy <- sum(diag(ctable)) / sum(ctable)
  precision <- ctable[2, 2] / sum(ctable[, 2])
  recall <- ctable[2, 2] / sum(ctable[2, ])
  f1 <- 2 * precision * recall / (precision + recall)

  list(perfmetrics =  data.frame(accuracy = accuracy, 
                                 precision = precision,
                                 recall = recall,
                                 f1 = f1),
       confmat = reformatCM(ctable))
}
