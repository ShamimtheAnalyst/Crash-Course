### Titles and Annotations


# Mapping text and labels

library(tidyverse)

best_in_class <- mpg %>%
  group_by(class) %>%
  filter(row_number(desc(hwy)) == 1)



ggplot(mpg, aes(displ, hwy)) +
  geom_point(aes(color = class), shape = "square") +
  geom_text(aes(label = model),
            data = best_in_class) +
  labs(x = "Engine size",
       y = "Highway fuel efficiency",
       color = "Class",
       title = "The most fuel efficient model in each class of car ") 




# Preventing overlap of labels

library(ggrepel)

ggplot(mpg, aes(displ, hwy)) +
  geom_point(aes(color = class), shape = "square") +
  geom_point(size = 5,
             shape = 1,
             data = best_in_class)+
  geom_label_repel(aes(label = model),
                   data = best_in_class) +
  labs(x = "Engine size",
       y = "Highway fuel efficiency",
       color = "Class",
       title = "The most fuel efficient model in each class of car")



# Using coloured labels instead of legends 

class_avg <- mpg %>%
  group_by(class) %>%
  summarise(displ = median(displ),
            hwy = median(hwy))


mpg %>%
  ggplot(aes(displ, hwy, color = class)) +
  geom_label_repel(aes(label = class),
                   data = class_avg,
                   size = 6,
                   label.size = 0,
                   segment.color = NA) +
  geom_jitter(size = 2,
              alpha = 0.3,
              shape = "square") +
  theme(legend.position = "none") +
  labs(x = "Engine size",
       y = "Highway fuel efficiency",
       title = "Median fuel efficiency for each class of car")


