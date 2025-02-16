library(tidyverse)


mtcars %>%
  ggplot(aes(x = wt, y = mpg)) +
  geom_point(size = 3,
             colour = "#97B3C6",
             alpha = 0.6)+
  labs(title = "Weight vs Miles per Gallon",
       x = "Weight",
       y = "Miles per Gallon")+
  theme_bw()+
  theme(plot.title =
          element_text(size = 18,
                       face = "bold",
                       color = "steelblue",
                       hjust = 0.5)) 


## we can change the font size, color, weight etc. 
# of both the x and y axis titles and 
# the tic mark labels too


mtcars %>%
  ggplot(aes(x = wt, y = mpg)) +
  geom_point(size = 3,
             colour = "#97B3C6",
             alpha = 0.6)+
  labs(title = "Weight vs Miles per Gallon",
       x = "Weight",
       y = "Miles per Gallon") +
  theme_bw() +
  theme(plot.title =
          element_text(size = 18,
                       face = "bold",
                       color = "steelblue",
                       hjust = 0.5),
        axis.text =
          element_text(size = 10,
                       color = "black",
                       face = "bold"),
        axis.title =
          element_text(size = 13,
                       color = "purple"))



# Legend position

mtcars %>%
  ggplot(aes(x = wt, y = mpg, color = factor(gear))) +
  geom_point(size = 3,
             alpha = 0.6)+
  labs(title = "Weight vs Miles per Gallon",
       x = "Weight",
       y = "Miles per Gallon",
       color = "Gears") +
  theme_bw()+
  theme(plot.title =
          element_text(size = 18,
                       face = "bold",
                       color = "steelblue",
                       hjust = 0.5),
        axis.text =
          element_text(size = 10,
                       color = "grey",
                       face = "bold"),
        axis.title =
          element_text(size = 12,
                       color = "steelblue")) +
  theme(legend.position = "top") 



## Changing Legend position

mtcars %>%
  ggplot(aes(x = wt, y = mpg, color = factor(gear))) +
  geom_point(size = 3,
             alpha = 0.6)+
  labs(title = "Weight vs Miles per Gallon",
       x = "Weight",
       y = "Miles per Gallon",
       color = "Gears") +
  theme_bw()+
  theme(plot.title =
          element_text(size = 18,
                       face = "bold",
                       color = "steelblue",
                       hjust = 0.5),
        axis.text =
          element_text(size = 10,
                       color = "grey",
                       face = "bold"),
        axis.title =
          element_text(size = 12,
                       color = "steelblue")) +
  theme(legend.position = c(0.9,0.8)) 
  ggsave("mpg plot.png",
         width = 15,
         height = 10,
         units = "cm",
         dpi = 300)


  
# Adding annotations, lines, and arrows 
  
mtcars %>%
  ggplot(aes(x = wt, y = mpg, color = factor(gear))) +
  geom_point(size = 3,
             alpha = 0.6) +
  labs(title = "Weight vs Miles per Gallon",
       x = "Weight",
       y = "Miles per Gallon",
       color = "Gears") +
  theme_bw()+
  theme(plot.title =
          element_text(size = 18,
                       face = "bold",
                       color = "steelblue",
                       hjust = 0.5),
        axis.text =
          element_text(size = 10,
                       color = "grey",
                       face = "bold"),
        axis.title =
          element_text(size = 12,
                       color = "steelblue")) +
  theme(legend.position = c(0.9,0.8)) +
  annotate("text", x = 4, y = 30,
           label = "Notice the difference \n between cars with \n three and four gears",
           color = "black",
           face = "bold",
           size = 4) + 
  geom_segment(x = 4.5, y = 27,
               xend = 5, yend = 17,
               arrow = arrow(length = unit(0.7, "cm")),
               color = "darkred",
               size = 1.5) + 
  geom_segment(x = 3.4, y = 30,
               xend = 2.4, yend = 30,
               arrow = arrow(length = unit(0.7, "cm")),
               color = "darkgreen",
               size = 1.5) 