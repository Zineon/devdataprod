library(shiny)
library(ggplot2)

function(input, output) {
  
  dataset <- reactive({
    diamonds[sample(nrow(quakes), input$sampleSize, replace = T),]
  })
  
  output$plot <- renderPlot({
    
    g <- ggplot(dataset(), aes_string(x=input$x, y=input$y)) + geom_point()
    
    if (input$color != 'None')
      g <- g + aes_string(color=input$color)
    
    facets <- paste(input$facet_row, '~', input$facet_col)
    if (facets != '. ~ .')
      g <- g + facet_grid(facets)
    
    print(g)
    
  }, height=500)
  
}