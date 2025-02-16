
### Line Graph


library(tidyverse)

# Two numeric and one Categorical variable

data()
?Orange
view(Orange)
names(Orange)

### Type - 1
Orange %>%
  filter(Tree != "2") %>%
  ggplot(aes(x = age,
             y = circumference)) +
  geom_point()


### Type - 2

Orange %>%
  filter(Tree != "2") %>%
  ggplot(aes(x = age,
             y = circumference)) +
  geom_point() +
  geom_smooth() +
  facet_wrap(~Tree) +
  theme_bw() +
  labs(title = "Circumference as a function of age")



### Type - 3

Orange %>%
  filter(Tree != "1" & 
           Tree != "2") %>%
  ggplot(aes(x = age,
             y = circumference,
             color = Tree)) +
  geom_point(size = 4, alpha = 0.3) +
  geom_line(size = 1) +
  labs(title = "Circumference as a function of age",
       x = "Age",
       y = "Circumference") +
  theme_minimal()
