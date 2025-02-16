### ErrorBar
library(tidyverse)

data()
?ToothGrowth
view(ToothGrowth)
names(ToothGrowth)

# Theme setting for the visual

theme_set(theme_classic() +
            theme(panel.grid.major = element_blank()))

### Type - 1
ToothGrowth %>%
  filter(supp == "VC") %>% 
  mutate(dose = as.factor(dose)) %>% 
  group_by(dose) %>% 
  summarise(Mean_length = mean(len),
            Sd_length = sd(len)) 

### Type - 2

ToothGrowth %>%
  filter(supp == "VC") %>% 
  mutate(dose = as.factor(dose)) %>% 
  group_by(dose) %>% 
  summarise(Mean_length = mean(len),
            Sd_length = sd(len)) %>% 
  ggplot(aes(dose, Mean_length)) +
  geom_point(size = 10,
             colour = "orange") +
  geom_errorbar(aes(x = dose,
                    ymin = Mean_length - Sd_length,
                    ymax = Mean_length + Sd_length,
                    width = 0.05)) +
  labs(title = "Average Tooth Growth for VC",
       x = "dose",
       y = "Average Tooth Growth")

### Alternative

ToothGrowth %>% 
  filter(supp == "VC") %>% 
  mutate(dose = as.factor(dose)) %>% 
  group_by(dose) %>% 
  summarise(Mean_length = mean(len),
            Sd_length = sd(len)) %>% 
  ggplot(aes(dose, Mean_length)) +
  geom_bar(stat = "identity",
           fill = "#97B3C6",
           alpha = 0.7)+
  geom_errorbar(aes(x = dose,
                    ymin = Mean_length - Sd_length,
                    ymax = Mean_length + Sd_length,
                    width = 0.05))+
  labs(title = "Average Tooth Growth for VC",
       x = "dose",
       y = "Average Tooth Growth")  

