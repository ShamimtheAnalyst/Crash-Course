library(tidyverse)
library(ggplot2)

data()
?msleep
view(msleep)
names(msleep)

### Scatter Plot
# for two or more Numeric Variables

# Step - 1
msleep %>% 
  filter(bodywt < 2) %>% 
  ggplot(aes(bodywt, brainwt))


# Step - 2
msleep %>% 
  filter(bodywt < 2) %>% 
  ggplot(aes(bodywt, brainwt)) +
  geom_point() +
  labs(title = " Brain and Body Weight",
       x = "Body Weight",
       y = "Brain Weight") +
  theme_minimal()

# Step - 3
msleep %>% 
  filter(bodywt < 2) %>% 
  ggplot(aes(bodywt, brainwt)) +
  geom_point() +
  geom_smooth() +
  labs(title = " Brain and Body Weight",
       x = "Body Weight",
       y = "Brain Weight") +
  theme_minimal()


# Step - 4
msleep %>% 
  filter(bodywt < 2) %>% 
  ggplot(aes(bodywt, brainwt)) +
  geom_point(aes(color = sleep_total, size = awake)) +
  geom_smooth() +
  labs(title = " Brain and Body Weight",
       x = "Body Weight",
       y = "Brain Weight") +
  theme_minimal()


# Step - 5
msleep %>% 
  filter(bodywt < 2) %>% 
  ggplot(aes(bodywt, brainwt)) +
  geom_point(aes(color = sleep_total, size = awake)) +
  geom_smooth(method = lm, se = FALSE) +
  labs(title = " Brain and Body Weight",
       x = "Body Weight",
       y = "Brain Weight") +
  theme_minimal()


# Step - 6
msleep %>% 
#  filter(bodywt < 2) %>% 
  ggplot(aes(bodywt, brainwt)) +
  geom_point(aes(color = sleep_total, size = awake)) +
  geom_smooth(method = lm, se = FALSE) +
  labs(title = " Brain and Body Weight",
       x = "Body Weight",
       y = "Brain Weight") +
  theme_minimal()

# filter here for avoid skrewed data point
# we can also use log transformation