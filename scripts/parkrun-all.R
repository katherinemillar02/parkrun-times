# reading appropriate packages in 
library(readxl)
library(tidyverse)
library(RColorBrewer)
library(plotly)


parkrun_times_jake <- read_excel("parkrun_jake.xlsx", sheet = "Sheet1")
all_parkrun <- read_excel("all_parkrun.xlsx", sheet = "Sheet1")

parkrun_plotly_point_jake <- plot_ly(data = parkrun_times_jake , x = ~date, y = ~time,
                                color = ~parkrun, colours = colours, size = ~time) %>%
  
  
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



parkrun_plotly_point_all <- plot_ly(data = all_parkrun , x = ~date, y = ~time,
                                     color = ~person, colours = colours, size = ~time) %>%
  
  
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



