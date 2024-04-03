# Load necessary libraries
library(ggplot2)
library(readxl)
library(RColorBrewer)

# select data sheet
#excel_data <- read_excel("./FFH/exp1.xlsx", sheet = "fps_1")
#excel_data <- read_excel("./FFH/exp1.xlsx", sheet = "ftime_1")
#excel_data <- read_excel("./FFH/exp1.xlsx", sheet = "fps_2")
#excel_data <- read_excel("./FFH/exp1.xlsx", sheet = "ftime_2")

o <- excel_data$Original
o2 <- excel_data$Original2
o4 <- excel_data$Original4
o8 <- excel_data$Original8
c2 <- excel_data$Cut2
c4 <- excel_data$Cut4
c8 <- excel_data$Cut8

# normality test


# t-test 수행
t_test <- function(datasetname, label_y, color, doc_title) {

  result1 <- t.test(o, o2)
t_test_table1 <- data.frame(
  Statistics = c("t", "df", "p-value", "Mean_Original", "Mean_Original2"),
  Values = c(sprintf("%.2f", result1$statistic), sprintf("%.2f",result1$parameter), sprintf("%.2f", result1$p.value), sprintf("%.2f", mean(o, na.rm = TRUE)), sprintf("%.2f", mean(o2, na.rm = TRUE)))
)
print(t_test_table1)


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



result2 <- t.test(o, o4)
t_test_table2 <- data.frame(
  Statistics = c("t", "df", "p-value", "Mean_Original", "Mean_Original2"),
  Values = c(sprintf("%.2f", result2$statistic), sprintf("%.2f",result2$parameter), sprintf("%.2f", result2$p.value), sprintf("%.2f", mean(o, na.rm = TRUE)), sprintf("%.2f", mean(o4, na.rm = TRUE)))
)
print(t_test_table2)

result3 <- t.test(o, o8)
t_test_table3 <- data.frame(
  Statistics = c("t", "df", "p-value", "Mean_Original", "Mean_Original2"),
  Values = c(sprintf("%.2f", result3$statistic), sprintf("%.2f",result3$parameter), sprintf("%.2f", result3$p.value), sprintf("%.2f", mean(o, na.rm = TRUE)), sprintf("%.2f", mean(o8, na.rm = TRUE)))
)
print(t_test_table3)

result4 <- t.test(o, c2)
t_test_table4 <- data.frame(
  Statistics = c("t", "df", "p-value", "Mean_Original", "Mean_Original2"),
  Values = c(sprintf("%.2f", result4$statistic), sprintf("%.2f",result4$parameter), sprintf("%.2f", result4$p.value), sprintf("%.2f", mean(o, na.rm = TRUE)), sprintf("%.2f", mean(c2, na.rm = TRUE)))
)
print(t_test_table4)

result5 <- t.test(o, c4)
t_test_table5 <- data.frame(
  Statistics = c("t", "df", "p-value", "Mean_Original", "Mean_Original2"),
  Values = c(sprintf("%.2f", result5$statistic), sprintf("%.2f",result5$parameter), sprintf("%.2f", result5$p.value), sprintf("%.2f", mean(o, na.rm = TRUE)), sprintf("%.2f", mean(c4, na.rm = TRUE)))
)
print(t_test_table5)

result6 <- t.test(o, c8)
t_test_table6 <- data.frame(
  Statistics = c("t", "df", "p-value", "Mean_Original", "Mean_Original2"),
  Values = c(sprintf("%.2f", result6$statistic), sprintf("%.2f",result6$parameter), sprintf("%.2f", result6$p.value), sprintf("%.2f", mean(o, na.rm = TRUE)), sprintf("%.2f", mean(c8, na.rm = TRUE)))
)
print(t_test_table6)

