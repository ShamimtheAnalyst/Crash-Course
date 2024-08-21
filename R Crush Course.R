
# R Studio
#############################
# The four Quardrents
    # Shift + Ctrl + 1 Zoom Source
    # Shift + Ctrl + 2 Back to Normal
    # Shift + Ctrl + 3 Zoom Help
    # Shift + Ctrl + 4 Zoom History
    # Shift + Ctrl + 5 Zoom Files
    # Shift + Ctrl + 6 Zoom Plots
    # Shift + Ctrl + 7 Zoom Packags
    # Shift + Ctrl + 8 Zoom Environment
    # Shift + Ctrl + 9 Zoom Viewer

    # Ctrl + Enter  Run Code

# How to get help when you need help
?mean
?ChickWeight  
?aov

# Objects and Functions
5 + 6

x <- 5
y <- 6

x + y

sum(x, y)

ages <- c(5, 6)
ages
sum(ages)

names <- c("Rahim", "Karim")

friends <- data.frame("names", "ages")

View(friends)
str(friends)  # str stands for structure

friends$ages

sum(friends$ages)

sum(friends$names)

friends[1, 1]
friends[1, ]
friends[ , 1]


## Build in Data sets to practice with
data()
View(starwars)

# Installing and Using Packages
install.packages("tidyverse")
library(tidyverse)
require(tidyverse)

# This is called %>% pipe operator (Shift + Ctrl + M)


starwars %>% 
  filter(height > 150 & mass < 200) %>% 
  mutate(height_in_meter = height/100) %>% 
  select(height_in_meter, mass) %>% 
  arrange(mass) %>%     # sorting Ascending order
#  arrange(-mass) %>%     # sorting descending order
#  view()
 plot()


###########################
# Explore your Data

# Data Structure and Types of Variables

view(msleep)
str(msleep)      # gives you data structure
glimpse(msleep)  # gives you variables names, data types and types of variables
head(msleep)     # gives you 1st 6 rows of your data-set
tail(msleep)     # gives you last 6 rows of your data-set
class(msleep)    # gives you types of variable
length(msleep)   # gives you number of variables
length(msleep$name)  # gives you how many observations in that particular variables
names(msleep)    # gives you all columns names
unique(msleep$genus) # gives you unique names of that in that column
dim(msleep)  # gives you dimension of your data (Rows & Columns)

No_missing <- complete.cases(msleep)
missing <- !complete.cases(msleep)

msleep[missing, ]  # gives you which rows contains missing data




###########################
# Clean your Data

# Select Variables

starwars %>% 
  select(name, height, mass) %>% 
# select(1:3)
  View()

# Select specific columns using "ends_with
starwars %>% 
  select(ends_with("Color")) %>% 
  View()


# Changing Variable order

starwars %>% 
  select(name, height, mass, everything())

# Changing Variable names

starwars %>% 
  rename("charaters" = "name") %>% 
  head()

# Changing a variable type

class(starwars$hair_color)

starwars$hair_color <- as.factor(starwars$hair_color)
class(starwars$hair_color)

# Restore variable types
starwars %>% 
mutate(starwars$hair_color <- as.character(starwars$hair_color)) %>% 
  glimpse()

# Changing Factor Levels
df <- starwars
  df$sex <- as.factor(df$sex)

levels(df$sex)

# Changing Factor Levels
df <- df %>% 
  mutate(sex = factor(sex, 
                      levels = c("male", "female", "hermaphroditic", "none")))


levels(df$sex)


# Filter rows
starwars %>% 
  select(mass, sex) %>% 
  filter(mass < 55, sex == "male") ## == means exact male we needed

# Recode Data
# male <- man, female <- woman

starwars %>% 
  select(sex) %>% 
  mutate(sex = recode(sex, "male" = "man",
                      "female" = "woman"))



# Dealing with Missing Data

mean(starwars$height)  # gives you "NA" if there any missing data

mean(starwars$height, na.rm = TRUE) # na means not available, rm = remove


# Dealing with Duplicates

names <- c("Karim", "Rahim", "Babul", "Mizan", "Karim")
age <- c(40, 42, 33, 37, 40)

Brothers <- data.frame(names, age)
Brothers


Brothers %>% 
  distinct()


distinct(Brothers)



###########################
# Manipulate your Dataset

# Create or change a variables (mutate)

starwars %>% 
  mutate(height_in_meter = height/100) %>% 
  select(name,height, height_in_meter, mass)


# Conditional Change (if_else)

