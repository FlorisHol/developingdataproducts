#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.


function(input, output, session) {
  
  selection <- reactive({
    cars[, c(input$xcol, input$ycol)]
  })
  
  clusters <- reactive({
    kmeans(selection(), input$clusters)
  })
  
  output$carsplot <- renderPlot({
    palette("default")
    
    par(mar = c(5.1, 4.1, 0, 1))
    plot(selection(),
         col = clusters()$cluster,
         pch = 16, cex = 3)
    points(clusters()$centers, pch = 8, cex = 3, lwd = 3)
  })
  
}