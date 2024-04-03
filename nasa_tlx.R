# Load necessary libraries
library(ggplot2)
library(readxl)
library(RColorBrewer)

#datasetname <- read_excel("./FFH/exp2.xlsx", sheet = "parapet_nasa_tlx")
datasetname <- read_excel("./FFH/exp2.xlsx", sheet = "scaffold_nasa_tlx")

# Define x and y labels
label_x <- ""
label_y <- "Nasa TLX Score (7-point Likert Scale)"
datasetname$question <- factor(datasetname$question, levels = c("Mental Demand", "Physical Demand", "Temporal Demand", "Performance", "Effort", "Frustration"))

# Plotting with color condition
ggplot(datasetname, aes(x = condition_abb, y = answer, fill = condition)) +
  geom_boxplot() +
  #scale_fill_manual(values = c("#baf2e7", "#3bceb1")) + # parapet
  scale_fill_manual(values = c("#dbf3ff", "#7aafff")) + # scaffold
  facet_wrap(~question, nrow = 1, ncol = 6, labeller = label_wrap_gen(width = 5))  +
  labs(y = label_y) + # Add labels to axes
  ylim(0, 7) + # Set y-axis limits from 0 to 7
  theme(aspect.ratio = 3, legend.position = "bottom")+
  labs(fill = NULL) + xlab(NULL)