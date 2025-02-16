##########################
#### Clean your Data #####
##########################

# what is clean data?
# variable types
# select and filter
# find and deal with missing data
# find and deal with duplicates
# Recode values


# Installing and Using Packages
#install.packages("tidyverse")

library(tidyverse)
#require(tidyverse)

data()
view(starwars)

# variable types
glimpse(starwars)
class(starwars$gender)
unique(starwars$gender)


# Change variable types
starwars$gender <- as.factor(starwars$gender)
class(starwars$gender)


## Ordering of data (levels)
# Big Small Medium -> Small Medium Big

# first look at the order
levels(starwars$gender)


starwars$gender <- factor((starwars$gender),
                             levels = c("masculine",
                                        "feminine"))

levels(starwars$gender)



### Select Variables

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



## Filter observation
unique(starwars$hair_color)


starwars %>% 
  select(name, height, ends_with("Color")) %>% 
  filter(hair_color %in% c("black", "blond") &
           height < 180) 



# find and deal with missing data
mean(starwars$height)
mean(starwars$height, na.rm = TRUE)


# Don't do this 
# It'll wipe out entire rows in a data set!!!

starwars %>% 
  select(name, height, gender, hair_color) %>%
  na.omit()


## Instead do this
starwars %>% 
  select(name, height, gender, hair_color) %>%
  filter(!complete.cases(.)) 


## keep going (we'll get missing data)
starwars %>% 
  select(name, height, gender, hair_color) %>%
  filter(!complete.cases(.)) %>% 
  drop_na(height) %>% 
  view()


# now do it opposite (we'll get complete data)
starwars %>% 
  select(name, height, gender, hair_color) %>%
  filter(complete.cases(.)) %>% 
  drop_na(height) %>% 
  view()


## How to replace missing data/ dealing with missing data
starwars %>% 
  select(name, height, gender, hair_color) %>%
  filter(!complete.cases(.)) %>% 
  #mutate(hair_color1 = replace_na(hair_color, "none"))
  mutate(hair_color = replace_na(hair_color, "none")) %>% 
  view()

# hair_color1 will produce new column


# Dealing with Duplicates

names <- c("Karim", "Rahim", "Babul", "Mizan", "Karim")
age <- c(40, 42, 33, 37, 40)

Brothers <- data.frame(names, age)
Brothers

# to see which observations are duplicate (logical vector)
duplicated(Brothers)


# to see which observations are duplicate
Brothers[duplicated(Brothers), ]

# to see which observations are not duplicate
Brothers[!duplicated(Brothers), ]

# Alternative way to see which observations 
# are not duplicate
Brothers %>% 
  distinct() %>% 
  view()

# another way
distinct(Brothers)



### Recode Data
# male -> man, female -> woman
# male -> 0, female -> 1

starwars %>% 
  select(name, sex) %>% 
  mutate(sex = recode(sex, "male" = "man",
                      "female" = "woman")) %>% 
  view()



# or

starwars %>% 
  select(name, sex) %>% 
  mutate(sex = recode(sex, "male" = "0",
                      "female" = "1")) %>% 
  view()