starwars %>% 
  mutate(height_in_meter = height/100) %>% 
  select(name,height, height_in_meter, mass) %>% 
  mutate(tallness = if_else(height_in_meter < 1, "short", 
                            "tall"))



# Reshape data with pivot wider

library(gapminder)
View(gapminder)

data <- select(gapminder, country, year, lifeExp)

view(data)

wide_data <- data %>% 
  pivot_wider(names_from = "year", values_from = "lifeExp")

view(wide_data)



# Reshape data with pivot longer

long_data <- wide_data %>% 
  pivot_longer(2:13, names_to = "year", values_to = "lifeExp")

view(long_data)






###########################
# Describe your Data

# Statistics

View(msleep)

# Range / Spread
min(msleep$awake)
max(msleep$awake)
range(msleep$awake)
IQR(msleep$awake)


# Centrality
mean(msleep$awake)
median(msleep$awake)

# Variance
var(msleep$awake)

# Summary
summary(msleep$awake)


msleep %>% 
  select(awake, sleep_total) %>% 
  summary()


# Summarize your Data

msleep %>% 
  drop_na(vore) %>% 
  group_by(vore) %>% 
  summarise(Lower = min(sleep_total),
            Average = mean(sleep_total),
            Upper = max(sleep_total),
            Difference = max(sleep_total) - min(sleep_total)) %>% 
  arrange(Average) %>% 
  view()




# Table Creation

unique(msleep$order)

table(msleep$vore)

msleep %>% 
  select(vore, order) %>% 
  filter(order %in% c("Rodentia", "Cingulata")) %>% 
  table()









###########################
# Visualize your Data

# To see the different point shapes commonly used in R, type this:
show_point_shapes()

plot(pressure)

# The grammar of Graphics
   # data
   # Mapping [Aesthetics(color, shape, size etc..), X-axis, Y-axis]
   # Geometry (Barchart, Histogram, Scatterplot etc)

library(ggplot2)
library(tidyverse)

# Barplot
ggplot(data = starwars,
       mapping = aes(x = gender)) +
  geom_bar()  # Geometry is Bar



# Histogram


starwars %>% 
  drop_na(height) %>% 
  ggplot(aes(height)) +
  geom_histogram()  



# Geometry is Histogram


# Boxplot



starwars %>% 
  drop_na(height) %>% 
  ggplot(mapping = aes(height)) +
  geom_boxplot(fill = "steelblue") +
  theme_classic() +
  labs(title = "Boxplot of Height",
       x = "Height of the Characters")



# Density Plot 



starwars %>% 
  drop_na(height) %>% 
  filter(sex %in% c("male", "female")) %>% 
  ggplot(aes(height, color = sex, fill = sex)) +
  geom_density(alpha = 0.4) +
  theme_bw()+
  ggsave("plot.png",
         width = 10,
         height = 7,
         units = "cm",
         dpi = 300)





# Scatter Plot



starwars %>%
  filter(mass < 200) %>% 
  ggplot(aes(height, mass, color = sex)) +
  geom_point(size = 5, alpha = 0.4) +
  theme_minimal() +
  labs(title = "Height and mass by sex")





# Smoothed Model



starwars %>%
  filter(mass < 200) %>% 
  ggplot(aes(height, mass, color = sex)) +
  geom_point(size = 3, alpha = 0.6) +
  #geom_smooth() +
  facet_wrap(~sex) +
  theme_minimal() +
  labs(title = "Height and mass by sex") 
  ggsave("plot.png",
         width = 10,
         height = 7,
         units = "cm",
         dpi = 300)




###########################
# Analyze your Data

#### Hypothesis Testing
# Ho: There is no difference of Life expectancy between two countries
# H1: There is a significant difference of Life expectancy between two countries
  
# t-test

library(gapminder)
view(gapminder)


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
p + ggsave("plot.png",
           width = 10,
           height = 7,
           units = "cm",
           dpi = 300)





library(gapminder)

gapminder %>% 
  filter(continent %in% c("Africa", "Europe")) %>% 
  t.test(lifeExp ~ continent, data = .,
         alternative = "two.sided",
         paired = FALSE)



# ANOVA



df <- gapminder %>% 
  select(continent, lifeExp) %>% 
  filter(continent %in% c("Americas", "Europe", "Asia"))
view(df)


library(plyr)
mu <- ddply(df, "continent", summarise, grp.mean = mean(lifeExp))
head(mu)

# Change density plot line colors by groups
df %>% 
  ggplot(aes(lifeExp, color = continent)) +
  geom_density()

