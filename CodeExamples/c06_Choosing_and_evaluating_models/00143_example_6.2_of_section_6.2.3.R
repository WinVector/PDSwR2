# example 6.2 of section 6.2.3 
# (example 6.2 of section 6.2.3)  : Choosing and evaluating models : Evaluating models : Evaluating classification models 
# Title: Spam classifications 

sample <- spamTest[c(7,35,224,327), c('spam','pred')]
print(sample)
##          spam         pred                       	# Note: 1 
## 115      spam 0.9903246227
## 361      spam 0.4800498077
## 2300 non-spam 0.0006846551
## 3428 non-spam 0.0001434345

# Note 1: 
#   The first column gives the predicted class 
#   label (spam or non-spam). The second column gives 
#   the predicted probability that an email is spam. 
#   If the probability > 0.5 the email is labeled 
#   “spam”; otherwise it is “non-spam”. 

