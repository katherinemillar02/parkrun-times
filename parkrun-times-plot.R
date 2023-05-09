# reading appropriate packages in 
library(readxl)
library(tidyverse)
library(RColorBrewer)

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
  ggplot(aes(x = date, y = time, color = parkrun)) + 
  geom_point()+
  scale_color_manual(values = brewer.pal(n = 5, name = "Set1")) +
  scale_size_continuous(range = c(2, 10)) +
  labs(x = "Date", y = "Time", color = "parkrun", size = "Time") +
  theme_classic() + 
  theme(axis.text.x = element_text(angle = 45, hjust = 1))









