library(readxl)

parkrun_times <- read_excel("parkrun-times.xlsx", sheet = "Sheet1")

library(ggplot2)

ggplot(parkrun_times, aes(x = date, y = time, color = parkrun)) + 
  geom_point() +
  scale_size_continuous(range = c(2, 10)) +
  labs(x = "Date", y = "Time", color = "parkrun", size = "Time") +
  theme_classic()
