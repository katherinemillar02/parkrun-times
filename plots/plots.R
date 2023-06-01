

### ------------------- trying again 
library(shiny)


ui <- fluidPage(
  
  titlePanel("parkrun scatter"),
  
  sidebarLayout(
    sidebarPanel(
      sliderInput("VarX",
                  "select X:",
                  choices = list("date")), 
      sliderInput("VarY",
                  "select Y:",
                  choices = list("time")),    
    ),
    
    mainPanel(
      plotOutput("distPlot")
    )
  )
)

# define server 
shinyServer(function(input, output) {
  
  output$scatter <- renderPlot({
    
    prun <- parkrun_times[, c(input$VarX, input$VarY)]
 plot(prun[,1], prun[,2],
 xlab = colnames(prun) [1],
 ylab = colnames(prun) [2],
 main = paste("Plot of parkrun times",input$VarX, "Vs", input$VarY ),
 col = "violet", pch = 15)
      } )
})



library(tidyverse)



ui <- fluidPage(
  titlePanel("parkrun Plot"),
  sidebarLayout(
    sidebarPanel(
      
    ),
    mainPanel(
      plotOutput(outputId = "scatterplot")
    )
  )
)

server <- function(input, output) {
  output$scatterplot <- renderPlot({
    p = ggplot(data = read_excel("data/parkrun-times-2.xlsx")) +
      aes_string(x = input$x, y = input$y) +
      geom_point(x = date, y = time)
    plot(p)
    observeEvent(input$update, print(as.numeric(input$update)))
  })
}

shinyApp(ui, server) 


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




