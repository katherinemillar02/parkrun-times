# UI

library(plotly)
library(shiny)

# convert plotOutput to a Plotly Output
plotlyOutput("plot")
# Server

server < - function (input, output, session) {
# convert renderPlot to renderPlotly
output$plot <- renderPlotly({
  
  # create ggplot object
  p <- filtered_df() %>% 
    ggplot(aes(x = year, y = count, color = state)) +
    geom_line() +
    facet_wrap(vars(sex), nrow = 2, scales = "free_y")
  
  # wrap ggplot object with ggplotly
  ggplotly(p)
})}

# Run the application 
shinyApp(ui = ui, server = server)

