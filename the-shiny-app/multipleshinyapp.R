# trying to get multiple things on one page with fluid page?

# loading the packages in
library(shiny)
library(ggplot2)
library(DT)

# creating a ui with fluid page
# ui - controls layout? 
ui <- fluidPage(
  tabsetPanel(
    tabPanel("parkrun times", 
             h2("parkrun times"),
             DT::dataTableOutput("mytable")
    ),
    tabPanel("parkrun plots", 
             h2("visualising parkruns",
                renderPlot({
                  parkrun_times$sel <- selected()
                  ggplot(parkrun_times, aes(date, time)) + 
                    geom_point(aes(colour = sel)) +
                    theme_classic()+
                    scale_colour_discrete(limits = c("TRUE", "FALSE"))
                }, res = 96)
             ),
             plotOutput("plot", brush = "plot_brush", dblclick = "plot_reset")
             
             
             
             
    ),
    tabPanel("Number of parkruns",
             h2("comparing parkruns per person")),
    tabPanel("parkrun map",
             h2("visualising map points")),
  )
)

# creating a server to support the app 
server <- function(input, output, session) {

  # the server for the table function - seems to work 
  output$mytable <- DT::renderDataTable({
    DT::datatable(all_parkrun)
  })
  
  output$plot <- renderPlot({
    parkrun_times$sel <- input$my_table_rows_selected
    ggplot(parkrun_times, aes(date, time)) + 
      geom_point(aes(colour = sel)) +
      theme_classic()+
      scale_colour_discrete(limits = c("TRUE", "FALSE"))
  }, res = 96)
  }

  




shinyApp(ui, server)



