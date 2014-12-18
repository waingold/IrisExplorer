library(shiny)
library(ggplot2)

shinyServer(function(input, output) {
    output$scatterPlot <- renderPlot({
        qplot(iris[,input$var1], iris[,input$var2], data = iris, size = iris[,input$outVar], color = Species) +
            labs(x = input$var1, y = input$var2, size = input$outVar)
    })
    output$linearModel <- renderPrint({
        summary(lm(reformulate(c(input$var1, input$var2), input$outVar), data = iris))
    })
    output$dataTable <- renderDataTable({iris})
})