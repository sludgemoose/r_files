
library(dplyr)
library(shiny)
library(shinydashboard)
library(ggplot2)
library(viridis)
library(hrbrthemes)

setwd("C:/Users/Bay/Documents/R_Stuff/Netflix_Dash")

netflix_orig <- read.csv("C:/Users/Bay/Documents/R_Stuff/Netflix_Dash/titlesEdit.csv")

# Dropping the columns I don't need (Netflix id column)
netflix_df = subset(netflix_orig,select= -id)

# Creates a graph that shows the imdb scores over the years
# Now I need to find out how to put it into the shiny app
graph1 <- ggplot(netflix_df, aes(release_year,imdb_score, label = title)) +
  geom_bin_2d() +

# Data frame of only runtime, title and imdb_score
df1 <- data.frame(select(netflix_df, c('runtime', 'title', 'imdb_score')))


ggplot(df1, aes(x = title, y = runtime, size = imdb_score)) +
  geom_point(alpha= 0.5)

##########################
#SCRATCH
plot_1 <- netflix_df %>%
  ggplot(aes(x = release_year, y = runtime, size = imdb_score, label = title, color = title)) +
  geom_jitter(alpha=0.5, shape=21, color="black") +
  scale_size(range = c(.001, 10), name="IMDB Score") +
  scale_fill_viridis(discrete=TRUE, guide=FALSE, option="A") +
  theme(legend.position="bottom")

dot_plot <- ggplot(netflix_df,aes(x=release_year, y=runtime, size = imdb_score, color = title)) +
  geom_point(alpha=0.7) +
  scale_size(range = c(0.1, 3), name = "imdb_scoreulation (M)") +
  scale_color_viridis(discrete = TRUE, guide = FALSE) +
  theme_ipsum() +
  theme(legend.position="none")

dot_plot  




###########################
# ShinyApp Template
ui <- dashboardPage(
  
  dashboardHeader(title = "Netlfix Analysis"),
  
  dashboardSidebar(

      ), # Close dashboardSidebar
  
  dashboardBody(

    # Placing my html plotly chart
    includeHTML("C:/Users/Bay/Documents/R_Stuff/Netflix_Dash/ggplotlyDotchart.html")
    
    ) # Close dashboardBody

 
 
 ) # Close dashboardPage

server <- function(input, output){
  
}

shinyApp(ui = ui, server = server)
