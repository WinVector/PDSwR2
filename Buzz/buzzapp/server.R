#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(zeallot)

source("buzzutils.R")

#
# Initialize app
#

# read in the varslist, model, and test data set
c(varslist, fmodel, buzztest) %<-% readRDS("../thRS500.RDS")
predictions <- predict(fmodel, newdata = buzztest, type="prob")[,2, drop=TRUE]
  
#
#  server
#  
shinyServer(function(input, output) {
  
 perflist <- reactive(accuracyMeasures(predictions,
                                       buzztest$buzz,
                                       threshold = input$threshold)
                       )

  output$label = renderText(paste("Threshold:", input$threshold))
  output$confusionMatrix = renderTable(perflist()$confmat,
                                       digits=0,  # because these are counts, not real-valued numbers
                                       rownames=TRUE,
                                       bordered=TRUE)
  output$performanceTable = renderTable(perflist()$perfmetrics)


})



