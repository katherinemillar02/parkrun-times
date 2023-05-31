# trying to get multiple things on one oage with fluid page?


ui <- fluidPage(
  tabsetPanel(
    tabPanel("parkrun times", 
             h2("parkrun times"),
             DT::dataTableOutput("mytable")
    ),
    tabPanel("Set parameters"),
    tabPanel("Visualise results")
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

