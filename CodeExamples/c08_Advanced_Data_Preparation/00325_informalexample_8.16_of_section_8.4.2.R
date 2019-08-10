# informalexample 8.16 of section 8.4.2 
# (informalexample 8.16 of section 8.4.2)  : Advanced data preparation : Advanced data preparation for classification : Building a model 

WVPlots::DoubleDensityPlot(dTest_treated, "glm_pred", "churn", 
                           "glm prediction on test, double density plot")

WVPlots::PRTPlot(dTest_treated, "glm_pred", "churn", 
                 "glm prediction on test, enrichment plot",
                 truthTarget = 1,
                 plotvars = c("enrichment", "recall"),
                 thresholdrange = c(0, 1.0))

