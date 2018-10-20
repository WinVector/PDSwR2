# example 6.3 of section 6.2.1 
# (example 6.3 of section 6.2.1)  : Choosing and evaluating models : Evaluating models : Evaluating classification models 
# Title: Spam confusion matrix 

cM <- table(truth=spamTest$spam,prediction=spamTest$pred>0.5)
                                                print(cM)
                                                ##          prediction
                                                ## truth      FALSE TRUE
                                                ##   non-spam   264   14
                                                ##   spam        22  158

