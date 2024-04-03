# Load necessary libraries
library(ggplot2)
library(readxl)
library(RColorBrewer)

# Read data from Excel file
excel_data <- read_excel("./FFH/exp2.xlsx", sheet = "nasa_tlx")

label_x = "Scenario"
label_y = "Nasa TLX Score (7-point Likert Scale)"

p <- ggplot(excel_data, aes(x = factor(condition), y = q1, fill = factor(condition))) +
  geom_boxplot() +
  #labs(x = "Conditions", y = "Answer", title = "Mental Demand: How mentally demanding was the task?") +
  labs(x = label_x, y = label_y, title = "Mental Demand (the lower, the better)") +
  scale_fill_brewer(palette="Dark2") +
  theme_classic()+ coord_cartesian(ylim = c(0, 7))

print(p)

#########


variety <- factor(excel_data$question)
treatment <- factor(excel_data$condition)
note <- excel_data$answer

data <- data.frame(variety, treatment, note)

# Create the plot
ggplot(data, aes(x = variety, y = note, fill = treatment)) +
  geom_boxplot() +
  labs(x = "Treatment", y = "Answers (7-point Likert Scale)", title = "Box Plot of Note by Treatment and Variety") +
  theme_classic()

#
#c8 <- excel_data$Cut8
#
## t-test 수행
#result1 <- t.test(o, o2)
#t_test_table1 <- data.frame(
#  Statistics = c("t", "df", "p-value", "Mean_Original", "Mean_Original2"),
#  Values = c(sprintf("%.2f", result1$statistic), sprintf("%.2f",result1$parameter), sprintf("%.2f", result1$p.value), sprintf("%.2f", mean(o, na.rm = TRUE)), sprintf("%.2f", mean(o2, na.rm = TRUE)))
#)
#print(t_test_table1)