
library(DT)

ui <- basicPage(
  h2("parkrun_times"),
  DT::dataTableOutput("mytable")
)

server <- function(input, output) {
  output$mytable = DT::renderDataTable({
    parkrun_times
  })
}

shinyApp(ui, server)
