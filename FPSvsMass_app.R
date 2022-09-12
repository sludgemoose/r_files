#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(plotly)

# setwd("C:/Users/Bay/Documents/R_Stuff/ShootingvsFPS_take2")

# Define UI for application 
ui <- fluidPage(
  titlePanel("Violence and Video Games"),
  
  mainPanel(p("Let's look at a list of video games that have been released and the amount of mass shootings that have happened in the past few decades.")),
  
  plotlyOutput(outputId = "p1" )

  ) # Close fluidPage

# Define server logic 
server <- function(input, output) {
  
  output$p1 <- renderPlotly(ggplotly(p1))

  } # Close server


# Run the application 
shinyApp(ui = ui, server = server)
