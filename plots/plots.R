

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

 




