# Load necessary libraries
library(ggplot2)
library(readxl)
library(RColorBrewer)


# Read data from Excel file
#excel_data <- read_excel("./FFH/execution_time.xlsx", sheet = "ex2")
#excel_data <- read_excel("./FFH/execution_time.xlsx", sheet = "ex3")
#excel_data <- read_excel("./FFH/execution_time.xlsx", sheet = "ex2_ex3")
excel_data <- read_excel("./FFH/execution_time.xlsx", sheet = "ex2_ex3")

p <- ggplot(excel_data, aes(x = factor(condition), y = answer, fill = factor(condition))) +
  geom_boxplot() +
  #labs(x = "Conditions", y = "Answer", title = "Mental Demand: How mentally demanding was the task?") +
  labs(x = "Conditions", y = "Execution Time (sec)", title = "") +
  #scale_fill_manual(values=c("#999999", "#E69F00", "#56B4E9", "#56B4E9")) +
  scale_fill_brewer(palette="Dark2")

print(p)