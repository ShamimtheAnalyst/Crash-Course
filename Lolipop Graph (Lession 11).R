### Lolipop Graph
library(tidyverse)
library(forcats)

data()
?msleep
view(msleep)
names(msleep)

# Theme setting for the visual

theme_set(theme_bw() +
            theme(panel.grid.major = element_blank()))

### Type - 1

msleep %>% 
  group_by(order) %>% 
  summarise(mean_sleep = mean(sleep_total)) %>% 
  mutate(order = fct_reorder(order, mean_sleep))

### Type - 2

msleep %>% 
  group_by(order) %>% 
  summarise(mean_sleep = mean(sleep_total)) %>% 
  mutate(order = fct_reorder(order, mean_sleep)) %>%
  ggplot(aes(order, mean_sleep)) +
  geom_point(size = 4, color = "orange")


### Type - 3

msleep %>% 
  group_by(order) %>% 
  summarise(mean_sleep = mean(sleep_total)) %>% 
  mutate(order = fct_reorder(order, mean_sleep)) %>%
  ggplot(aes(order, mean_sleep)) +
  geom_point(size = 4, color = "orange") +
  geom_segment(aes(order, mean(msleep$sleep_total),
                   xend = order,
                   yend = mean_sleep,
                   color = "grey"))

### Type - 4

msleep %>% 
  group_by(order) %>% 
  summarise(mean_sleep = mean(sleep_total)) %>% 
  mutate(order = fct_reorder(order, mean_sleep)) %>%
  ggplot(aes(order, mean_sleep)) +
  geom_point(size = 4, color = "orange") +
  geom_segment(aes(order, mean(msleep$sleep_total),
                   xend = order,
                   yend = mean_sleep,
                   color = "grey")) +
  geom_hline(yintercept = mean(msleep$sleep_total),
             color = "grey",
             size = 1)

### Type - 5

msleep %>% 
  group_by(order) %>% 
  summarise(mean_sleep = mean(sleep_total)) %>% 
  mutate(order = fct_reorder(order, mean_sleep)) %>%
  ggplot(aes(order, mean_sleep)) +
  geom_point(size = 4, color = "orange") +
  geom_segment(aes(order, mean(msleep$sleep_total),
                   xend = order,
                   yend = mean_sleep,
                   color = "grey")) +
  geom_hline(yintercept = mean(msleep$sleep_total),
             color = "grey",
             size = 1) +
  theme(axis.text.x = element_text(angle = 90))


### Type - 6

msleep %>% 
  group_by(order) %>% 
  summarise(mean_sleep = mean(sleep_total)) %>% 
  mutate(order = fct_reorder(order, mean_sleep)) %>%
  ggplot(aes(order, mean_sleep)) +
  geom_point(size = 4, color = "orange") +
  geom_segment(aes(order, mean(msleep$sleep_total),
                   xend = order,
                   yend = mean_sleep,
                   color = "grey")) +
  geom_hline(yintercept = mean(msleep$sleep_total),
             color = "grey",
             size = 1) +
  theme(axis.text.x = element_text(angle = 90)) +
  labs(title = "Average Sleep time of Mammals by Order",
       x = "",
       y = "Hours") +
  theme(legend.position = "none")

  
?geom_segment



### Another Example

chickwts %>%
  group_by(feed) %>%
  mutate(mean_by_feed = mean(weight)) %>%
  ungroup() %>%
  mutate(feed = fct_reorder(feed, mean_by_feed)) %>%
  ggplot(aes(feed, weight, colour = feed,
             show.legend = F)) +
  coord_flip() +
  geom_jitter(show.legend = F,
              size = 4,
              alpha = 0.2,
              width = 0.05) +
  stat_summary(fun = mean, geom = "point", size = 8, show.legend = F) +
  geom_hline(aes(yintercept = mean(weight)),
             colour = "gray70",
             size = 0.9)+
  geom_segment(aes(x = feed, xend = feed,
                   y = mean(weight), yend = mean_by_feed),
               size = 2, show.legend = F) +
  labs(title = "Weight of chickens by feed group",
       x = "Feed",
       y = "Weight of chickens") +
  theme(legend.position = "none")
