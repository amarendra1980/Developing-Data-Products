# Coursera - Developing Data Products - Course Project 
# This is the ui.R file 
#
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Car Selection based on inputs"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
            helpText("Provide your inputs about the trip and car you want"),
            numericInput('dis', 'Distance (in miles):', 100, min = 1, max = 1000),
            numericInput('cost', 'Gasoline Price (per gallon):', 1.75, min = 1.50, max = 3.75, step=0.01),
            numericInput('gas', 'Maximum expenditure on gasoline:', 75, min=1, max=1000),
            checkboxGroupInput('cyl', 'Number of cylinders:', c("Four"=4, "Six"=6, "Eight"=8), selected = c(4,6,8)),
            sliderInput('hp', 'Gross horsepower', min=50, max=340, value=c(50,340), step=10),
            checkboxGroupInput('am', 'Transmission:', c("Automatic"=0, "Manual"=1), selected = c(0,1)),
            submitButton("Submit")
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      dataTableOutput('table')
    )
  )
))
