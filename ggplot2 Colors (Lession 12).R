



#install.packages("RColorBrewer")
library(RColorBrewer)
library(tidyverse)


display.brewer.all(colorblindFriendly = TRUE)


  
### Type - 1 

mpg %>% 
  ggplot(aes(displ, hwy,
             color = drv)) +
  geom_jitter(size = 5) +
  scale_color_brewer(palette = "Set2") +
  theme_minimal()


### Type - 2  # Take Control

mpg %>%
  ggplot(aes(displ, hwy)) +
  geom_jitter(color = "#97B3C6",
              size = 5) +
  theme_minimal()
  



### Type - 3  # Be Specific

mpg %>% 
  ggplot(aes(displ, hwy,
             color = drv)) +
  geom_jitter(size = 3) +
  scale_color_manual(values = c("4" = "blue",
                                "f" = "red",
                                "r" = "green")) +
  theme_minimal() 


### Type - 4  # Be even more specific

mpg %>%
  ggplot(aes(displ, hwy, color = drv))+
  geom_jitter(size = 5, alpha = 0.5)+
  scale_color_manual(values =
                       c("4" = "#719AC9",
                         "f" = "#75B99C",
                         "r" = "#C98D71"))+
  theme_minimal()
  


