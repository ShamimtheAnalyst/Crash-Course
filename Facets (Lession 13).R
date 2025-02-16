### Facet Wrap


# install.packages("gapminder")
library(gapminder)
view(gapminder)


## Using facets

gapminder %>%
  filter(gdpPercap < 40000 &
           continent != "Oceania") %>%
  ggplot(mapping = aes(x = gdpPercap,
                       y = lifeExp,
                       colour = continent))+
  geom_point(shape = "square",
             alpha = 0.4,
             size = 2)+
  labs(title = "Life Expectancy as a function of Wealth",
       x = "GDP per Capita",
       y = "Life Expectancy",
       colour = "Region")+
  theme_bw() 


### facet_wrap
# Type - 1

gapminder %>%
  filter(gdpPercap < 40000 &
           continent != "Oceania") %>%
  ggplot(mapping = aes(x = gdpPercap,
                       y = lifeExp,
                       colour = year))+
  geom_jitter(shape = "square",
              alpha = 0.4,
              size = 2)+
  geom_smooth()+
  facet_wrap(~continent)+
  labs(title = "Life Expectancy as a function of Wealth",
       x = "GDP per Capita",
       y = "Life Expectancy")+
  theme_bw() 




# Type - 2

library(forcats)
view(gss_cat)


gss_cat %>%
  filter(partyid %in% c("Strong democrat",
                        "Strong republican",
                        "Independent")) %>%
  ggplot(aes(age))+
  geom_histogram(binwidth = 5,
                 fill = "#97B3C6",
                 alpha = 0.8)+
  facet_wrap(~ partyid,
             nrow = 1,
             ncol = 3,
             strip.position = "bottom") +
  labs(title = "Age distribution by political affiliation",
       x = "",
       y = "") +
  theme_bw() 



### facet_grid

gss_cat %>%
  mutate(relig = recode(relig,
                        "Moslem/islam" = "Muslim")) %>%
  filter(relig %in% c("Christian",
                      "Muslim") &
           partyid %in% c("Strong democrat",
                          "Strong republican",
                          "Independent") &
           tvhours<10) %>%
  ggplot(aes(x = tvhours,
             color = partyid,
             fill = partyid)) +
  geom_density(alpha = 0.3, show.legend = F) +
  facet_grid(relig ~ partyid) +
  labs(title = "TV watching by political and religious affiliation",
       x = "Hour spent watching TV",
       y = "") +
  theme_bw() +
  ggsave("mpg plot.png",
         width = 15,
         height = 10,
         units = "cm",
         dpi = 300)


