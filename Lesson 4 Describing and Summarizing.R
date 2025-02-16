##############################
# Describing and Summarizing #
##############################


# rename a variable
# reorder variables
# change a variable type
# select variables to work with
# filter and arrange data
# Recode values
# change data (mutate)
# conditional changes (if_else)
# Reshape data frame



# Installing and Using Packages
#install.packages("tidyverse")

library(tidyverse)
#require(tidyverse)

## Build in Data sets to practice with
data()
View(msleep)


view(msleep)     # view your data set
str(msleep)      # gives you data structure
glimpse(msleep)  # gives you variables names, data types and types of variables
head(msleep)     # gives you 1st 6 rows of your data-set
tail(msleep)     # gives you last 6 rows of your data-set


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

# create a summary table
## for each category of "vore"
## show the min, max, difference
## and average sleep_total
## and arrange by the average sleep_total


msleep %>% 
  drop_na(vore) %>% 
  group_by(vore) %>% 
  summarise(Lower = min(sleep_total),
            Average = mean(sleep_total),
            Upper = max(sleep_total),
            Difference = max(sleep_total) - min(sleep_total)) %>% 
  arrange(Average) %>% 
  view()




# creating contingency Table

library(MASS)
attach(Cars93)

glimpse(Cars93)

table(Origin)

table(AirBags, Origin)

addmargins(table(AirBags, Origin), 1)
# 1 for adding in the columns
# 2 for adding in the rows
# nothing for both

prop.table(table(AirBags, Origin), 2) * 100
# you can add 1/2 here also

round(prop.table(table(AirBags, Origin), 1) * 100)


Cars93 %>% 
  group_by(AirBags, Origin) %>% 
  summarise(number = n()) %>% 
  pivot_wider(names_from = Origin,
              values_from = number)

# number = n() means count


