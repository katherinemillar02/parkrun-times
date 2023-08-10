df <- data.frame(level = c("a", "b", "c", 'd'), outcome = c(2.3, 1.9, 3.2, 1))

ggplot(df) +
  geom_col_pattern(
    aes(level, outcome, pattern_fill = level), 
    pattern = 'stripe',
    fill    = 'white',
    colour  = 'black'
  ) +
  theme_bw(18) +
  theme(legend.position = 'none') + 
  labs(
    title    = "ggpattern::geom_col_pattern()",
    subtitle = "pattern = 'stripe'"
  ) +
  coord_fixed(ratio = 1/2)

install.packages("remotes")

library(remotes)
library(ggpattern)
