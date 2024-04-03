# script to analyze and draw plots for nasa tlx data
library(ggplot2)
library(readxl)
library(RColorBrewer)

# Define data source

datasetname <- read_excel("./FFH/exp2.xlsx", sheet = "parapet_2Qs") # green
#datasetname <- read_excel("./FFH/exp2.xlsx", sheet = "scaffold_2Qs")

source("boxplots.R")

draw_box_plots(datasetname, color="green")
#draw_box_plots(datasetname, color="blue")
