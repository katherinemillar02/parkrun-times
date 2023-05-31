
library(DT)


# i believe this may be an output widget 
# how does one add an output widget to a shiny app
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
