
library(tidyverse)

data = dplyr::starwars
glimpse(data)

data%>%
  group_by(species)%>%
  summarise(n = n())%>%
  filter(!is.na(species)) %>%
  mutate(perc = n/sum(n)) %>%
  arrange(desc(perc)) %>%
  slice_head(n = 8) %>%
  mutate(species = forcats::fct_reorder(.f = species, .x = perc, .fun = mean, .desc = T)) %>%
  ggplot()+
    geom_col(aes(x= species, y =perc, fill = species))+
    labs(title = "Percentage of must frequent species in Starwars",
         y = 'Percentage', x = "")+
    theme(axis.text.x = element_blank()
    )
