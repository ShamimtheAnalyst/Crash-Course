## Box Plot
library(tidyverse)

# One Numeric and One Categorical Variables

### Type - 1  # with drop_na(vore)
msleep %>% 
  drop_na(vore) %>% 
  ggplot(aes(vore, sleep_total)) +
  geom_boxplot() +
  coord_flip() +
  theme_bw()


### Type - 2 # without drop_na(vore)
msleep %>% 
  #drop_na(vore) %>% 
  ggplot(aes(vore, sleep_total)) +
  geom_boxplot() +
  coord_flip() +
  theme_bw()



### Type - 3 why vore goes to y-axis? (coord_flip)
msleep %>% 
  drop_na(vore) %>% 
  ggplot(aes(vore, sleep_total)) +
  geom_boxplot() +
  #coord_flip() +
  theme_bw()

# we highly recommend to use coord_flip() for boxplot

### Type - 4  # removing theme
msleep %>% 
  drop_na(vore) %>% 
  ggplot(aes(vore, sleep_total)) +
  geom_boxplot() 
  #coord_flip() +
  #theme_bw()


### Type - 5 use different geometry for same code

# Density plot

msleep %>% 
  drop_na(vore) %>% 
  ggplot(aes(sleep_total)) +
  geom_density() +
  #facet_wrap(~vore) +
  theme_bw() 

# density plot are actually representation of 
# probablity of the histogram itself
# y-axis represent probability between 0 to 1

# Histogram
msleep %>% 
  drop_na(vore) %>% 
  ggplot(aes(sleep_total)) +
  geom_histogram() +
  #facet_wrap(~vore) +
  theme_bw() 
