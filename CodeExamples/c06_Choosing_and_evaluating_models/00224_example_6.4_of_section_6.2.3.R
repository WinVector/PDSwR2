# example 6.4 of section 6.2.3 
# (example 6.4 of section 6.2.3)  : Choosing and evaluating models : Evaluating models : Evaluating classification models 
# Title: Entering the Akismet confusion matrix by hand 

confmat_akismet <- as.table(matrix(data=c(288-1,17,1,13882-17),nrow=2,ncol=2))
rownames(confmat_akismet) <- rownames(confmat_spam)
colnames(confmat_akismet) <- colnames(confmat_spam)
print(confmat_akismet)
##       non-spam  spam
## non-spam   287     1
## spam        17 13865

