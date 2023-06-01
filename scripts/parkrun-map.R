ggplot() + 
  geom_polygon(data = worldmap, 
               aes(x = long, 
                   y = lat, 
                   group = group)) + 
  coord_fixed(ratio = 1.3, 
              xlim = c(-10,3), 
              ylim = c(50, 59))

library(maps)


worldmap = map_data('world')


parkrun_map_2 < - ggplot() + 
  geom_polygon(data = worldmap, 
               aes(x = long, y = lat, group = group), 
               fill = 'white', color = 'black') + 
  coord_fixed(ratio = 1.3, xlim = c(-10,3), ylim = c(50, 59)) + 
  theme_void() + 
  geom_point(data = parkrun_map, 
             aes(x = as.numeric(lng), 
                 y = as.numeric(lat),
                 size = n, color = log(n)), alpha = .9) + 
  scale_size_area(max_size = 10) + 
  scale_color_viridis_c() + 
  theme(legend.position = 'none') + 
  theme(title = element_text(size = 12))


parkrun_map <- read_excel("parkrun_map.xlsx", sheet = "Sheet1")
