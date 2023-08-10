# Grabbing all the packages I need
library(ggplot2)
library(dplyr)
library(plotly)
library(viridis)
library(hrbrthemes)

setwd("C:/Users/Bay/Documents/R_Stuff/MassShootings")

# Reading my CSV files on my drive (C:/Users/Bay/Documents/R_Stuff/MassShootings)

fps_shooters <- read.csv("C:/Users/Bay/Documents/R_Stuff/MassShootings/fps_shooters.csv")
mass_shootings <- read.csv("C:/Users/Bay/Documents/R_Stuff/MassShootings/LOS.csv")
ShooterFPSInjury <- read.csv("C:/Users/Bay/Documents/R_Stuff/MassShootings/ShooterFPSInjury.csv")

# Selecting amount by the years from my csv data tables 
fps_years_amount <- fps_shooters %>%
  group_by(R_year) %>%
  summarise(
    n = n()
  ) %>%
  filter(
    n>1
  )

mass_shootings_amount <- mass_shootings%>%
  group_by(R_year) %>%
  summarise(
    n = n()
  ) %>%
  filter(
    n>1
  )

# Scatter plot the amount of FPS video games by year
fps_graph <- ggplot(fps_years_amount, aes(x=R_year, y=n)) +
  geom_point() +
  geom_line() +
  labs(y= "Number of Mass Shootings", x = "Year")

# Scatter plot of amount of mass shootings by year
ms_graph <- ggplot(mass_shootings_amount, aes(x=R_year, y=n)) +
  geom_point() +
  geom_line() +
  labs(y= "y axis name", x = "x axis name")

  # Adding the line graph and points for the FPS video game
  # X = Year date, Y = Number of FPS video games released that year
  geom_line(data=fps_years_amount, aes(R_year, y=n)) +
  geom_point(data=fps_years_amount, aes(R_year, y=n)) +
  
  # Adding the line graph and points for the Mass shootings
  # X = Year date, Y = Number of mass shootings in that year
  geom_line(data=mass_shootings_amount, aes(R_year, y=n, color ="red")) +
  geom_point(data=mass_shootings_amount, aes(R_year, y=n, color ="red")) +
  
# Inserting labels that help identify things
  labs(x= "Year", y = "x axis name") 

#############################
  
  # Interactive version
yup <- fps_years_amount %>%

  # Reorder countries to having big bubbles on top
  arrange(desc(R_year)) %>%

  # prepare text for tooltip
  mutate(text = paste("Number of FPS video games released: ", n,"\nYear: ", R_year))%>%
    
  # Classic ggplot
  ggplot(aes(x=R_year, y=n, text=text)) +
  geom_point(alpha=0.5) +
  scale_size(range = c(1, 2), name="Population (M)") +
  scale_color_viridis(discrete=TRUE, guide=FALSE) +
  theme_ipsum() +
  theme(legend.position="none")

  # turn ggplot interactive with plotly
pp <- ggplotly(yup, tooltip="text")

