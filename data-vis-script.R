#setup
library(tidyverse)
penguins <- read.csv('data/penguins.csv')

head(penguins)
#species island bill_length_mm bill_depth_mm flipper_length_mm body_mass_g sex year

#filter
penguins_not2007 <- penguins %>% filter(year != 2007)

#only gentoo and chinstrap data
penguinsGnC <- penguins %>% filter(species %in% c("Gentoo", "Chinstrap"))

penguins %>% select(species, island, flipper_length_mm)

#combine
penguins %>%
  filter(year == 2007) %>% 
  select(species, island)


penguinsKg <- penguins %>% 
                mutate(body_mass_kg = body_mass_g / 1000)

penguinsTest <- penguins %>% 
  mutate(species_island = paste(species, island, sep = "-"))

penguins_summary <- penguins %>% 
  group_by(species) %>% 
  summarize(mean_bodymass = mean(body_mass_g, na.rm = TRUE),
            se = sd(body_mass_g, na.rm = TRUE)/ sqrt(n()))

penguins_summary %>%
  ggplot(
        aes(x = species, y = mean_bodymass)) +
        geom_col() + 
        geom_errorbar(aes(ymin = mean_bodymass - se, 
                          ymax = mean_bodymass +se), width = 0.4)

penguins %>% 
  ggplot(aes(x = species, y = body_mass_g)) +
      geom_violin() +
      geom_jitter(width = 0.2, alpha = 0.2)


      





        

  