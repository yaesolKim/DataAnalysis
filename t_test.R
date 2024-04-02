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

# t-test 수행
result1 <- t.test(o, o2)
t_test_table1 <- data.frame(
  Statistics = c("t", "df", "p-value", "Mean_Original", "Mean_Original2"),
  Values = c(sprintf("%.2f", result1$statistic), sprintf("%.2f",result1$parameter), sprintf("%.2f", result1$p.value), sprintf("%.2f", mean(o, na.rm = TRUE)), sprintf("%.2f", mean(o2, na.rm = TRUE)))
)
print(t_test_table1)

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

