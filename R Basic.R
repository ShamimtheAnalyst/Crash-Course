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


# Addition
5 + 6

x <- 5
y <- 6

x + y

sum(x, y)


# Substraction
7 - 3

# Multiplication
3 * 7

# Divison
7/3

# Exponentiation
2^3

# Modulo: returns the remainder of the division of 8/3
8 %% 3


## Basic arithmetic functions
# Logarithms and Exponentials:
  
log2(x) # logarithms base 2 of x
log10(x) # logaritms base 10 of x
exp(x) # Exponential of x


# Trigonometric functions:

cos(x) # Cosine of x
sin(x) # Sine of x
tan(x) #Tangent of x
acos(x) # arc-cosine of x
asin(x) # arc-sine of x
atan(x) #arc-tangent of x

## Other mathematical functions
abs(x) # absolute value of x
sqrt(x) # square root of x

# Assigning values to variables

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

