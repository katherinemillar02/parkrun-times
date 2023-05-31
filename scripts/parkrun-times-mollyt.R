# reading the data in
parkrun_times_molly <- read_excel("parkrun_times_molly.xlsx", sheet = "Sheet1")

parkrun_molly_plotly_point <- plot_ly(data = parkrun_times_molly, x = ~date, y = ~time,
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
