# Load necessary libraries
library(ggplot2)
library(readxl)
library(RColorBrewer)


# Read data from Excel file
#excel_data <- read_excel("./FFH/execution_time.xlsx", sheet = "ex2")
#excel_data <- read_excel("./FFH/execution_time.xlsx", sheet = "ex3")
#excel_data <- read_excel("./FFH/execution_time.xlsx", sheet = "ex2_ex3")
excel_data <- read_excel("./FFH/questionnaires.xlsx", sheet = "Sheet3")

variety <- factor(excel_data$question)
treatment <- factor(excel_data$condition)
note <- excel_data$answer

data <- data.frame(variety, treatment, note)

# Create the plot
ggplot(data, aes(x = variety, y = note, fill = treatment)) +
  geom_boxplot() +
  labs(x = "Treatment", y = "Answers (7-point Likert Scale)", title = "Box Plot of Note by Treatment and Variety") +
  theme_classic()