# Add mean lines
p <- df %>% 
  ggplot(aes(lifeExp, color = continent)) +
  geom_boxplot() +
  geom_vline(data = mu, aes(xintercept = grp.mean, 
                            color = continent),
             linetype = "dashed") +
  theme_classic() +
  labs(title = "Life Expectancy in Africa and Europe",
       x = "Life Expectancy",
       y = "Probability")
p + ggsave("plot.png",
           width = 10,
           height = 7,
           units = "cm",
           dpi = 300)






df <- gapminder %>% 
  select(continent, lifeExp) %>% 
  filter(continent %in% c("Americas", "Europe", "Asia"))
view(df)


library(plyr)
mu <- ddply(df, "continent", summarise, grp.mean = mean(lifeExp))
head(mu)

# Change density plot line colors by groups
df %>% 
  ggplot(aes(lifeExp, color = continent)) +
  geom_density()

# Add mean lines
p <- df %>% 
  ggplot(aes(lifeExp, color = continent)) +
  geom_boxplot() +
  geom_vline(data = mu, aes(xintercept = grp.mean, 
                            color = continent),
             linetype = "dashed") +
  theme_classic() +
  labs(title = "Life Expectancy in Africa and Europe",
       x = "Life Expectancy",
       y = "Probability")
p + ggsave("plot.png",
           width = 10,
           height = 7,
           units = "cm",
           dpi = 300)



gapminder %>% 
  filter(year == 2007) %>% 
  filter(continent %in% c("Americas", "Europe", "Asia")) %>% 
  aov(lifeExp ~ continent, data = .) %>% 
  summary()



gapminder %>% 
  filter(year == 2007) %>% 
  filter(continent %in% c("Americas", "Europe", "Asia")) %>% 
  aov(lifeExp ~ continent, data = .) %>% 
  TukeyHSD()
  





### Chi Squared Test
# (for 2/1 categorical data)



view(iris)
flower <- iris %>% 
  mutate(size = cut(Sepal.Length,
                    breaks = 3,
                    labels = c("Small", "Medium","Large"))) %>%
  select(Species, size)
                    

flower

flower %>%
  ggplot(aes(x = size)) +
  geom_bar(fill = "#97B3C6") +
  labs(title = "Proportion of flowers by Size - \nSmall, Medium, and Large",
       subtitle = "Chi Squared Goodness of fit Test") +
  theme_minimal()



### Chi Squared Goodness of fit Test
# used for 1 categorical data



flower %>% 
  select(size) %>% 
  table() %>% 
chisq.test()





### Chi Squared Test of Independence 
# used for 2 categorical data
flower <- iris %>% 
  mutate(size = cut(Sepal.Length,
                    breaks = 3,
                    labels = c("Small", "Medium","Large"))) %>%
  select(Species, size)


view(flower)

flower %>%
  ggplot(aes(size, fill = Species)) +
  geom_bar() +
  scale_fill_manual(values =
                      c("setosa" = "#194294",
                        "virginica" = "#0557fa",
                        "versicolor" = "#719AC9")) +
  labs(title = "Species of Iris by Size",
       subtitle = "Chi Squared Test of Independence",
       x = "Size",
       y = "Count") +
  theme_bw()




scale_color_manual(values =
                     c("setosa" = "#719AC9",
                       "virginica" = "#75B99C",
                       "versicolor" = "#C98D71"))

scale_fill_brewer(palette = "Set2")



flower %>% 
  table() %>% 
  chisq.test()





## Linear Model
view(cars)

head(cars, 5)



cars %>% 
  lm(dist ~ speed, data = .) %>%  
  summary()

view(cars)
names(cars)


# dependent variable ~ independent variable

ggplot(cars,
       aes(speed, dist))+
  geom_point(position="jitter", size = 4, alpha = 1, color= "#97B3C6")+
  geom_smooth(method = "lm", color= "red", se = T) +
  theme_bw(base_size = 25) +
  labs(title= "The Relashionship between Speed and Stopping \nDistance", 
       x = "Speed of car", y = "Distant taken to Stop") +
  #xlim(10,13) +  # x-axis r limit decide
  theme(legend.position = "none") +
  annotate("text", x = 6, y = 90,
           label = "Y-intercept = -17.5 \nSlope = 3.9 \np = 1.49e-12 \nR^2 = 0.65",
           color = "black",
           face = "bold",
           size = 6) +
  ggsave("plot.png",
         width = 30,
         height = 15,
         units = "cm",
         dpi = 300)













































