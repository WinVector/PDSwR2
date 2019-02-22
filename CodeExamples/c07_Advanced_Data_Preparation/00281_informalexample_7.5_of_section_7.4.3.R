# informalexample 7.5 of section 7.4.3 
# (informalexample 7.5 of section 7.4.3)  : Advanced Data Preparation : Building models using many variables : Evaluating the model 

WVPlots::ROCPlot(dTest_treated, "glm_pred", "churn", 1, 
                 "glm prediction on test, ROC plot")

WVPlots::DoubleDensityPlot(dTest_treated, "glm_pred", "churn", 
                           "glm prediction on test, double density plot")

WVPlots::GainCurvePlot(dTest_treated, "glm_pred", "churn", 
                       "glm prediction on test, gain plot",
                       truth_target = 1)

WVPlots::LiftCurvePlot(dTest_treated, "glm_pred", "churn", 
                       "glm prediction on test, lift plot",
                       truth_target = 1)

WVPlots::PRTPlot(dTest_treated, "glm_pred", "churn", 
                 "glm prediction on test, enrichment plot",
                 truthTarget = 1,
                 plotvars = c("enrichment", "recall"),
                 thresholdrange = c(0, 1.0))

