# script to analyze and draw plots for nasa tlx data
library(ggplot2)
library(readxl)
library(RColorBrewer)

# Define data source
#datasetname <- read_excel("./FFH/exp2.xlsx", sheet = "parapet_nasa_tlx") # green
datasetname <- read_excel("./FFH/exp2.xlsx", sheet = "scaffold_nasa_tlx")
label_y <- "Nasa TLX Score (7-point Likert Scale)"
datasetname$question <- factor(datasetname$question, levels = c("Mental Demand", "Physical Demand", "Temporal Demand", "Performance", "Effort", "Frustration"))
lows <- 1
cols <- 6

source("boxplots.R")

#draw_box_plots(datasetname, label_y, color="green", lows, cols)
draw_box_plots(datasetname,label_y, color="blue", lows, cols)
