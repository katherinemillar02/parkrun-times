# reading appropriate packages in 
library(readxl)
library(tidyverse)
library(RColorBrewer)
library(plotly)

# reading the data in
parkrun_times <- read_excel("data/parkrunstats.xlsx", sheet = "Sheet1")


colours <- c("red", "blue")

# plotly plot
parkrun_plotly_point <- plot_ly(data = parkrun_times, x = ~date, y = ~time,
                                color = ~parkrun, colours = colours) %>%


  add_markers() %>%
  layout(xaxis = list(title = "Date"),
         yaxis = list(title = "Time (minutes.seconds)"),
         legend = list(title = "parkrun"),
         title = "parkrun times",
         hovermode = "closest",
         font = list(family = "Arial", size = 12),
         margin = list(l = 50, r = 50, b = 50, t = 50),
         plot_bgcolor = "white",
         paper_bgcolor = "white",
         legend_title_font = list(family = "Arial", size = 12),
         legend_font = list(family = "Arial", size = 12),
         legend_bgcolor = "white")












