# trying to get multiple things on one oage with fluid page?

library(shiny)

ui <- fluidPage(
  tabsetPanel(
    tabPanel("parkrun times", 
             h2("parkrun times"),
             DT::dataTableOutput("mytable")
    ),
    tabPanel("parkrun plots", 
            h2("visualising parkruns") ),
    tabPanel("Number of parkruns",
             h2("comparing parkruns per person"))
  )
)


shinyApp(ui, server)



ui <- basicPage(
  h2("parkrun times"),
  DT::dataTableOutput("mytable")
)

server <- function(input, output) {
  output$mytable = DT::renderDataTable({
    all_parkrun
  })
}

