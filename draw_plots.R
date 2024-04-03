# Load necessary libraries
library(ggplot2)
library(readxl)
library(RColorBrewer)


draw_box_plots <- function(datasetname, label_y, color, rows, cols) {

  if(color == "green") {
    values <- c("#baf2e7", "#3bceb1") # parapet
  } else if(color == "blue") {
    values <- c("#dbf3ff", "#7aafff") # scaffold
  } else {
    # Default values if color doesn't match any condition
    values <- c("red", "green")  # You can adjust these default values as needed
  }

  ggplot(datasetname, aes(x = condition_abb, y = answer, fill = condition_abb)) +
    geom_boxplot() +
    scale_fill_manual(values = values) + # Use values argument here
    #facet_wrap(~question, nrow=rows, ncol=cols, labeller = label_wrap_gen(width = 5))  +
    facet_wrap(~question, nrow=rows, ncol=cols)  +
    labs(y = label_y) + # Add labels to axes
    ylim(0, 7) + # Set y-axis limits from 0 to 7
    theme(aspect.ratio = 3, legend.position = "bottom") +
    labs(fill = NULL) + xlab(NULL)

}