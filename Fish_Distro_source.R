# Setting the working directory
setwd("C:/Users/Bay/Documents/R_Stuff/GRSM_Fish/Fish_Distro")

library(tidyverse)
library(dplyr)
library(ggplot2)

#Load the Fish distribution .csv file
fish <- read.csv("GRSM_FISH_DISTRO.csv")

#Filter to create a data set of only fish found in Tennessee
tn_fish <- fish %>%
  filter(STATE == "Tennessee")

# Filtering to create a data set of only fish found in Sevier County
sevier_county_fish <- fish %>%
  filter(COUNTY == "Sevier")


# Making a table frame from the fish of Sevier county
tbl_df(sevier_county_fish)
   
# Making a graph plot of stream lengths and stream names within Sevier County  
p1 <- ggplot(sevier_county_fish, aes(x = STREAMNAME, y = STREAM_LENGTH)) +
  geom_point()

# Rotating the axis text 90 degrees counterclockwise
p1 + theme(axis.text.x = element_text(angle=90))

#Now we can visualize which streams in Sevier County have the longest stream lengths