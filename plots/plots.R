

library(shiny)
library(tidyverse)

ui <- fluidPage(
  plotOutput("plot", brush = "plot_brush", dblclick = "plot_reset")
)
server <- function(input, output, session) {
  selected <- reactiveVal(rep(FALSE, nrow(parkrun_times)))
  
  observeEvent(input$plot_brush, {
    brushed <- brushedPoints(parkrun_times, input$plot_brush, allRows = TRUE)$selected_
    selected(brushed | selected())
  })
  observeEvent(input$plot_reset, {
    selected(rep(FALSE, nrow(mtcars)))
  })
  
  output$plot <- renderPlot({
    parkrun_times$sel <- selected()
    ggplot(parkrun_times, aes(date, time)) + 
      geom_point(aes(colour = sel)) +
      theme_classic()+
      scale_colour_discrete(limits = c("TRUE", "FALSE"))
  }, res = 96)
}



shinyApp(ui, server) 




