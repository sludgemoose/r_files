# Libraries
library(ggplot2)
library(dplyr)
library(plotly)
library(viridis)
library(hrbrthemes)

setwd("C:/Users/Bay/Documents/R_Stuff/TestDashboard")

NF_data <- read.csv("C:/Users/Bay/Documents/R_Stuff/TestDashboard/titlesEdit.csv")
NF_data_complete <- na.omit(NF_data)

# Interactive version
p1 <- NF_data_complete %>% 
  mutate(title) %>%
  mutate(imdb_score) %>%
  mutate(release_year) %>%
  
# Reorder countries to having big bubbles on top
  arrange(desc(imdb_score))%>%

# prepare text for tooltip
  mutate(text = paste("\nTitle: ", title, "\nRelease Year: ", release_year, "\nIMDB Score: ", imdb_score, sep="")) %>%
  

# Classic ggplot
ggplot(aes(x=release_year, y=runtime, size = imdb_score, color = title)) +
  geom_point(alpha=0.7) +
  scale_size(range = c(0.1, 10), name = "imdb_scoreulation (M)") +
  scale_color_viridis(discrete = TRUE, guide = FALSE) +
  theme_ipsum() +
  theme(legend.position="none")

# turn ggplot interactive with plotly
pp1 <- ggplotly(p1)

# save the widget
# library(htmlwidgets)
# saveWidget(pp1, file=paste0( getwd(), "/HtmlWidget/ggplotlyDotchart.html"))

library(htmlwidgets)
saveWidget(pp1, file = paste0( getwd(), "/HTMLWidget/ggplotlyDotchart.html"))
