library(plotly)
library(dplyr)
library(htmlwidgets)

# setwd('C:/Users/Bay/Documents/R_Stuff/ShootingvsFPS_take2')

# Reading my CSV files in a seperate working directory, which could cause problems
mass_shootings <- read.csv("LOS.csv")
fps_shooters <- read.csv("fps_shooters.csv")

# Selecting amount by the years from my csv data tables 
fps_amount <- fps_shooters %>%
  group_by(R_year) %>%
  summarise(
    amount = n()
  ) %>%
  filter(
    amount>1
  )

ms_amount <- mass_shootings%>%
  group_by(R_year) %>%
  summarise(
    deaths = n()
  ) %>%
  filter(
    deaths>1
  )

# Merging the number of shootings and number of video games released in the given year
final_df <- merge(fps_amount,ms_amount)

p1 <- plot_ly(final_df) %>%
  add_trace(x = ~R_year, y = ~amount,name = 'FPS Games released',type = 'scatter',mode = 'lines') %>%
  add_trace(x = ~R_year, y = ~deaths, name = 'Number of mass shootings',type = 'scatter',mode = 'lines+markers') %>%
  layout(title = 'FPS Video Games and Mass Shootings',
         xaxis = list(side = 'left', title = 'Video games and mass shootings', showgrid = FALSE, zeroline = FALSE),
         yaxis2 = list(side = 'right', overlaying = "y", title = 'Event Type', showgrid = FALSE, zeroline = FALSE))

p1

# Save an html version of the plotly chart
# saveWidget(p1, file=paste0( getwd(), "/ggplotlyP1.html"))
