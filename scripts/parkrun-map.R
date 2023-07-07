
# the code for a map plot
ggplot() +
  geom_polygon(data = worldmap, 
               aes(x = long, 
                   y = lat, 
                   group = group)) + 
  coord_fixed(ratio = 1.3, 
              xlim = c(-10,3), 
              ylim = c(50, 59))

# library(maps) will provide dfferent maps for different regions 
library(maps)


worldmap = map_data('world')

library(tidyverse)


parkrun_map_2 <- ggplot() + 
  geom_polygon(data = worldmap, 
               aes(x = long, y = lat, group = group))
map_plot <- ggplot() + 
  geom_polygon(data = parkrun_map , 
               aes(x = lng, y = lat), 
               fill = 'white', color = 'black') + 
  coord_fixed(ratio = 1.3, xlim = c(-10,3), ylim = c(50, 59)) + 
  theme_void() + 
  geom_point(data = parkrun_map, 
             aes(x = as.numeric(lng), 
                 y = as.numeric(lat),
                 size = n, color = red), alpha = .9) + 
  scale_size_area(max_size = 10) + 
  scale_color_viridis_c() + 
  theme(legend.position = 'none') + 
  theme(title = element_text(size = 12))

library(readxl)

parkrun_map <- read_excel("data/parkrun_map.xlsx", sheet = "Sheet1")
