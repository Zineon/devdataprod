library(shiny)
library(ggplot2)

shinyServer(function(input, output) {
  
  dataset <- reactive({
    diamonds[sample(nrow(diamonds), input$sampleSize),]
  })
  
  output$plot <- renderPlot({
    
    p <- ggplot(dataset(), aes_string(x=input$x, y=input$y)) + geom_point()
    
    if (input$color != 'None')
      p <- p + aes_string(color=input$color)
    
    facets <- paste(input$facet_v, '~', input$facet_h)
    if (facets != '. ~ .')
      p <- p + facet_grid(facets)
    
    print(p)
    
  }, height = 600)
  
})