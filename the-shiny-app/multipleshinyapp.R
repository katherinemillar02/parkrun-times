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


server <- function(input, output, session) {
  
  # Render the data table
  output$mytable <- DT::renderDataTable({
    # Replace `your_data` with the actual data you want to display
    DT::datatable(your_data)
  })
}
  




shinyApp(ui, server)



