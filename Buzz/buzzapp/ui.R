#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinythemes) # to get fancy themes

# Define UI for application 
shinyUI(fluidPage(
  
  theme = shinytheme("simplex"),
  # Application title
  titlePanel("Threshold Explorer"),
  
  # Sidebar with a slider input for threshold
  sidebarLayout(
    sidebarPanel(
       sliderInput("threshold",
                   "Threshold:",
                   min = 0,
                   max = 1,
                   value = 0.5),
       # this is actually an output
       h4(textOutput("label", container = span))
    ),
    
    # Show performance metrics as a function of threshold
    mainPanel(
       h4("Confusion Matrix"),
       tableOutput("confusionMatrix"),
  #     h4("Accuracy Measures"),
       tableOutput("performanceTable")
    )
  )
))
