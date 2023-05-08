# reading appropriate packages in 
library(readxl)
library(tidyverse)

# reading the data in
parkrun_times <- read_excel("parkrun-times.xlsx", sheet = "Sheet1")



# code for point plot 
parkrun_plot <- parkrun_times %>% 
ggplot(aes(x = date, y = time, color = parkrun)) + 
  geom_point() +
  scale_size_continuous(range = c(2, 10)) +
  labs(x = "Date", y = "Time", color = "parkrun", size = "Time") +
  theme_classic()




