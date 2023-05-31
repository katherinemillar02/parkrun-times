
library(DT)

ui <- basicPage(
  h2("parkrun times"),
  DT::dataTableOutput("mytable")
)

server <- function(input, output) {
  output$mytable = DT::renderDataTable({
    all_parkrun
  })
}

shinyApp(ui, server)
