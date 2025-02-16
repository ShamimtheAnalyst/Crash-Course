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
  theme_minimal() +
  ggsave("mpg plot.png",
         width = 10,
         height = 7,
         units = "cm",
         dpi = 300)


## Bar Plot

mpg %>%
  ggplot(mapping = aes(x = class)) +
  geom_bar(fill = "#97B3C6",
           alpha = 0.8)+
  labs(title = "Number of cars in each class",
       x = "",
       y = "")+
  theme_bw()



mpg %>%
  filter(class %in% c("compact", 
                      "subcompact",
                      "midsize"),
         drv %in% c("4", "f")) %>%
  ggplot(mapping = aes(x = class, fill = drv))+
  geom_bar(alpha = 0.6, position = "stake")+
  labs(title = "Number of cars in each class",
       x = "",
       y = "",
       fill = "Drive") +
  theme_bw()


## Histogram

mpg %>%
  ggplot(aes(x = cty)) +
  geom_histogram(binwidth = 2,
                 fill = "#97B3C6",
                 alpha = 0.8) +
  labs(title = "Feul efficiency of cars in the city",
       x = "Miles per gallon",
       y = "Number of cars")+
  theme_bw()


### Density Plot

mpg %>%
  ggplot(aes(x = cty)) +
  geom_density(fill = "#97B3C6",
               alpha = 0.8) +
  labs(title = "Feul efficiency of cars in the city",
       x = "Miles per gallon",
       y = "") +
  theme_bw()


mpg %>%
  filter(drv %in% c("f", "r")) %>%
  ggplot(aes(x = cty,
             fill = drv)) +
  geom_density(alpha = 0.7) +
  labs(title = "Feul efficiency of cars in the city",
       x = "Miles per gallon",
       y = "",
       fill = "Drive") +
  theme_bw() +
  ggsave("mpg plot.png",
         width = 15,
         height = 7,
         units = "cm",
         dpi = 300)



### Boxplots

mpg %>%
  filter(cty < 25) %>%
  ggplot(aes(x = cty,
             fill = drv))+
  geom_boxplot(alpha = 0.7)+
  labs(title = "Feul efficiency of cars in the city",
       x = "Miles per gallon",
       fill = "Drive")+
  theme_bw()



### Area plots

ggplot(mpg, aes(x = displ)) +
  geom_area(aes(y = hwy, fill = "Highway")) +
  geom_area(aes(y = cty, fill = "City")) +
  labs(title = "Highway vs City driving",
       x = "Engine Displacement (L)",
       y = "Miles per Gallon",
       fill = "") +
  theme_bw()


#  Pie Chart

mpg %>% 
  ggplot(aes(" " , "freq", fill = factor(class)))+
  geom_bar(width = 1, stat = "identity")+
  theme(axis.line = element_blank(),
        plot.title = element_text(hjust=0.5))+
  labs(title="Pie Chart of class",
       fill="class",
       x=NULL,
       y=NULL,
       caption="Source: mpg")+
  coord_polar(theta = "y", start=0) + # Creating co-ordinates (circular pie)
  ggsave("mpg plot.png",
         width = 10,
         height = 7,
         units = "cm",
         dpi = 300)


ggplot(msleep, aes(factor(1), fill = vore)) +
  geom_bar() +
  coord_polar(theta = "y") +
  labs(title = " ",
       x = "",
       y = "",
       fill = "") +
  theme_bw()


# Cartestian bar chart:
ggplot(msleep, aes(vore, fill = vore)) +
  geom_bar()

# Consider the stacked bar chart that we plotted in Section 2.8:
ggplot(msleep, aes(factor(1), fill = vore)) +
  geom_bar()

# Polar bar chart:
names(mpg)

mpg %>% 
  drop_na(class) %>% 
  ggplot(aes(class, fill = class)) +
  geom_bar() +
  coord_polar() +
  theme_bw() +
  ggsave("mpg plot.png",
         width = 10,
         height = 7,
         units = "cm",
         dpi = 300)
