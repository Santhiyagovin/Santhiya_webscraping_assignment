#importing libraries
library(rvest)
library(dplyr)
library(robotstxt)
library(stringr)

# SCRAPING WEBSITE
link<- "https://auto.mahindra.com/suv"

# Allowability
path = paths_allowed(link)

#HTML ELEMENTS FROM weBSITES
web <- read_html(link)

# SGREGATING NAMES
name <- web %>% html_nodes("strong") %>% html_text()

#VIEW NAMe
View(name)
#SEGREGATING PRICE
Price <- web %>% html_nodes(".fc-grid-item-price") %>% html_text()

#VIew PRice
View(Price)

#SEGREGATE Showroom price
Showroom <- web %>% html_node(".fc-grid-item-details") %>% html_text()

#VIEW BATTERY\
View(Showroom)

#CREATING DATAFRAME
san.dy<-data.frame(name, Price, Showroom)

#EXPORT DATAFRAME
write.csv(san.dy,"Mahendra cars.csv")

