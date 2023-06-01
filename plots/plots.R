# creating an interactive parkrun plot for a shiny app 

library(plotly)

plotlyOutput("plot")

output$plot <- renderPlotly({
  ggplotly(parkrun_plotly_point)
})


# trying a code out 
# website community plotly

library(shiny)
library(plotly)

ui <- fluidPage(
  headerPanel('Example'),
  sidebarPanel(
    selectInput('xcol','X Variable', names(parkrun_times)),
    selectInput('ycol','Y Variable', names(parkrun_times)),
    selected = names(parkrun_times)[[2]]),
  mainPanel(
    plotlyOutput('plot')
  )
)

server <- function(input, output) {
  
  x <- reactive({
    parkrun_times[,input$xcol]
  })
  
  y <- reactive({
    parkrun_times[,input$ycol]
  })
  
  
  output$plot <- renderPlotly(
    plot1 <- plot_ly(
      x = x(),
      y = y(), 
      type = 'scatter',
      mode = 'markers')
  )
  
}

shinyApp(ui,server)
