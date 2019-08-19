# example 7.32 of section 7.3.3 
# (example 7.32 of section 7.3.3)  : Linear and logistic regression : Regularization : Regularized regression with glmnet 
# Title: Finding the minimum error alpha 

get_cvm <- function(model) {                                  	# Note: 1 
  index <- match(model$lambda.1se, model$lambda)
  model$cvm[index]
}

enet_performance <- data.frame(alpha = elastic_net$alpha)     	# Note: 2 
models <- elastic_net$modlist                                 	# Note: 3 
enet_performance$cvm <- vapply(models, get_cvm, numeric(1))  	# Note: 4 
                       
minix <- which.min(enet_performance$cvm)                     	# Note: 5 
(best_alpha <- elastic_net$alpha[minix])                     	# Note: 6 
## [1] 0.729

ggplot(enet_performance, aes(x = alpha, y = cvm)) +          	# Note: 7 
  geom_point() + 
  geom_line() + 
  geom_vline(xintercept = best_alpha, color = "red", linetype = 2) + 
  ggtitle("CV loss as a function of alpha")

# Note 1: 
#   A function to get the mean cross-validation error of a cv.glmnet lambda.1se model. 

# Note 2: 
#   Get the alphas that the algorithm 
#   tried. 

# Note 3: 
#   Get the model objects produced. 

# Note 4: 
#   Get the errors of each best model. 

# Note 5: 
#   Find the minimum cross-validation error. 

# Note 6: 
#   Get the corresponding alpha. 

# Note 7: 
#   Plot the model performances as a function of alpha. 

