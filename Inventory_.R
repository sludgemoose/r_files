# Set working directory
# (C:\Users\Bay\Documents\R_Projects\Inventory)
setwd("C:/Users/Bay/Documents/R_Projects/Inventory")

library(tidyverse)
library(dplyr)

# Load in the CSV (Comma Seperated Values)
inventory <- read.csv("Parts_InventoryCopy.csv")

View(inventory)

# Selecting only air filters from the data
airfilters <- inventory %>%
  filter(Type == "Air Filter")



ggplot(count,mapping = aes(x="x-axis",y="y-axis"))
