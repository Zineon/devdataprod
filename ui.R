library(shiny)
library(ggplot2)

dataset <- diamonds

shinyUI(pageWithSidebar(
  
  headerPanel("Diamonds Explorer"),
  
  sidebarPanel(
    
    sliderInput('sampleSize', 'Sample Size', min=1, max=nrow(dataset),
                value=min(1000, nrow(dataset)), step=500, round=0),
    
    selectInput('x', 'X', names(dataset)),
    selectInput('y', 'Y', names(dataset), names(dataset)[[2]]),
    selectInput('color', 'Color', c('None', names(dataset))),
    
    selectInput('facet_v', 'Vertical Facet', c(None='.', names(dataset))),
    selectInput('facet_h', 'Horizontal Facet', c(None='.', names(dataset)))
  ),
  
  mainPanel(
    plotOutput('plot')
  )
))