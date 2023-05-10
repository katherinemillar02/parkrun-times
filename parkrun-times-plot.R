# reading appropriate packages in 
library(readxl)
library(tidyverse)
library(RColorBrewer)
library(plotly)

# reading the data in
parkrun_times <- read_excel("parkrun-times.xlsx", sheet = "Sheet1")



# code for line and point plot 
parkrun_plot_line <- parkrun_times %>% 
ggplot(aes(x = date, y = time, color = parkrun)) + 
  geom_point() +
  scale_color_manual(values = brewer.pal(n = 5, name = "Set1")) +
  geom_line() +
  scale_size_continuous(range = c(2, 10)) +
  labs(x = "Date", y = "Time", color = "parkrun", size = "Time") +
  theme_classic() + 
  theme(axis.text.x = element_text(angle = 45, hjust = 1))


# code for point plot 
parkrun_plot_point <- parkrun_times %>% 
  ggplot(aes(x = date, y = time, colour = parkrun)) + 
  geom_point()+
  scale_colour_manual(values = brewer.pal(n = 5, name = "Set1")) +
  scale_size_continuous(range = c(2, 10)) +
  labs(x = "Date", y = "Time", color = "parkrun", size = "Time") +
  theme_classic() + 
  theme(axis.text.x = element_text(angle = 45, hjust = 1))


# colours
colors <- brewer.pal(n = 5, name = "Set1")

# plotly plot
parkrun_plotly_point <- plot_ly(data = parkrun_times, x = ~date, y = ~time,
                              color = ~parkrun, colors = colors, size = ~time) %>%
  add_markers() %>%
  layout(xaxis = list(title = "Date"),
         yaxis = list(title = "Time"),
         legend = list(title = "parkrun"),
         title = "parkrun times",
         hovermode = "closest",
         font = list(family = "Arial", size = 12),
         margin = list(l = 50, r = 50, b = 50, t = 50),
         plot_bgcolor = "rgba(0,0,0,0)",
         paper_bgcolor = "rgba(0,0,0,0)",
         legend_title_font = list(family = "Arial", size = 12),
         legend_font = list(family = "Arial", size = 12),
         legend_bgcolor = "rgba(0,0,0,0)")









