# Coursera - Developing Data Products - Course Project 
# This is the ui.R file 
#
#

library(shiny)
library(datasets)
library(dplyr)

shinyServer(function(input, output) {
  
  output$table <- renderDataTable({
    hp_seq <- seq(from = input$hp[1], to = input$hp[2], by = 1)
    data <- transmute(mtcars, Car = rownames(mtcars), MilesPerGallon = mpg, 
                      GasolineExpenditure = input$dis/mpg*input$cost,
                      Cylinders = cyl, Horsepower = hp, 
                      Transmission = am)
    data <- filter(data, GasolineExpenditure <= input$gas, Cylinders %in% input$cyl, 
                   Transmission %in% input$am, Horsepower %in% hp_seq)
    data <- mutate(data, Transmission = ifelse(Transmission==0, "Automatic", "Manual"))
    data <- arrange(data, GasolineExpenditure)
    data
  })
})