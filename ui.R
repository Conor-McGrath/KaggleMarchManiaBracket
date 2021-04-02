library(shiny)
library(sortable)
library(shinydashboard)
library(shinythemes)
# Define UI for application that draws a histogram
shinyUI(fluidPage(navbarPage("Kaggle March Mania Bracket", id = "myNavbarPage", theme = shinytheme("yeti"),
                             
                             # Application title
                             tabPanel("Submit Predictions",
                                      tags$head(tags$style(HTML('
   textArea {
     background-color: #517fb9 !important;
     color: #ffffff !important;
     border: none;
     text-align: center;
     font-weight: bold;
   }'))),
                                      fileInput("csv", "Choose CSV File", accept = ".csv"),
                                      checkboxInput("header", "Header", TRUE)
                              
                                      ),
                             tabPanel("Bracket", includeHTML("www/index2.html"))
                             
))
)

