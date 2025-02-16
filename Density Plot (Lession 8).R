# Density plot
library(tidyverse)

# One Numeric and One Categorical Variable



### Type - 1  #  drop_na(vore)

msleep %>% 
  drop_na(vore) %>% 
  ggplot(aes(sleep_total)) +
  geom_density() +
  #facet_wrap(~vore) +
  theme_bw() 

# density plot are actually representation of 
# probablity of the histogram itself
# y-axis represent probability between 0 to 1

### Type - 2  # fill = vore

msleep %>% 
  drop_na(vore) %>%
  ggplot(aes(sleep_total, fill = vore)) +
  geom_density(alpha = 0.4) +
  theme_bw() 




### Type - 3  # color = vore

msleep %>% 
  drop_na(vore) %>%
  ggplot(aes(sleep_total, color = vore)) +
  geom_density(alpha = 0.4) +
  theme_bw() 


### Type - 4  # filter and alpha = 0.4  # | means or

msleep %>% 
  drop_na(vore) %>%
  filter(vore == "herbi" | vore == "carni") %>%
  ggplot(aes(sleep_total, fill = vore)) +
  geom_density(alpha = 0.4) + 
  theme_bw() 



### Type - 5 # Highly recommended filtering function

msleep %>% 
  drop_na(vore) %>%
  filter(vore %in% c("herbi", "carni")) %>%
  ggplot(aes(sleep_total, fill = vore)) +
  geom_density(alpha = 0.4) + 
  theme_bw() 


# %in% is useful when you've more than two category




## Advanced Density Plot
df <- gapminder %>% 
  select(continent, lifeExp) %>% 
  filter(continent %in% c("Africa", "Europe"))
view(df)


library(plyr)
mu <- ddply(df, "continent", summarise, grp.mean=mean(lifeExp))
head(mu)

# Change density plot line colors by groups
df %>% 
  ggplot(aes(lifeExp, color = continent)) +
  geom_density()

# Add mean lines
p <- df %>% 
  ggplot(aes(lifeExp, color = continent)) +
  geom_density() +
  geom_vline(data = mu, aes(xintercept = grp.mean, 
                            color = continent),
             linetype = "dashed") +
  labs(title = "Life Expectancy in Africa and Europe",
       x = "Life Expectancy",
       y = "Probability")
p






# Density plot with mean lines and marginal rug
install.packages("ggpubr")
library(ggpubr)


# Create some data format
set.seed(1234)
men = data.frame(
  sex = factor(rep(c("F", "M"), each=200)),
  weight = c(rnorm(200, 55), rnorm(200, 58)))
head(men, 4)


# Density plot with mean lines and marginal rug
# Change outline and fill colors by groups ("sex")
# Use custom palette
ggdensity(men, x = "weight",
          add = "mean", rug = TRUE,
          color = "sex", fill = "sex",
          palette = c("#00AFBB", "#E7B800"))











