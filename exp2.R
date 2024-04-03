# script to analyze and draw plots for nasa tlx data
library(ggplot2)
library(readxl)
library(RColorBrewer)

source("draw_plots.R")


# NASA-TLX
data_parapet_nasa_tlx <- read_excel("./FFH/exp2.xlsx", sheet = "parapet_nasa_tlx")
data_scaffold_nasa_tlx <- read_excel("./FFH/exp2.xlsx", sheet = "scaffold_nasa_tlx")
label_y <- "Nasa TLX Score (7-point Likert Scale)"
data_parapet_nasa_tlx$question <- factor(data_parapet_nasa_tlx$question, levels = c("Mental Demand", "Physical Demand", "Temporal Demand", "Performance", "Effort", "Frustration"))
data_scaffold_nasa_tlx$question <- factor(data_scaffold_nasa_tlx$question, levels = c("Mental Demand", "Physical Demand", "Temporal Demand", "Performance", "Effort", "Frustration"))
data_parapet_nasa_tlx$condition_abb <- factor(data_parapet_nasa_tlx$condition_abb, levels = c("VRT", "VRS"))
data_scaffold_nasa_tlx$condition_abb <- factor(data_scaffold_nasa_tlx$condition_abb, levels = c("VRT", "VRS"))
lows <- 1
cols <- 6
draw_box_plots(data_parapet_nasa_tlx, label_y, color="blue", lows, cols, doc_title="p_nasa_tlx.pdf")
draw_box_plots(data_scaffold_nasa_tlx,label_y, color="green", lows, cols, doc_title="a_nasa_tlx.pdf")



# 2 additional questions
data_parapet_2q <- read_excel("./FFH/exp2.xlsx", sheet = "parapet_2Qs")
data_scaffold_2q <- read_excel("./FFH/exp2.xlsx", sheet = "scaffold_2Qs")
label_y <- "Answer (7-point Likert Scale)"
data_parapet_2q$question <- factor(data_parapet_2q$question, levels = c("Task Control", "Presence", "A", "B"))
data_scaffold_2q$question <- factor(data_scaffold_2q$question, levels = c("Task Control", "Presence", "A", "B"))
data_parapet_2q$condition_abb <- factor(data_parapet_2q$condition_abb, levels = c("VRT", "VRS"))
data_scaffold_2q$condition_abb <- factor(data_scaffold_2q$condition_abb, levels = c("VRT", "VRS"))
lows <- 1
cols <- 4
draw_box_plots(data_parapet_2q, label_y, color="blue", lows, cols, doc_title="p_2q.pdf")
draw_box_plots(data_scaffold_2q,label_y, color="green", lows, cols, doc_title="a_2q.pdf")


# Execution time
data_parapet_time <- read_excel("./FFH/exp2.xlsx", sheet = "parapet_time")
data_scaffold_time <- read_excel("./FFH/exp2.xlsx", sheet = "scaffold_time")
data_parapet_time$condition <- factor(data_parapet_time$condition, levels = c("VRT", "VRS"))
data_scaffold_time$condition <- factor(data_scaffold_time$condition, levels = c("VRT", "VRS"))
label_y <- "Mean Execution Time (sec)"
draw_bar_plots(data_parapet_time, label_y, color="blue", doc_title="p_time.pdf")
draw_bar_plots(data_scaffold_time, label_y, color="green", doc_title="a_time.pdf")
