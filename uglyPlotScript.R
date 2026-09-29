#setup
library(tidyverse)
library(ggbeeswarm)
penguins <- read.csv('data/penguins.csv')

uglyP <- penguins %>% 
  ggplot(aes(x = species, y = -log(body_mass_g/1000))) +
  geom_jitter(aes(size = sex, shape = island), width = 3, alpha = 0.8, colour = sample(rainbow(nrow(penguins)))) +
  labs(x = "",
       y = "-log bodymass",
       title = "PENGUINS") + 
  theme_minimal()

uglyP

ggsave('uglyplot.pdf', uglyP, 
       width = 8, 
       height = 8, 
       units = "cm")

