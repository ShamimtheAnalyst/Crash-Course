


library(readxl)

my_data <- read_excel("data/friends.xlsx", 
                      sheet = 3, 
                      range = "c2:h12", 
                      na = "**")
View(my_data)



?read_excel
