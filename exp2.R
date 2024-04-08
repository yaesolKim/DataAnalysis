# script to analyze and draw plots for nasa tlx data
library(ggplot2)
library(readxl)
library(RColorBrewer)

source("draw_plots.R")
source("analysis_difference.R")

# NASA-TLX
if(TRUE)
{
  data_p_nasa_tlx <- read_excel("./FFH/exp2.xlsx", sheet = "p_nasa_tlx")
  data_a_nasa_tlx <- read_excel("./FFH/exp2.xlsx", sheet = "a_nasa_tlx")
  label_y <- "Nasa TLX Score (7-point Likert Scale)"
  data_p_nasa_tlx$question <- factor(data_p_nasa_tlx$question, levels = c("Mental Demand", "Physical Demand", "Temporal Demand", "Performance", "Effort", "Frustration"))
  data_a_nasa_tlx$question <- factor(data_a_nasa_tlx$question, levels = c("Mental Demand", "Physical Demand", "Temporal Demand", "Performance", "Effort", "Frustration"))
  data_p_nasa_tlx$question_abb <- factor(data_p_nasa_tlx$question_abb, levels = c("MD", "PD", "TD", "P", "E", "F"))
  data_a_nasa_tlx$question_abb <- factor(data_a_nasa_tlx$question_abb, levels = c("MD", "PD", "TD", "P", "E", "F"))
  data_p_nasa_tlx$condition_abb <- factor(data_p_nasa_tlx$condition_abb, levels = c("VRT", "VRS"))
  data_a_nasa_tlx$condition_abb <- factor(data_a_nasa_tlx$condition_abb, levels = c("VRT", "VRS"))
  lows <- 1
  cols <- 6

  #check_normality_B(data_p_nasa_tlx, group1 = "VRT", group2 = "VRS", data="answer")
  #check_normality_B(data_a_nasa_tlx, group1 = "VRS", group2 = "VRS", data="answer")


  #wilcox_test_B(data_p_nasa_tlx, group1 = "VRT", group2 = "VRS", qu = "F", data="answer")
  #wilcox_test_B(data_a_nasa_tlx, group1 = "VRT", group2 = "VRS", qu = "F", data="answer")


  draw_box_plots(data_p_nasa_tlx, label_y, color="blue", lows, cols, doc_title="p_nasa_tlx.pdf")
  draw_box_plots(data_a_nasa_tlx, label_y, color="green", lows, cols, doc_title="a_nasa_tlx.pdf")
}


# 2 additional questions
if(TRUE)
{
 data_p_2q <- read_excel("./FFH/exp2.xlsx", sheet = "parapet_2Qs")
 data_a_2q <- read_excel("./FFH/exp2.xlsx", sheet = "scaffold_2Qs")
 label_y <- "Answer (7-point Likert Scale)"
 data_p_2q$question <- factor(data_p_2q$question, levels = c("Task Control", "Presence", "A", "B"))
 data_a_2q$question <- factor(data_a_2q$question, levels = c("Task Control", "Presence", "A", "B"))
 data_p_2q$condition_abb <- factor(data_p_2q$condition_abb, levels = c("VRT", "VRS"))
 data_a_2q$condition_abb <- factor(data_a_2q$condition_abb, levels = c("VRT", "VRS"))
 lows <- 1
 cols <- 4

  #check_normality_B(data_p_2q, group1 = "VRT", group2 = "VRS", qu = "Task Control", data="answer")
  #check_normality_B(data_a_2q, group1 = "VRT", group2 = "VRS", qu = "Task Control", data="answer")

  #wilcox_test_B(data_p_2q, group1 = "VRT", group2 = "VRS", qu = "Presence", data="answer")
  #wilcox_test_B(data_a_2q, group1 = "VRT", group2 = "VRS", qu = "Presence", data="answer")

  draw_box_plots(data_p_2q, label_y, color="blue", lows, cols, doc_title="p_2q.pdf")
  draw_box_plots(data_a_2q,label_y, color="green", lows, cols, doc_title="a_2q.pdf")
}

# Execution time
if(TRUE)
{
  data_p_time <- read_excel("./FFH/exp2.xlsx", sheet = "parapet_time")
  data_a_time <- read_excel("./FFH/exp2.xlsx", sheet = "scaffold_time")
  data_p_time$condition <- factor(data_p_time$condition, levels = c("VRT", "VRS"))
  data_a_time$condition <- factor(data_a_time$condition, levels = c("VRT", "VRS"))
  label_y <- "Mean Execution Time (sec)"

  #check_normality_A(data_p_time, group1 = "VRT", group2 = "VRS", data="execution_time")
  #check_normality_A(data_scaffold_time, group1 = "VRT", group2 = "VRS", data="execution_time")
#
  #wilcox_test_A(data_p_time, group1 = "VRT", group2 = "VRS", data="execution_time")
  #wilcox_test_A(data_scaffold_time, group1 = "VRT", group2 = "VRS", data="execution_time")
#
  draw_bar_plots(data_p_time, label_y, color="blue", doc_title="p_time.pdf")
  draw_bar_plots(data_a_time, label_y, color="green", doc_title="a_time.pdf")
}