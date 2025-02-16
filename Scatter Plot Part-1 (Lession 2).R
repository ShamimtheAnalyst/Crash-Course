library(tidyverse)



data()
?mpg
view(mpg)
names(mpg)










mpg %>% 
  filter(hwy < 35) %>% 
  ggplot(aes(x = displ, 
             y = hwy, 
             color =  drv)) +
  geom_point() +
  geom_smooth(method = lm, se = FALSE) +
  labs(x = "Engine Size",
       y = "MPG in the Highway",
       title = "Fuel Efficiency") +
  theme_bw() +
  ggsave("Mpg_graphics.jpg")






mpg %>% 
  filter(hwy < 35) %>% 
  ggplot(aes(displ, hwy)) +
  geom_point(aes(color = drv)) +
  geom_smooth(method = lm, se = FALSE) +
  labs(x = "Engine Size",
       y = "MPG in the Highway",
       title = "Fuel Efficiency") +
  theme_bw() 



mpg %>% 
  filter(hwy < 35) %>% 
  ggplot(aes(displ, hwy)) +
  geom_point(aes(color = drv)) +
  geom_smooth() +
  labs(x = "Engine Size",
       y = "MPG in the Highway",
       title = "Fuel Efficiency") +
  theme_bw()



#  ggsave("MPH_hwy.jpg")
