# Load necessary libraries
library(ggplot2)
library(readxl)
library(RColorBrewer)
library(dplyr)

draw_bar_plots <- function(datasetname, label_y, color, doc_title) {
  if(color == "green") {
    color_value <- c("#baf2e7", "#3bceb1") # parapet
  } else if(color == "blue") {
    color_value <- c("#dbf3ff", "#7aafff") # scaffold
  } else {
    # Default values if color doesn't match any condition
    color_value <- c("red", "green")  # You can adjust these default values as needed
  }

  mean_data <- datasetname %>%
  group_by(condition) %>%
  summarize(mean_execution_time = mean(execution_time),
            sd_execution_time = sd(execution_time))

  p <- ggplot(mean_data, aes(x = condition, y = mean_execution_time, fill = condition)) +
  geom_bar(stat = "identity", position = "dodge") +
  scale_fill_manual(values = color_value, name = NULL) + # Use values argument here
  geom_errorbar(aes(ymin = mean_execution_time - sd_execution_time, ymax = mean_execution_time + sd_execution_time),
                width = 0.2, position = position_dodge(0.9)) +
  labs(x = " ",  y = label_y) +
  ylim(0, 400) +
  theme(aspect.ratio = 2, legend.position = "bottom")

  ggsave(doc_title, plot = p)

}