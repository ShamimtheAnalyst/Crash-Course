library(showtext)
library(sysfonts)

# Adding Google Fonts (Noto Serif Bengali)
font_add_google("Poppins", "poppins")
showtext_auto()

# Setting theme with Poppins font
theme_set(theme_test(base_size = 15) + 
            theme(text = element_text(family = "poppins")))






### Save your Plot

library(tidyverse)

iris %>%
  ggplot(aes(Sepal.Length, fill = Species)) +
  geom_density(alpha = 0.5) +
  labs(title = "Sepal Length Density Distribution",
       x = "Sepal Length",
       y = "Probability")
  
ggsave("iris plot.png",
       width = 10,
       height = 7,
       units = "cm",
       dpi = 300)


