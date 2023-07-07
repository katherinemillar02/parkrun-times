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


# trying to create a server function

parkrun_times_server <- function(input, output, session) {
  
output$mytable<- DT::renderDataTable({
  DT::datatable(all_parkrun)
})

}
  
parkrun_plots_server <- function(input, output, session) {
  selected_rows <- reactive ({
    req(input$mytable_rows_selected)
    data(input$mytable_rows_selected, ) 

  }) 


output$plot <- renderPlot({
  ggplot(all_parkrun, aes(date, time)) +
    geom_point() +
    geom_point(data = selected_rows(), aes(colour = "selected"), size = 3) +
    theme_classic() +
    scale_colour_manual(values = c("selected" = "blue", "other" = "black"))
}, res = 96)
}
  


server <- function(input, output, session) {
 allparkrun <- all_parkrun   

  

callModule(parkrun_times_server, "parkrun_times", data = allparkrun)
callModule(parkrun_times_server, "parkrun_plots", data = allparkrun)

}

shinyApp(ui, server)



