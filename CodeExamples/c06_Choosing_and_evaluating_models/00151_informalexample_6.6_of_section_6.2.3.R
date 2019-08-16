# informalexample 6.6 of section 6.2.3 
# (informalexample 6.6 of section 6.2.3)  : Choosing and evaluating models : Evaluating models : Evaluating classification models 

precision <- confmat_spam[2,2] / (confmat_spam[2,2]+ confmat_spam[1,2])
recall <- confmat_spam[2,2] / (confmat_spam[2,2] + confmat_spam[2,1])

(F1 <- 2 * precision * recall / (precision + recall) )
## [1] 0.8977273

